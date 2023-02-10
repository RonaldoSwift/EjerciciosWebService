//
//  ActualizarMaravillaView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 9/02/23.
//

import SwiftUI

struct ActualizarMaravillaView: View {
    var actualizarMaravillaViewmodel: ActualizarMaravillaViewModel = ActualizarMaravillaViewModel()
    @State private var id: String = ""
    @State private var nombre: String = ""
    @State private var pais: String = ""
    @State private var descripcion: String = ""
    @State private var url: String = ""
    @State private var mensajeDeMaravillaCreada: String = ""
    @State private var mostrarAlerta:Bool = false
    
    var body: some View {
        ZStack{
            Image("FondoActualizar")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("")
                    .resizable()
                    .scaledToFit()
                
                HStack{
                    Text("ID: ")
                    TextField("", text: $id)
                }
                .padding()
                .foregroundColor(Color.black)
                .background(Color.white)
                .cornerRadius(10)
                
                HStack{
                    Text("Nombre: ")
                    TextField("", text: $nombre)
                }
                .padding()
                .foregroundColor(Color.black)
                .background(Color.white)
                .cornerRadius(10)
                
                HStack{
                    Text("Pais: ")
                    TextField("", text: $pais)
                }
                .padding()
                .foregroundColor(Color.black)
                .background(Color.white)
                .cornerRadius(10)
                
                HStack{
                    Text("Descripcion: ")
                    TextField("", text: $descripcion)
                }
                .padding()
                .foregroundColor(Color.black)
                .background(Color.white)
                .cornerRadius(10)
                
                HStack{
                    Text("URL: ")
                    TextField("", text: $url)
                }
                .padding()
                .foregroundColor(Color.black)
                .background(Color.white)
                .cornerRadius(10)
                
                Button {
                    Task{
                        do{
                            let maravillaActualizada = try await actualizarMaravillaViewmodel.actualizarMaravilla(putMaravillasRequest: PutMaravillasRequest.init(id: id, nombre: nombre, descripcion: descripcion, url: url))
                            mensajeDeMaravillaCreada = "Actualizada"
                            mostrarAlerta = true
                        } catch{
                            mensajeDeMaravillaCreada = "Error"
                            mostrarAlerta = true
                        }
                    }
                } label: {
                    Text("ACTUALIZAR")
                        .padding()
                        .frame(width: 350,height: 50)
                        .border(Color.black, width: 5.0)
                        .foregroundColor(Color.white)
                        .background(Color("ColorButoon"))
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("ACTUALIZAR")
        }
    }
}

struct ActualizarMaravillaView_Previews: PreviewProvider {
    static var previews: some View {
        ActualizarMaravillaView()
    }
}
