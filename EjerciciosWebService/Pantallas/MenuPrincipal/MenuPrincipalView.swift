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
                    Spacer()

                    Image("simboloCaffe")
                        .resizable()
                        .frame(width: 51.61,height: 51.61)
                        .scaledToFit()
                    Text("Especies !")
                    Spacer()
                    
                    Text("Compra tus favoritas")
                        .font(.custom("Gilroy-Light", size: 30))
                    Text("Especias Puras!")
                        .font(.custom("Gilroy-ExtraBold", size: 40))
                        .bold()
                        .frame(height: 50)

                    Text("Comino,pimineta, canela y todo lo que necesitas para darle sabor a tus comidas")
                        .font(.custom("Gilroy-Light", size: 17))
                        .foregroundColor(Color("Letras"))
                    
                    
                    NavigationLink {
                        LoginView()
                    } label: {
                        ButtonMarron(texto: "Get Started")
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
