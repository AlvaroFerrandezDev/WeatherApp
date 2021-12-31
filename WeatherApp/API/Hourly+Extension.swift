//
//  Hourly+Extension.swift
//  WeatherApp
//
//  Created by Álvaro Ferrández Gómez on 30/12/21.
//

import CoreLocation
import Foundation

extension Hourly {
    var formattedDate: String {
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: date)
    }

    var formattedTemp: String {
        let tempPreFormat: Double = (temp - 32) / 1.8
        return "\(tempPreFormat.truncate(places: 1))º"
    }

    var iconName: String {
        let jsonIcons = WeatherService.shared.icons
        let idIcon = String(describing: weather.first?.id ?? 0)
        return (jsonIcons?[idIcon]?.icon ?? "cloud.heavyrain") + ".fill"
    }
}
