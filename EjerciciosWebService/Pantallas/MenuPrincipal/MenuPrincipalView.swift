//
//  MenuPrincipalView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 13/02/23.
//

import SwiftUI
import FirebaseAuth

struct MenuPrincipalView: View {
    
    @State private var irAlLogin:Bool = false
    @State private var irAInfoView:Bool = false
    
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("FondoPrincipal")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    LogoGeneralCelda()
                    
                    Text("Find your favorite")
                        .font(.custom("Gilroy-Light", size: 30))
                    Text("Coffee Taste!")
                        .font(.custom("Gilroy-ExtraBold", size: 40))
                        .bold()
                        .frame(height: 50)
                    
                    Text("We’re coffee shop, beer and wine bar, & event space for performing arts")
                        .multilineTextAlignment(.center)
                        .font(.custom("Gilroy-Light", size: 17))
                        .foregroundColor(Color("Letras"))
                        .padding(.bottom,30)
                    
                    
                    ButtonMarron(texto: "Get Started", clickEnButton: {
                        irAlLogin = true
                    })
                    .padding(.bottom,25)
                    
                }
                .padding()
                
                NavigationLink(destination: LoginView(), isActive: $irAlLogin) {
                    EmptyView()
                }
                
                NavigationLink(destination: InfoView(), isActive: $irAInfoView) {
                    EmptyView()
                }
            }
        }.onAppear{
            //Detectar si el usuario esta o no logeado con FireBase
            Auth.auth().addStateDidChangeListener { (auth:Auth, user:User?) in
                if(user != nil){
                    irAInfoView = true
                }
            }
        }
    }
}

struct MenuPrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        MenuPrincipalView()
    }
}
