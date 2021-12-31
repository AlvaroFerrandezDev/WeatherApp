//
//  HeaderView.swift
//  WeatherApp
//
//  Created by Álvaro Ferrández Gómez on 30/12/21.
//

import SwiftUI

struct HeaderView: View {
    var action: () -> ()

    var body: some View {
        HStack {
            Spacer()
            Spacer()

            Text("Weather Forecast")

            Spacer()

            Button(action: action) {
                Image(systemName: "square.stack.3d.forward.dottedline")
                    .foregroundColor(.black)
            }
            .padding()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(action: {})
    }
}
