//
//  MenuPrincipalView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 21/02/23.
//

import SwiftUI

struct MenuPrincipalView: View {
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
                            BotonVerde(nombre: "Get Started")
                        }
                    }
                    .padding()
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
