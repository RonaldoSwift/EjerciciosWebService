//
//  MenuPrincipalView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 13/02/23.
//

import SwiftUI

struct MenuPrincipalView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Image("FondoPrincipal")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    LogoGeneralCelda()
                    
                    Text("Find your favorite")
                        .font(.custom("Gilroy-Light", size: 30))
                    Text("Coffee Taste!")
                        .font(.custom("Gilroy-ExtraBold", size: 40))
                        .bold()
                        .frame(height: 50)

                    Text("We’re coffee shop, beer and wine bar, & event space for performing arts")
                        .multilineTextAlignment(.center)
                        .font(.custom("Gilroy-Light", size: 17))
                        .foregroundColor(Color("Letras"))
                        .padding(.bottom,30)
                    NavigationLink {
                        LoginView()
                    } label: {
                        ButtonMarron(texto: "Get Started")
                            .padding(.bottom,25)
                    }
                }
                .padding()
            }
        }
    }
}

struct MenuPrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        MenuPrincipalView()
    }
}
