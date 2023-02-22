//
//  SignUpView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 22/02/23.
//

import SwiftUI

struct SignUpView: View {
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
                    
                    NavigationLink {
                        
                    } label: {
                        Text("Sign up free")
                            .padding()
                            .font(.custom("Montserrat-ExtraBold", size: 20))
                            .foregroundColor(Color.black)
                            .frame(width: 348,height: 48)
                            .background(
                                Capsule()
                                    .strokeBorder(Color.black,lineWidth: 0.8)
                                    .background(Color("ColorButton"))
                                    .clipped()
                            )
                            .clipShape(Capsule())
                    }
                    
                    Button {
                        print("Cel")
                    } label: {
                        EnlacesDeSignUp(imagen: "LogoCelular", letraContinue: "Continue with phone number")
                    }
                    
                    Button {
                        print("Google")
                    } label: {
                        EnlacesDeSignUp(imagen: "LogoGoogle", letraContinue: "Continue with Google")
                    }
                    
                    Button {
                        print("Facebook")
                    } label: {
                        EnlacesDeSignUp(imagen: "LogoFacebook", letraContinue: "Continue with facebook")
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        Text("Log In")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color.white)
                            .padding(.bottom,50)
                    }

                }
                .padding()
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
