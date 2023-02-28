//
//  InfoTapsView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 23/02/23.
//

import SwiftUI

struct InfoTapsView: View {
    @State private var selection = 1
    var body: some View {
        TabView(selection: $selection){
            NavigationView {
                HomePageView()
            }
            .tabItem {
                Label("Home",systemImage: "house.fill")
            }
            .tag(1)
            
            PlayListView()
                .tabItem {
                    Label("Playlist",systemImage: "music.note.list")
                }
                .tag(2)
            
            HistoryView()
                .tabItem {
                    Label("History",systemImage: "clock")
                }
                .tag(3)
            ProfilView()
                .tabItem {
                    Label("Profil",systemImage: "person")
                }
                .tag(4)
        }
        .accentColor(Color.white)
        .navigationTitle(selection == 1 ? "Home (\(UserDefaults.standard.integer(forKey: "CantidadFavoritos")))" : "Favoritos")
        .navigationBarBackButtonHidden(true)    }
}

struct InfoTapsView_Previews: PreviewProvider {
    static var previews: some View {
        InfoTapsView()
    }
}
