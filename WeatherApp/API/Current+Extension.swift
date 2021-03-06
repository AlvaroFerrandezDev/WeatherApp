//
//  Current+Extension.swift
//  WeatherApp
//
//  Created by Álvaro Ferrández Gómez on 28/12/21.
//

import CoreLocation
import Foundation

extension Current {
    var formattedDate: String {
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM"
        dateFormatter.locale = .init(identifier: "es_ES")
        return dateFormatter.string(from: date).capitalized
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
