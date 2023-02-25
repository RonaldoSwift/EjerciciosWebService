//
//  MenuPrincipalView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 21/02/23.
//

import SwiftUI
import FirebaseAuth

struct MenuPrincipalView: View {
    @State private var irAInfoTaps:Bool = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("FondoMenu")
                    .resizable()
                    .frame(width: 392,height: 490)
                    .padding(.bottom,175)
                ZStack{
                    //DEGRADADO PARA EL FONDO
                    DegradadoParaWlFondo()
                    //VISTA
                    VStack{
                        LogoDeSpotify()
                        Spacer()
                        
                        Text("Music for everyone.")
                            .font(.custom("Montserrat-ExtraBold", size: 20))
                            .foregroundColor(Color("ColorLetra"))
                            .bold()
                            .padding(.bottom, 20)
                        
                        Text("Nulla Lorem mollit cupidatat irure. Laborum magna nulla duis ullamco cillum dolor. Voluptate exercitation incididunt aliquip deserunt reprehenderit elit laborum.")
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 35)
                        
                        NavigationLink {
                            ContinueView()
                        } label: {
                            BotonVerdeSecuencial(nombre: "Get Started")
                        }
                    }
                    .padding()
                }
                NavigationLink(destination: InfoTapsView(), isActive: $irAInfoTaps) {
                    EmptyView()
                }
            }
        }
        .onAppear{
            Auth.auth().addStateDidChangeListener { (auth:Auth, user:User?) in
                if(user != nil){
                    irAInfoTaps = true
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
