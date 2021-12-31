//
//  CardModifier.swift
//  WeatherApp
//
//  Created by Álvaro Ferrández Gómez on 30/12/21.
//

import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(8)
            .shadow(color: .init(.sRGB, white: 0.2, opacity: 0.25), radius: 4, x: 0, y: 4)
    }
}
