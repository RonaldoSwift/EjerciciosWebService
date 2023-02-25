//
//  LogInView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 22/02/23.
//

import SwiftUI

struct LogInView: View {
    
    var logInViewModel: LogInViewModel = LogInViewModel()
    @State private var correoDeUsuario: String = UserDefaults.standard.string(forKey: "LLAVE_CORREO") ?? ""
    @State private var pasword:String = ""
    @State private var irAnfoTapsView:Bool = false
    @State private var irARegister:Bool = false
    @State private var mostrarAlertaDeError = false
    
    var body: some View {
        ZStack{
            Color.black
            VStack{
                LogoDeSpotify()
                    .padding(.bottom,70)
                
                Text("Log In")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color.white)
                    .padding(.bottom,20)
                
                UnirTextoYButton(nombreDeTexto: "If You Need Any Support", nombreDeButton: "Click Here")
                
                CapsulaParaAgregarText(letras: "Enter Username Or Email", email: $correoDeUsuario)
                
                CapsulaParaAgregarPasword(letras: "Password", email: $pasword, imagen: "ojo")
                    .padding(.bottom,10)

                
                HStack{
                    Button {
                        
                    } label: {
                        Text("Forgot password?")
                            .foregroundColor(Color.white)
                            .underline(true, color: Color.white)
                            .padding(.bottom,30)
                    }
                    Spacer()
                }
                
                BotonVerde(nombre: "Log In", clickEnButton: {
                    logInViewModel.login(emali: correoDeUsuario, pasword: pasword)
                })
                
                
                SepararOr()
                .padding(.bottom,20)

                
                LogosEnlaces(nombreFacebook: "LogoF", nombreGoodle: "LogoGoogle", nombreManzana: "LogoManzana")
                    .padding(.bottom,10)

                IrAOtraPantalla(nombreDeTexto: "Don't have an account?", nombreEnlace: "Register", clickEnButton: {
                    irARegister = true
                })
                    .padding(.bottom,30)

            }
            .padding()
            
            NavigationLink(destination: InfoTapsView(), isActive: $irAnfoTapsView) {
                EmptyView()
            }
            NavigationLink(destination: RegisterView(), isActive: $irARegister) {
                EmptyView()
            }
            
            //Escuhamos los Published del ViewModel
        }.onReceive(logInViewModel.$irAHomePage) { irAnfoTapsView in
            self.irAnfoTapsView = irAnfoTapsView
        }
        .onReceive(logInViewModel.$mostrarErrorAlert, perform: { mostrarErrorAlert in
            self.mostrarAlertaDeError = mostrarErrorAlert
        })
        .alert("Hubo un error en el Login",isPresented: $mostrarAlertaDeError) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
