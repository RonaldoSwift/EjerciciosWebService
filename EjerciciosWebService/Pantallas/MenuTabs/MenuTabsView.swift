//
//  MenuTabsView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 9/02/23.
//

import SwiftUI

struct MenuTabsView: View {
    var body: some View {
        TabView{
            VerMaravillasView()
                .tabItem {
                    Label("Home",systemImage: "house.fill")
                }
            LikesView()
                .tabItem {
                    Label("Likes",systemImage: "heart.fill")
                }
            
        }
    }
}

struct MenuTabsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuTabsView()
    }
}
