//
//  ActualizarCasaView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 7/02/23.
//

import SwiftUI

struct ActualizarCasaView: View {
    
    var actualizarCasaViewModel: ActualizarCasaViewModel = ActualizarCasaViewModel()
    @State private var id: String = ""
    @State private var distrito: String = ""
    @State private var direccion: String = ""
    @State private var precio: String = ""
    @State private var descripcion: String = ""
    @State private var area: String = ""
    @State private var url: String = ""
    @State private var mostrarAlerta = false
    @State private var mensajeDeCasaActualizada: String = ""
    
    var body: some View {
        VStack{
            Image("ActualizarImage")
                .resizable()
                .scaledToFit()
            
            HStack{
                Text("ID: ")
                TextField("", text: $id)
            }
            .padding()
            .background(Color.white)
            .foregroundColor(Color.black)
            .cornerRadius(10)
            
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
                TextField("", text: $id)
            }
            .padding()
            .background(Color.white)
            .foregroundColor(Color.black)
            .cornerRadius(10)
            
            HStack{
                Text("Descripcion: ")
                TextField("", text: $id)
            }
            .padding()
            .background(Color.white)
            .foregroundColor(Color.black)
            .cornerRadius(10)
            
            HStack{
                Text("Area: ")
                TextField("", text: $id)
            }
            .padding()
            .background(Color.white)
            .foregroundColor(Color.black)
            .cornerRadius(10)
            
            HStack{
                Text("URL: ")
                TextField("", text: $id)
            }
            .padding()
            .background(Color.white)
            .foregroundColor(Color.black)
            .cornerRadius(10)
            
            Button {
                Task{
                    do{
                        let casaActualizada = try await actualizarCasaViewModel.actualizarComida(putCasasRequest: PutCasasRequest.init(id: id, distrito: distrito, direccion: direccion, precio: Int("\(precio)")!, descripcion: descripcion, area: Int("\(area)")!, url: url))
                        mensajeDeCasaActualizada = "Comida actualizada"
                        mostrarAlerta = true
                    } catch {
                        mensajeDeCasaActualizada = "Error no se pudo actualizar"
                        mostrarAlerta = true
                    }
                }
            } label: {
                Text("Actualizar")
            }
            .padding()
            .frame(width: 300,height: 50)
            .background(Color("ColorButton"))
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .alert(mensajeDeCasaActualizada, isPresented: $mostrarAlerta) {
                Button("OK", role: .cancel) { }
            }
            Spacer()
        }
        .padding()
        .background(Color("ColorPrincipal"))
    }
}

struct ActualizarCasaView_Previews: PreviewProvider {
    static var previews: some View {
        ActualizarCasaView()
    }
}
