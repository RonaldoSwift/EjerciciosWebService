//
//  RegisterView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 22/02/23.
//

import SwiftUI

struct RegisterView: View {
    
    var registerViewModel: RegisterViewModel = RegisterViewModel()
    @State private var fullName:String = ""
    @State private var enterEmail:String = ""
    @State private var pasword:String = ""
    @State private var repeatPasword:String = ""
    @State private var irAHomePageView: Bool = false
    @State private var mostrarAlertaDeError = false
    
    var body: some View {
        ZStack{
            Color.black
            VStack{
                LogoDeSpotify()
                    .padding(.bottom,80)
                
                Text("Register")
                    .font(.title2)
                    .bold()
                    .padding(.bottom,10)
                
                UnirTextoYButton(nombreDeTexto: "If You Need Any Support", nombreDeButton: "Click Here")
                
                CapsulaParaAgregarText(letras: "Full Name", email: $fullName)
                
                CapsulaParaAgregarText(letras: "Enter Email", email: $enterEmail)
                
                CapsulaParaAgregarPasword(letras: "Password", email: $pasword, imagen: "ojo")
                
                
                BotonVerde(nombre: "Register", clickEnButton: {
                    registerViewModel.registrarUsuario(correo: enterEmail, pasword: pasword)
                })
                
                SepararOr()
                
                LogosEnlaces(nombreFacebook: "LogoF", nombreGoodle: "LogoGoogle", nombreManzana: "LogoManzana")
                
                IrAOtraPantalla(nombreDeTexto: "Have an account?", nombreEnlace: "Log In")
                
            }
            .padding()
        }
        .onReceive(registerViewModel.$mostrarErrorAlert) { mostrarErrorAlert in
            self.mostrarAlertaDeError = mostrarErrorAlert
        }
        .onReceive(registerViewModel.$irAHomePageView) { irAHomePageView in
            self.irAHomePageView = irAHomePageView
        }
        .alert("Hubo un error en Registro",isPresented: $mostrarAlertaDeError){
            Button("ok", role: .cancel){
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
