//
//  MenuPrincipalView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 2/02/23.
//

import SwiftUI

struct MenuPrincipalView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("MENU PRINCIPAL")
                Image("ImagenPrincipal")
                    .resizable()
                    .border(Color("Boton"),width: 6.0)
                    .scaledToFit()
                
                Spacer()
                
                NavigationLink {
                    CrearComidaView()
                } label: {
                    Text("CREAR")
                }
                .padding()
                .frame(width: 350,height: 50)
                .background(Color.white)
                .foregroundColor(Color.black)
                .cornerRadius(10)
                
                NavigationLink {
                    VerComidaView()
                } label: {
                    Text("VER")
                }
                .padding()
                .frame(width: 350,height: 50)
                .background(Color.white)
                .foregroundColor(Color.black)
                .cornerRadius(10)
                
                NavigationLink {
                    ActualizarComidaView()
                } label: {
                    Text("ACTUALIZAR")
                }
                .padding()
                .frame(width: 350,height: 50)
                .background(Color.white)
                .foregroundColor(Color.black)
                .cornerRadius(10)
                
                Spacer()
            }
            .padding()
            .background(Color("FondoPrincipal"))
        }
    }
}

struct MenuPrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        MenuPrincipalView()
    }
}
