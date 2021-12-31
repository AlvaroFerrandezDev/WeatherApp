//
//  ContentView.swift
//  WeatherApp
//
//  Created by Álvaro Ferrández Gómez on 28/12/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var weatherService = WeatherService.shared
    @State var isPermissionDisabled: Bool = true

    var body: some View {
        if let json = weatherService.liveForecast, !isPermissionDisabled {
            ScrollView(.vertical) {
                VStack(alignment: .trailing, spacing: 0) {
                    HeaderView(action: {})

                    if let current = json.current {
                        CurrentForecastView(current: current, city: weatherService.city)
                            .padding()
                    }

                    if let hourly = json.hourly {
                        HourlyForecastView(hourlyForecast: hourly)
                            .padding()
                    }

                    DetailsSection(action: {})

                    if let daily = json.daily {
                        DailyForecastView(dailyForecast: daily)
                            .padding()
                    }
                }
            }

        } else {
            ProgressView("Cargando")
                .onChange(of: weatherService.authorizationStatus) { value in
                    if value == .authorizedWhenInUse || value == .authorizedAlways {
                        isPermissionDisabled = false
                    }
                }
                .sheet(isPresented: $isPermissionDisabled, content: { PermissionView(action: {
                    if weatherService.authorizationStatus == .notDetermined {
                        weatherService.locationManager.requestWhenInUseAuthorization()
                    } else {
//                        if let url = URL(string: UIApplication.openSettingsURLString) {
//                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//                        }
                    }
                })
                })
                .onAppear(perform: {
                    if weatherService.authorizationStatus == .authorizedWhenInUse {
                        weatherService.locationManager.requestLocation()
                    }
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
