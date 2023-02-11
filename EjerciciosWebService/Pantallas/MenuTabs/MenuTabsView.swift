//
//  MenuTabsView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 9/02/23.
//

import SwiftUI

struct MenuTabsView: View {
    @State private var selection = 1
    var body: some View {
        TabView(selection: $selection){
            VerMaravillasView()
                .tabItem {
                    Label("Home",systemImage: "house.fill")
                }
                .tag(1)
            LikesView()
                .tabItem {
                    Label("Likes",systemImage: "heart.fill")
                }
                .tag(2)
            
        }
        .background(Color("ColorPrincipal"))
        .navigationTitle(selection == 1 ? "Home (\(UserDefaults.standard.integer(forKey: "CantidadFavoritos")))" : "Favoritos")
    }
}

struct MenuTabsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuTabsView()
    }
}
