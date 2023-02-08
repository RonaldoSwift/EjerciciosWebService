//
//  MenuTabView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 7/02/23.
//

import SwiftUI

struct MenuTabView: View {
    @State private var selection = 1
    var body: some View {
        TabView(selection: $selection){
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(1)
            
            FavoritosView()
                .tabItem {
                    Label("Favoritos", systemImage: "heart")
                }
                .tag(2)
        }
        .background(Color("ColorPrincipal"))
        .navigationTitle(selection == 1 ? "Home (\(UserDefaults.standard.integer(forKey: "CantidadFavoritos")))" : "Favoritos")

    }
}

struct MenuTabView_Previews: PreviewProvider {
    static var previews: some View {
        MenuTabView()
    }
}
