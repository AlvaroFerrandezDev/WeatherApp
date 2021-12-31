//
//  DailyForecastView.swift
//  WeatherApp
//
//  Created by Álvaro Ferrández Gómez on 30/12/21.
//

import SwiftUI

struct DailyForecastView: View {
    var dailyForecast: [Daily]

    var body: some View {
        VStack(spacing: 0) {
            ForEach(0 ... 4, id: \.self) { index in
                HStack {
                    Image(systemName: dailyForecast[index].iconName)
                    Text(dailyForecast[index].formattedDate)
                        .fontWeight(.medium)
                        .font(.system(size: 16))

                    Text(dailyForecast[index].formattedDescription)
                        .fontWeight(.medium)
                        .font(.system(size: 16))

                    Spacer()

                    Text(dailyForecast[index].formattedTemp)
                        .fontWeight(.medium)
                        .font(.system(size: 16))
                }
                .padding()
                .padding([.leading, .trailing])
            }

            Button(action: {}) {
                Text("Próximos 7 días")
                    .fontWeight(.medium)
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                    .padding()
            }
        }
        .background(.white)
        .modifier(CardModifier())
    }
}

struct DailyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        if let daily = WeatherService.shared.json?.daily {
            DailyForecastView(dailyForecast: daily)
        }
    }
}
