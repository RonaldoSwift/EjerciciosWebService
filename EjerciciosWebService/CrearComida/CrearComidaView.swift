//
//  CrearComidaView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 1/02/23.
//

import SwiftUI

struct CrearComidaView: View {
    @State private var nombre: String = ""
    @State private var precio: String = ""
    @State private var url: String = ""
    
    var body: some View {
        VStack{
            Image("CrearComida")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            HStack{
                Text("Nombre: ")
                TextField("", text: $nombre)
            }
            .padding()
            .background(Color.white)
            .foregroundColor(Color.black)
            .cornerRadius(10)
            
            HStack{
                Text("Precio: ")
                TextField("", text: $precio)
                
            }
            .padding()
            .background(Color.white)
            .foregroundColor(Color.black)
            .cornerRadius(10)
            
            HStack{
                Text("URL: ")
                TextField("", text: $url)
                
            }
            .padding()
            .background(Color.white)
            .foregroundColor(Color.black)
            .cornerRadius(10)
            
            
            Button {
                
            } label: {
                Text("Crear")
            }
            .padding()
            .frame(width: 300,height: 50)
            .background(Color("Boton"))
            .foregroundColor(Color.white)
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
        .background(Color("FondoPrincipal"))
        .navigationTitle("CREAR")
    }
}

struct CrearComidaView_Previews: PreviewProvider {
    static var previews: some View {
        CrearComidaView()
    }
}
