//
//  AgregarCasaView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 7/02/23.
//

import SwiftUI

struct AgregarCasaView: View {
    
    var agregarCasaViewModel: AgregarCasaViewModel = AgregarCasaViewModel()
    @State private var random = Int.random(in: 1..<400)
    @State private var distrito: String = ""
    @State private var direccion: String = ""
    @State private var precio: String = ""
    @State private var descripcion: String = ""
    @State private var area: String = ""
    @State private var url: String = ""
    @State private var mostrarAlerta: Bool = false
    @State private var mensajeDeCasaCreada: String = ""
    
    
    var body: some View {
        VStack{
            Image("ImageCrear")
                .resizable()
                .scaledToFit()
            
            HStack{
                Text("Distrito: ")
                TextField("", text: $distrito)
            }
            .padding()
            .background(Color.white)
            .foregroundColor(Color.black)
            .cornerRadius(10)
            
            HStack{
                Text("Direccion: ")
                TextField("", text: $direccion)
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
                Text("Descripcion: ")
                TextField("", text: $descripcion)
            }
            .padding()
            .background(Color.white)
            .foregroundColor(Color.black)
            .cornerRadius(10)
            
            HStack{
                Text("Area: ")
                TextField("", text: $area)
            }
            .padding()
            .background(Color.white)
            .foregroundColor(Color.black)
            .cornerRadius(10)
            
            HStack{
                Text("Url: ")
                TextField("", text: $url)
            }
            .padding()
            .background(Color.white)
            .foregroundColor(Color.black)
            .cornerRadius(10)
            
            Button {
                Task{
                    do{
                        let casaCreada = try await agregarCasaViewModel.crearComida(postCasasRequest: PostCasasRequest.init(id: "\(random)", distrito: distrito, direccion: direccion, precio: Int("\(precio)")!, descripcion: descripcion, area: Int("\(area)")!, url: url))
                        mensajeDeCasaCreada = "Error"
                        mostrarAlerta = true
                    } catch{
                        mensajeDeCasaCreada = "Error"
                        mostrarAlerta = true
                    }
                }
            } label: {
                Text("Agregar")
            }
            .padding()
            .frame(width: 300,height: 50)
            .background(Color("ColorButton"))
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .alert(mensajeDeCasaCreada, isPresented: $mostrarAlerta) {
                Button("OK", role: .cancel) { }
            }
            Spacer()
        }
        .padding()
        .background(Color("ColorPrincipal"))
        .navigationTitle("AGREGAR")
    }
}

struct AgregarCasaView_Previews: PreviewProvider {
    static var previews: some View {
        AgregarCasaView()
    }
}
