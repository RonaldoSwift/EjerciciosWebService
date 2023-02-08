//
//  MenuTabView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 7/02/23.
//

import SwiftUI

struct MenuTabView: View {
    var body: some View {
        TabView{
            VerCasaView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            
            
                .tabItem {
                    Label("Prueba", systemImage: "heart")
                }
            
                .tabItem {
                    Label("Prueba", systemImage: "")
                }
            
        }
        .background(Color("ColorPrincipal"))
    }
}

struct MenuTabView_Previews: PreviewProvider {
    static var previews: some View {
        MenuTabView()
    }
}
