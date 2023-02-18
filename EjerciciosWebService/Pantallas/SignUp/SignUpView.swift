//
//  SignUpView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 15/02/23.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var numeroDeCelular: String = ""
    @State private var pasword: String = ""
    @State private var rePaword: String = ""
    
    var body: some View {
        ZStack{
            Image("FondoDePantallas")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                
                LogoGeneralCelda()
                    .padding(.bottom,20)
                
                Text("Sign Up")
                    .font(.custom("Gilroy-ExtraBold", size: 40))
                    .bold()
                Text("Vamos a crearte una cuenta")
                    .font(.custom("Gilroy-Light", size: 17))
                    .foregroundColor(Color("Letras"))
                    .padding(.bottom,30)

                
                //Numero De Celular
                NumeroDeTelefonoTextField(numeroDeCelular: $numeroDeCelular)
                
                //Pasword
                ContraseñaDeTelefonoTextField(contraseñaDeCelular: $pasword)
                
                ContraseñaDeTelefonoTextField(contraseñaDeCelular: $rePaword)
                
                
                Button {
                    
                } label: {
                    ForGotPasworCelda()
                }
                
                NavigationLink {
                    InfoView()
                } label: {
                    ButtonMarron(texto: "Sign Up")
                }
                
                HStack{
                    Text("Don’t have an account?")
                        .font(.custom("Gilroy-Light", size: 17))
                    
                    Button {
                        print("Hecho")
                    } label: {
                        Text("SIgn Upn")
                            .foregroundColor(Color("ColorPaswordOlvidado"))
                            .font(.custom("Gilroy-Light", size: 17))
                            .underline(true, color: Color("ColorPaswordOlvidado"))
                    }
                }
                .padding(.bottom,15)
            }
            .padding()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
