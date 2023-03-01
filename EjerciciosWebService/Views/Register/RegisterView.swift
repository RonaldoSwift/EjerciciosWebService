//
//  RegisterView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 22/02/23.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var registerViewModel: RegisterViewModel = .init()
    @State private var fullName: String = ""
    @State private var enterEmail: String = ""
    @State private var pasword: String = ""
    @State private var repeatPasword: String = ""
    @State private var irAnfoTapsView: Bool = false
    @State private var irALogin: Bool = false
    @State private var mostrarAlertaDeError = false

    var body: some View {
        ZStack {
            Color.black
            VStack {
                Text("Register")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 10)

                UnirTextoYButton(nombreDeTexto: "If You Need Any Support", nombreDeButton: "Click Here")

                CapsulaParaAgregarText(letras: "Full Name", email: $fullName)

                CapsulaParaAgregarText(letras: "Enter Email", email: $enterEmail)

                CapsulaParaAgregarPasword(letras: "Password", email: $pasword, imagen: "ojo")

                BotonVerde(nombre: "Register", clickEnButton: {
                    registerViewModel.registrarUsuario(correo: enterEmail, pasword: pasword)
                })

                SepararOr()

                LogosEnlaces(nombreFacebook: "LogoF", nombreGoodle: "LogoGoogle", nombreManzana: "LogoManzana")

                IrAOtraPantalla(nombreDeTexto: "Have an account?", nombreEnlace: "Log In", clickEnButton: {
                    irALogin = true
                })
            }
            .padding()

            NavigationLink(destination: LogInView(), isActive: $irALogin, label: {
                EmptyView()
            })
        }
        .onReceive(registerViewModel.$mostrarErrorAlert) { mostrarErrorAlert in
            self.mostrarAlertaDeError = mostrarErrorAlert
        }
        .onReceive(registerViewModel.$irAnfoTapsView) { irAnfoTapsView in
            self.irAnfoTapsView = irAnfoTapsView
        }

        // iOS 13/14
        .alert(isPresented: $mostrarAlertaDeError, content: {
            Alert(title: Text("ubo un error en el Login"))
        })
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image("LogoSpotitfy")
                    .resizable()
                    .scaledToFit()
            }
        }
    }

    private func CustomBackButton() -> some View {
        let backImage = Image("BackImage")
            .resizable()
            .scaledToFit()
            .frame(width: 10, height: 10)

        return Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Circle()
                .strokeBorder(Color.gray, lineWidth: 2)
                .background(backImage)
                .frame(width: 40, height: 40)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
