//
//  LoginView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 15/02/23.
//

import SwiftUI

struct LoginView: View {
    
    private var loginViewModel:LoginViewModel = LoginViewModel()
    @State private var correoDeUsuario: String = UserDefaults.standard.string(forKey: "LLAVE_CORREO") ?? ""
    @State private var pasword: String = ""
    @State private var irAInfoView:Bool = false
    @State private var mostrarAlertaDeError = false
    
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
                NumeroDeTelefonoTextField(numeroDeCelular: $correoDeUsuario)
                
                //PASWORD
                ContraseñaDeTelefonoTextField(contraseñaDeCelular: $pasword)
                
                
                Button {
                    
                } label: {
                    ForGotPasworCelda()
                }
                
                //Button en Componentes
                ButtonMarron(texto: "Sign In", clickEnButton: {
                    loginViewModel.login(emali: correoDeUsuario, pasword: pasword)
                })
                
                
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
            
            NavigationLink(destination: InfoView(), isActive: $irAInfoView) {
                EmptyView()
            }
            //Escuhamos los Published del ViewModel
        }.onReceive(loginViewModel.$irAInfoView) { irAInfoView in
            self.irAInfoView = irAInfoView
        }
        .onReceive(loginViewModel.$mostrarErrorAlert, perform: { mostrarErrorAlert in
            self.mostrarAlertaDeError = mostrarErrorAlert
        })
        .alert("Hubo un error en el Login",isPresented: $mostrarAlertaDeError) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
