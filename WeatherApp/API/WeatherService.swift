//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Álvaro Ferrández Gómez on 28/12/21.
//

import CoreLocation
import Foundation

final class WeatherService {
    static let shared = WeatherService()

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

    func fetchCity() {
        guard let json = json else { return }
        CLGeocoder().reverseGeocodeLocation(.init(latitude: json.lat, longitude: json.lon)) { placemarks, _ in
            let city = placemarks?.first.flatMap {
                "\($0.locality) , \($0.administrativeArea)"
            } ?? "Error..."
        }
    }
}
