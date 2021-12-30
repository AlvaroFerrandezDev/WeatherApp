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
        return dateFormatter.string(from: date)
    }

    var formattedTemp: String {
        "\(temp)º"
    }
}
