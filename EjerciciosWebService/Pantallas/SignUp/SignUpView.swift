//
//  SignUpView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 15/02/23.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var numeroDeCelular: String = ""
    @State private var pasword: String = ""
    @State private var repasword: String = ""
    
    var body: some View {
        ZStack{
            Image("FondoDePantallas")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                
                Image("simboloCaffe")
                    .resizable()
                    .frame(width: 51.61,height: 51.61)
                    .scaledToFit()
                Text("Especies !")
                
                Text("Sign Up")
                    .font(.custom("Gilroy-ExtraBold", size: 40))
                    .bold()
                Text("Vamos a crearte una cuenta")
                    .font(.custom("Gilroy-Light", size: 17))
                    .foregroundColor(Color("Letras"))
                
                
                NumeroDeTelefonoTextField(numeroDeCelular: $numeroDeCelular)
                
                
                HStack{
                    Image(systemName: "ellipsis")
                    TextField("", text: $pasword)
                    Spacer()
                    Image(systemName: "eye.fill")
                }
                .padding()
                .frame(maxWidth:350)
                .background(
                    Capsule()
                        .strokeBorder(Color("SombraColor"),lineWidth: 0.8)
                        .clipped()
                )
                .clipShape(Capsule())
                
                
                HStack{
                    Image(systemName: "ellipsis")
                    TextField("", text: $repasword)
                    Spacer()
                    Image(systemName: "eye.fill")
                }
                .padding()
                .frame(maxWidth:350)
                .background(
                    Capsule()
                        .strokeBorder(Color("SombraColor"),lineWidth: 0.8)
                        .clipped()
                )
                .clipShape(Capsule())
                
                Button {
                    
                } label: {
                    Text("Contraseña Olvidada?")
                        .foregroundColor(Color("ColorPaswordOlvidado"))
                        .font(.custom("Gilroy-Light", size: 17))
                }
                
                NavigationLink {
                    
                } label: {
                    ButtonMarron(texto: "Sign Up")
                }
                
                HStack{
                    Text("No tengo cuenta")
                        .font(.custom("Gilroy-Light", size: 17))
                    
                    Button {
                        print("Hecho")
                    } label: {
                        Text("SIgn Upn")
                            .foregroundColor(Color("ColorPaswordOlvidado"))
                            .font(.custom("Gilroy-Light", size: 17))
                    }
                }
            }
            .padding()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
