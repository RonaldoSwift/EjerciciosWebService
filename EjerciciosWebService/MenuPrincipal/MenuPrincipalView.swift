//
//  MenuPrincipalView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 4/02/23.
//

import SwiftUI

struct MenuPrincipalView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("INMOVILIARIA")
                    .font(.largeTitle)
                    .bold()
                
                Image("MenuImage")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                
                Spacer()
                
                NavigationLink {
                    AgregarCasaView()
                } label: {
                    Text("Agregar")
                }
                .padding()
                .frame(width: 350,height: 50)
                .background(Color("ColorButton"))
                .foregroundColor(Color.white)
                .cornerRadius(10)
                
                NavigationLink {
                    MenuTabView()
                } label: {
                    Text("Ver")
                }
                .padding()
                .frame(width: 350,height: 50)
                .background(Color("ColorButton"))
                .foregroundColor(Color.white)
                .cornerRadius(10)
                
                NavigationLink {
                    ActualizarCasaView()
                } label: {
                    Text("Actualizar")
                }
                .padding()
                .frame(width: 350,height: 50)
                .background(Color("ColorButton"))
                .foregroundColor(Color.white)
                .cornerRadius(10)
                
                Button {
                    UserDefaults.standard.set(true, forKey: "eslibre")
                } label: {
                    Text("Guardar valor")
                }
                
                Button {
                    print(UserDefaults.standard.bool(forKey: "eslibre"))
                } label: {
                    Text("Leer Valor")
                }
                
                Spacer()
                
                HStack{
                    Text("Codigo QR")
                        .padding()
                        .frame(width: 120,height: 50)
                        .background(Color("ColorButton"))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                    Spacer()
                    Image("CodigoQrImage")
                        .resizable()
                        .frame(width: 150,height: 150)
                        .scaledToFit()
                }
                .padding()
            }
            .padding()
            .background(Color("ColorPrincipal"))
        }
    }
}

struct MenuPrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        MenuPrincipalView()
    }
}
