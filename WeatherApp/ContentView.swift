//
//  ContentView.swift
//  WeatherApp
//
//  Created by Álvaro Ferrández Gómez on 28/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Spacer()

                Text("Weather Forecast")

                Spacer()

                Button(action: {}) {
                    Image(systemName: "square.stack.3d.forward.dottedline")
                        .foregroundColor(.black)
                }
                .padding()
            }

            
            CurrentForecastView()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
