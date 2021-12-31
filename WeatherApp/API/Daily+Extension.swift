//
//  Daily+Extension.swift
//  WeatherApp
//
//  Created by Álvaro Ferrández Gómez on 30/12/21.
//

import CoreLocation
import Foundation

extension Daily {
    var formattedDate: String {
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        dateFormatter.locale = .init(identifier: "es_ES")
        return Calendar.current.isDateInToday(date) ? "Hoy" : dateFormatter.string(from: date).capitalized
    }

    var formattedTemp: String {
        let tempMinPreFormat: Double = (temp.min - 32) / 1.8
        let tempMaxPreFormat: Double = (temp.max - 32) / 1.8
        return "\(Int(tempMinPreFormat))º / \(Int(tempMaxPreFormat))º"
    }

    var formattedDescription: String {
        " ·   \(String(describing: weather.first?.weatherDescription.capitalized ?? ""))"
    }

    var iconName: String {
        let jsonIcons = WeatherService.shared.icons
        let idIcon = String(describing: weather.first?.id ?? 0)
        return (jsonIcons?[idIcon]?.icon ?? "cloud.heavyrain") + ".fill"
    }
}
