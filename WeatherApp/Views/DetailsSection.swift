//
//  DetailsSection.swift
//  WeatherApp
//
//  Created by Álvaro Ferrández Gómez on 30/12/21.
//

import SwiftUI

struct DetailsSection: View {
    let action: () -> ()

    var body: some View {
        Button(action: action) {
            Text("Más detalles")
            Image(systemName: "chevron.right")
                .foregroundColor(.black)
                .padding([.trailing])
        }
    }
}

struct DetailsSection_Previews: PreviewProvider {
    static var previews: some View {
        DetailsSection(action: {})
    }
}
