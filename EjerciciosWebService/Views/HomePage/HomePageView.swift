//
//  HomePageView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 22/02/23.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        ZStack{
            Color.black
            VStack{
                HStack{
                    Image("Lupa")
                        .resizable()
                        .frame(width: 24,height: 24)
                        .padding(.trailing,60)
                    LogoDeSpotify()
                    Image("Ajustes")
                        .resizable()
                        .frame(width: 24,height: 24)
                        .padding(.leading,60)
                    
                }
                
            }
            .padding()
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
