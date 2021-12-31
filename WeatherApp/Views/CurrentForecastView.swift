//
//  CurrentForecastView.swift
//  WeatherApp
//
//  Created by Álvaro Ferrández Gómez on 28/12/21.
//

import SwiftUI

struct CurrentForecastView: View {
    let current: Current
    let city: String

    var body: some View {
        VStack {
            HStack {
                Image(systemName: current.iconName)
                    .foregroundColor(.yellow)

                VStack(alignment: .leading) {
                    Text("Hoy")
                        .font(.system(size: 18))
                        .fontWeight(.medium)

                    Text(current.formattedDate)
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
            }

            Text(current.formattedTemp)
                .font(.system(size: 80))
                .fontWeight(.light)
                .foregroundColor(.yellow)

            Text(city)
                .font(.system(size: 16))
                .fontWeight(.medium)
        }
        .padding()
        .frame(maxWidth: UIScreen.main.bounds.width - 10, maxHeight: 200)
        .background(.white)
        .cornerRadius(8)
        .shadow(color: .init(.sRGB, white: 0.2, opacity: 0.25), radius: 4, x: 0, y: 4)
    }
}

struct CurrentForecastView_Previews: PreviewProvider {
    static var previews: some View {
        if let current = WeatherService.shared.json?.current {
            CurrentForecastView(current: current,
                                city: "Boston")
        }
    }
}
