//
//  PermissionView.swift
//  WeatherApp
//
//  Created by Álvaro Ferrández Gómez on 30/12/21.
//

import SwiftUI

struct PermissionView: View {
    let action: () -> ()

    var body: some View {
        VStack(spacing: 25) {
            Image(systemName: "location.fill")
                .resizable()
                .frame(width: 75, height: 75, alignment: .center)
                .foregroundColor(.blue)

            Text("Tienes que darnos permiso para obtener el pronóstico de tiempo")
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)

            Button("Permitir acceso", action: action)
                .padding()
                .background(.green)
                .cornerRadius(8)
                .shadow(radius: 10)
                .foregroundColor(.white)
        }
    }
}

struct PermissionView_Previews: PreviewProvider {
    static var previews: some View {
        PermissionView(action: {})
    }
}
