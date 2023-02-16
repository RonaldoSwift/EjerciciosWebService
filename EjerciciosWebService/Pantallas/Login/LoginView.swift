//
//  LoginView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 15/02/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var numeroDeCelular: String = ""
    @State private var pasword: String = ""
    
    var body: some View {
        ZStack{
            Image("FondoDePantallas")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                Image("simboloCaffe")
                    .resizable()
                    .frame(width: 51.61,height: 51.61)
                    .scaledToFit()
                Text("Especies !")
                
                Text("Login In ")
                    .font(.custom("Gilroy-ExtraBold", size: 40))
                    .bold()
                Text("Ya nos conocemos!")
                    .font(.custom("Gilroy-Light", size: 17))
                    .foregroundColor(Color("Letras"))
                
                //NUMERO De Celular
                NumeroDeTelefonoTextField(numeroDeCelular: $numeroDeCelular)
                
                //PASWORD
                ContraseñaDeTelefonoTextField(contraseñaDeCelular: $pasword)
                
                
                Button {
                    
                } label: {
                    Text("Contraseña Olvidada?")
                        .foregroundColor(Color("ColorPaswordOlvidado"))
                        .font(.custom("Gilroy-Light", size: 17))
                }
                
                NavigationLink {
                    VerEspeciasView()
                } label: {
                    //Button en Componentes
                    ButtonMarron(texto: "Sign In")
                }
                
                HStack{
                    Text("No tengo cuenta")
                        .font(.custom("Gilroy-Light", size: 17))
                    
                    NavigationLink {
                        SignUpView()
                    } label: {
                        Text("SIgn Upn")
                            .foregroundColor(Color("ColorPaswordOlvidado"))
                            .font(.custom("Gilroy-Light", size: 17))
                    }
                }
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
