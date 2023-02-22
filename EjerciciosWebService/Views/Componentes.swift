//
//  Componentes.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 21/02/23.
//

import Foundation
import SwiftUI

//FUNCION DEGRADADO PARA EL FONDO DE PANTALLA
func DegradadoParaWlFondo()-> some View{
    return VStack{
        Rectangle()
            .fill(
                LinearGradient(gradient: Gradient(stops: [
                    Gradient.Stop(color: Color(.black).opacity(0.0), location: 0),
                    Gradient.Stop(color: Color(.black), location: 0.5),
                ]), startPoint: .bottom, endPoint: .top)
            )
            .frame(height:200)
        Spacer()
        Rectangle()
            .fill(
                LinearGradient(gradient: Gradient(stops: [
                    Gradient.Stop(color: Color(.black).opacity(0.0), location: 0),
                    Gradient.Stop(color: Color(.black), location: 0.5),
                ]), startPoint: .top, endPoint: .bottom)
            )
            .frame(height:400)
    }
}

//LOGO DE SPOTIFY
func LogoDeSpotify()-> some View{
    return Image("LogoSpotitfy")
        .resizable()
        .frame(width: 133.26,height: 40)
}

//FUNCION PARA EL BOTON VERDE
func BotonVerde(nombre: String)-> some View{
    return Text(nombre)
        .padding()
        .font(.custom("Montserrat-ExtraBold", size: 20))
        .foregroundColor(Color.black)
        .frame(width: 348,height: 72)
        .background(
            Capsule()
                .strokeBorder(Color.black,lineWidth: 0.8)
                .background(Color("ColorButton"))
                .clipped()
        )
        .clipShape(Capsule())
        .padding(.bottom, 40)
}

//FUNCION PARA CONTINUAR CON NUMBER,GOOGLE,FACEBBOOK
func EnlacesDeSignUp(imagen:String, letraContinue:String) -> some View{
    return HStack{
        Image(imagen)
        Text(letraContinue)
            .foregroundColor(Color.white)
            .padding(.leading,50)

    }
    .padding()
    .frame(maxWidth:.infinity, maxHeight: 48)
    .background(
        Capsule()
            .strokeBorder(Color.white,lineWidth: 0.8)
            .clipped()
    )
    .clipShape(Capsule())
}





