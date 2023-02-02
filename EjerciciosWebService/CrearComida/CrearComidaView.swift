//
//  CrearComidaView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 1/02/23.
//

import SwiftUI

struct CrearComidaView: View {
    
    var crearComidaViewModel: CrearComidaViewModel = CrearComidaViewModel()
    @State private var random = Int.random(in: 1..<300)
    @State private var nombre: String = ""
    @State private var precio: String = ""
    @State private var url: String = ""
    @State private var mensajeDeComidaCreada: String = ""
    @State private var mostrarAlerta:Bool = false
    
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
                Task{
                    do{
                        let comidaCreada = try await crearComidaViewModel.crearComida(postComidasRequest: PostComidasRequest.init(id: String("\(random)"), nombre: nombre, precio: Int("\(precio)")!, url: url))
                        mensajeDeComidaCreada = "Comida Creada: \nID:\(comidaCreada.id) \nNombre:\(comidaCreada.nombre) \nPrecio: \(comidaCreada.precio) \nURL: \(comidaCreada.url)"
                        mostrarAlerta = true
                    } catch{
                        mensajeDeComidaCreada = "No se creo ninguna comida"
                        mostrarAlerta = true
                    }
                }
            } label: {
                Text("Crear")
            }
            .padding()
            .frame(width: 300,height: 50)
            .background(Color("Boton"))
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .alert(mensajeDeComidaCreada, isPresented: $mostrarAlerta) {
                Button("OK", role: .cancel) { }
            }
            
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
