//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Álvaro Ferrández Gómez on 28/12/21.
//

import Combine
import CoreLocation
import Foundation

final class WeatherService: NSObject, ObservableObject {
    static let shared = WeatherService()
    var objectWillChange: PassthroughSubject<String, Never> = .init()
    let locationManager = CLLocationManager()
    var cancellable: AnyCancellable?

    @Published var city: String = "Cargando..."
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var liveForecast: API?

    override init() {
        super.init()
        authorizationStatus = locationManager.authorizationStatus
        locationManager.delegate = self
    }

    var json: API? {
        let decoder = JSONDecoder()

        if let url = Bundle.main.url(forResource: "WeatherResponse", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let dataDecoded = try? decoder.decode(API.self, from: data)
        {
            return dataDecoded
        } else {
            print("Error")
        }

        return nil
    }

    struct WeatherSymbols: Codable {
        let icon: String
        let label: String
    }

    var icons: [String: WeatherSymbols]? {
        let decoder = JSONDecoder()

        if let url = Bundle.main.url(forResource: "Icons", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let dataDecoded = try? decoder.decode([String: WeatherSymbols].self, from: data)
        {
            return dataDecoded
        } else {
            print("Error")
        }

        return nil
    }

    func fetchCity(location: CLLocation) {
        CLGeocoder().reverseGeocodeLocation(.init(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)) { placemarks, _ in
            let city = placemarks?.first.flatMap {
                "\($0.locality ?? "") , \($0.administrativeArea ?? "")"
            } ?? "Error..."
            self.city = city
            self.objectWillChange.send(self.city)
        }
    }

    func fetchForecast(for location: CLLocation) -> AnyPublisher<API, Error>? {
        var components = URLComponents()
        components.path = "data/2.5/onecall"
        components.queryItems = [
            "lat": String(location.coordinate.latitude),
            "lon": String(location.coordinate.longitude),
            "units": "imperial",
            "appid": "1e9e2bd521305f5ed37296e85251136f",
            "lang": "es"
        ].compactMap {
            URLQueryItem(name: $0.key, value: $0.value)
        }

        if let url = components.url(relativeTo: URL(string: "https://api.openweathermap.org")) {
            let request = URLRequest(url: url)

            return URLSession
                .shared
                .dataTaskPublisher(for: request)
                .tryMap {
                    try JSONDecoder().decode(API.self, from: $0.data)
                }
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        }

        return nil
    }
}

extension WeatherService: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
        objectWillChange.send("")
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.sorted(by: { $0.timestamp > $1.timestamp }).first {
            cancellable = fetchForecast(for: location)?
                .mapError { error -> Error in
                    print(error)
                    return error
                }
                .sink(receiveCompletion: { [weak self] _ in
                    self?.fetchCity(location: location)
                }, receiveValue: { [weak self] api in
                    self?.liveForecast = api
                })
        }
    }
}
