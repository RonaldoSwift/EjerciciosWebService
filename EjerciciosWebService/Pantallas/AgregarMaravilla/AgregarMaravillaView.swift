//
//  AgregarMaravillaView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 9/02/23.
//

import SwiftUI

struct AgregarMaravillaView: View {
    var agregarMaravillaViewModel: AgregarMaravillaViewModel = AgregarMaravillaViewModel()
    @State private var random = Int.random(in: 1..<200)
    @State private var nombre: String = ""
    @State private var pais: String = ""
    @State private var descripcion: String = ""
    @State private var url: String = ""
    @State private var mensajeDeMaravillaCreada: String = ""
    @State private var mostrarAlerta:Bool = false
    
    var body: some View {
        ZStack{
            Image("FondoCrear")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("")
                    .resizable()
                    .scaledToFit()
                
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
                    Text("Url: ")
                    TextField("", text: $url)
                }
                .padding()
                .foregroundColor(Color.black)
                .background(Color.white)
                .cornerRadius(10)
                
                Button {
                    Task{
                        do{
                            let maravillaCreada = try await agregarMaravillaViewModel.crearMaravila(postMaravillasRequest: PostMaravillasRequest.init(id: "\(random)", nombre: nombre, descripcion: descripcion, url: url))
                            mensajeDeMaravillaCreada = "ID:\(maravillaCreada.id) \nNombre:\(maravillaCreada.nombre) \nDescripcion: \(maravillaCreada.descripcion) \nURL\(maravillaCreada.url)"
                            mostrarAlerta = true
                        } catch{
                            mensajeDeMaravillaCreada = "No se agrego Maravilla"
                            mostrarAlerta = true
                        }
                    }
                } label: {
                    Text("AGREGAR")
                        .padding()
                        .frame(width: 350,height: 50)
                        .border(Color.black, width: 5.0)
                        .foregroundColor(Color.white)
                        .background(Color("ColorButoon"))
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("AGREGAR")
        }
    }
}

struct AgregarMaravillaView_Previews: PreviewProvider {
    static var previews: some View {
        AgregarMaravillaView()
    }
}
