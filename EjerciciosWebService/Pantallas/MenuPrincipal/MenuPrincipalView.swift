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
                    Text("Especias Puras!")
                        .font(.custom("Gilroy-ExtraBold", size: 40))
                        .bold()
                        .frame(height: 50)

                    Text("Comino,pimineta, canela y todo lo que necesitas para darle sabor a tus comidas")
                        .frame(height: 100)
                    NavigationLink {
                        
                    } label: {
                        HStack{
                            Spacer()
                            Text("Comenzar")
                            Spacer()
                            Image(systemName:"chevron.right")
                        }
                            .padding()
                            .frame(width: 272,height: 56)
                            .foregroundColor(Color.white)
                            .background(Color("ColorButton"))
                            .cornerRadius(10)
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
