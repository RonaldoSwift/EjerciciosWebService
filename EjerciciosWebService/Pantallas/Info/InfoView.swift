//
//  InfoView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 16/02/23.
//

import SwiftUI

struct InfoView: View {
    @State private var selection = 1
    var body: some View {
        TabView(selection: $selection){
            VerEspeciasView()
                .tabItem {
                    Label("",systemImage: "house.fill")
                }
                .tag(1)
            
            LikesView()
                .tabItem {
                    Label("",systemImage: "heart.fill")
                }
                .tag(2)
            
            ComprasView()
                .tabItem {
                    Label("",systemImage: "bag")
                }
                .tag(3)
            
            PerfilView()
                .tabItem {
                    Label("",systemImage: "person")
                }
                .tag(4)
        }
        .accentColor(Color.white)
        .navigationTitle(selection == 1 ? "Home (\(UserDefaults.standard.integer(forKey: "CantidadFavoritos")))" : "Favoritos")
        .navigationBarBackButtonHidden(true)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
