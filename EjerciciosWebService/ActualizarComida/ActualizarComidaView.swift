//
//  ActualizarComidaView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 2/02/23.
//

import SwiftUI

struct ActualizarComidaView: View {
    
    var actualizarComidaViewModel: ActualizarComidaViewModel = ActualizarComidaViewModel()
    @State private var id: String = ""
    @State private var nombre: String = ""
    @State private var precio: String = ""
    @State private var url: String = ""
    @State private var mostrarAlerta:Bool = false
    @State private var mensajeDeComidaActualizada: String = ""
    
    var body: some View {
        VStack{
            Image("ActualizarComida")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            HStack{
                Text("ID: ")
                TextField("", text: $id)
            }
            .padding()
            .background(Color.white)
            .foregroundColor(Color.black)
            .cornerRadius(10)
            
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
                Task{
                    do{
                        let comidaActualizada = try await actualizarComidaViewModel.actualizarComida(putComidasRequest: PutComidasRequest.init(id: id, nombre: nombre, precio: Int("\(precio)")!, url: url))
                        mensajeDeComidaActualizada = "Comida Actualizada"
                        mostrarAlerta = true
                    } catch{
                        mensajeDeComidaActualizada = "No se pudo Actualizar"
                        mostrarAlerta = true
                    }
                }
            } label: {
                Text("Actualizar")
            }
            .padding()
            .frame(width: 300,height: 50)
            .background(Color("Boton"))
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .alert(mensajeDeComidaActualizada, isPresented: $mostrarAlerta) {
                Button("OK", role: .cancel) { }
            }
            
            Spacer()
        }
        .padding()
        .background(Color("FondoPrincipal"))
        .navigationTitle("ACTUALIZAR")
    }
}

struct ActualizarComidaView_Previews: PreviewProvider {
    static var previews: some View {
        ActualizarComidaView()
    }
}
