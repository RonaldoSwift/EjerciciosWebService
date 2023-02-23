//
//  ContinueView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 21/02/23.
//

import SwiftUI

struct ContinueView: View {
    var body: some View {
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
                    
                    Text("Choose Mode")
                    HStack{
                        VStack{
                            Image("Dark")
                                .resizable()
                                .frame(width: 73,height: 78.5)
                            Text("Dark Mode")
                                .foregroundColor(Color.white)
                        }
                        .padding(.trailing, 50)
                        VStack{
                            Image("Light")
                                .resizable()
                                .frame(width: 73,height: 73)
                            Text("Ligh Mode")
                                .foregroundColor(Color.white)
                        }
                    }
                    NavigationLink {
                        SignUpView()
                    } label: {
                        BotonVerdeSecuencial(nombre: "CONTINUE")
                    }
                    .padding(.top, 50)
                    
                }
                .padding()
            }
        }
    }
}

struct ContinueView_Previews: PreviewProvider {
    static var previews: some View {
        ContinueView()
    }
}
