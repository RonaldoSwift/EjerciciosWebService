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
                .background(
                    LinearGradient(gradient: Gradient(colors: [.black]), startPoint: .top, endPoint: .bottom)
                    )
            
            VStack{
                LogoGeneralCelda()
                    .padding(.bottom,30)
                
                Text("Login In ")
                    .font(.custom("Gilroy-ExtraBold", size: 40))
                    .bold()
                Text("We’ve already met!")
                    .font(.custom("Gilroy-Regular", size: 17))
                    .foregroundColor(Color("Letras"))
                    .padding(.bottom,50)
                
                //NUMERO De Celular
                NumeroDeTelefonoTextField(numeroDeCelular: $numeroDeCelular)
                
                //PASWORD
                ContraseñaDeTelefonoTextField(contraseñaDeCelular: $pasword)
                
                
                Button {
                    
                } label: {
                    ForGotPasworCelda()
                }
                
                NavigationLink {
                    InfoView()
                        .padding(.bottom,30)
                } label: {
                    //Button en Componentes
                    ButtonMarron(texto: "Sign In")
                }
                
                HStack{
                    Text("Dont have an account?")
                        .font(.custom("Gilroy-Light", size: 17))
                    
                    NavigationLink {
                        SignUpView()
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
