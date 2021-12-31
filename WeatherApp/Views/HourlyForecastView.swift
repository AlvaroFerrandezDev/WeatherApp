//
//  HourlyForecastView.swift
//  WeatherApp
//
//  Created by Álvaro Ferrández Gómez on 30/12/21.
//

import SwiftUI

struct HourlyForecastView: View {
    let hourlyForecast: [Hourly]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Array(hourlyForecast.enumerated()), id: \.offset) { offset, forecast in
                    VStack(spacing: 25) {
                        Text(offset == 0 ? "Ahora" : forecast.formattedDate)
                            .fontWeight(.heavy)
                            .font(.system(size: 18))

                        Image(systemName: forecast.iconName)
                            .foregroundColor(offset == 0 ? Color.white : Color.yellow)

                        Text(forecast.formattedTemp)
                            .fontWeight(.medium)
                            .font(.system(size: 16))
                    }
                    .frame(width: 99, height: 163)
                    .background(offset == 0 ? Color.yellow : Color.white)
                    .modifier(CardModifier())
                }
            }.padding([.top, .bottom])
        }
    }
}

struct HourlyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        if let hourlyWeather = WeatherService.shared.json?.hourly {
            HourlyForecastView(hourlyForecast: hourlyWeather)
        }
    }
}
