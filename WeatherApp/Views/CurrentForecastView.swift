//
//  CurrentForecastView.swift
//  WeatherApp
//
//  Created by Álvaro Ferrández Gómez on 28/12/21.
//

import SwiftUI

struct CurrentForecastView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "cloud")

                VStack(alignment: .leading) {
                    Text("Today")
                        .font(.system(size: 18))
                        .fontWeight(.medium)

                    Text("Fri, 07 Jan")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
            }

            Text("32º")
                .font(.system(size: 80))
                .fontWeight(.light)
                .foregroundColor(.yellow)

            Text("Boston, MA")
                .font(.system(size: 16))
                .fontWeight(.medium)
        }
        .frame(maxWidth: UIScreen.main.bounds.width - 10, maxHeight: 200)
        .background(.white)
        .cornerRadius(8)
        .shadow(color: .init(.sRGB, white: 0.2, opacity: 0.25), radius: 4, x: 0, y: 4)
    }
}

struct CurrentForecastView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentForecastView()
    }
}
