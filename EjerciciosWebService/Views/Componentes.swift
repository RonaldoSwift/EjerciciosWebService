//
//  Componentes.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 21/02/23.
//

import Foundation
import SwiftUI

// FUNCION DEGRADADO PARA EL FONDO DE PANTALLA
func DegradadoParaWlFondo() -> some View {
    return ZStack {
        Rectangle()
            .fill(
                LinearGradient(gradient: Gradient(stops: [
                    Gradient.Stop(color: Color(.black), location: 0),
                    Gradient.Stop(color: Color(.black).opacity(0.0), location: 0.3),
                ]), startPoint: .top, endPoint: .bottom)
            )
        Rectangle()
            .fill(
                LinearGradient(gradient: Gradient(stops: [
                    Gradient.Stop(color: Color(.black).opacity(0.0), location: 0),
                    Gradient.Stop(color: Color(.black), location: 0.8),
                ]), startPoint: .top, endPoint: .bottom)
            )
    }
}

// LOGO DE SPOTIFY
func LogoDeSpotify() -> some View {
    return Image("LogoSpotitfy")
        .resizable()
        .frame(width: 133.26, height: 40)
}

// FUNCION PARA EL BOTON VERDE
func BotonVerde(nombre: String, clickEnButton: @escaping () -> Void) -> some View {
    return Text(nombre)
        .padding()
        .font(.custom("Montserrat-ExtraBold", size: 20))
        .foregroundColor(Color.black)
        .frame(width: 348, height: 72)
        .background(
            Capsule()
                .strokeBorder(Color.black, lineWidth: 0.8)
                .background(Color("ColorButton"))
                .clipped()
        )
        .clipShape(Capsule())
        .padding(.bottom, 30)
        .onTapGesture {
            clickEnButton()
        }
}

// FUNCION PARA BUTOON VERDE SECUENCIAL CON NAVIGATIONLINK
func BotonVerdeSecuencial(nombre: String) -> some View {
    return Text(nombre)
        .padding()
        .font(.custom("Montserrat-ExtraBold", size: 20))
        .foregroundColor(Color.black)
        .frame(width: 348, height: 72)
        .background(
            Capsule()
                .strokeBorder(Color.black, lineWidth: 0.8)
                .background(Color("ColorButton"))
                .clipped()
        )
        .clipShape(Capsule())
        .padding(.bottom, 30)
}

// FUNCION PARA CONTINUAR CON NUMBER,GOOGLE,FACEBBOOK
func EnlacesDeSignUp(imagen: String, letraContinue: String) -> some View {
    return HStack {
        Image(imagen)
        Text(letraContinue)
            .foregroundColor(Color.white)
            .padding(.leading, 50)
    }
    .padding()
    .frame(maxWidth: .infinity, maxHeight: 48)
    .background(
        Capsule()
            .strokeBorder(Color.white, lineWidth: 0.8)
            .clipped()
    )
    .clipShape(Capsule())
}

// FUNCION PARA UNIR TEXT Y BUTTON
func UnirTextoYButton(nombreDeTexto: String, nombreDeButton: String) -> some View {
    return HStack {
        Text(nombreDeTexto)
            .foregroundColor(Color.white)
        Button {
            print("CLICK HERE")
        } label: {
            Text(nombreDeButton)
                .foregroundColor(Color("ColorLetra"))
        }
    }
}

// FUNCION PARA AGREGAR EMAIL EN CAPSULA
func CapsulaParaAgregarText(letras: String, email: Binding<String>) -> some View {
    return HStack {
        TextField(letras, text: email)
            .foregroundColor(Color.white)
            .padding(.leading, 50)
        Spacer()
    }
    .padding()
    .frame(maxWidth: .infinity, maxHeight: 72)
    .overlay(
        RoundedRectangle(cornerRadius: 16)
            .stroke(.gray, lineWidth: 1)
    )
}

// FUNCION PARA AGREGAR PASWORD EN CAPSULA
func CapsulaParaAgregarPasword(letras: String, email: Binding<String>, imagen: String) -> some View {
    return HStack {
        SecureField(letras, text: email)
            .foregroundColor(Color.white)
            .padding(.leading, 50)
        Spacer()
        Image(imagen)
            .resizable()
            .frame(width: 23.5, height: 19.13)
    }
    .padding()
    .frame(maxWidth: .infinity, maxHeight: 72)
    .overlay(
        RoundedRectangle(cornerRadius: 16)
            .stroke(.gray, lineWidth: 1)
    )
}

// Funcion Or
func SepararOr() -> some View {
    return HStack {
        Image("linea")
            .frame(width: 100)
            .padding(.trailing, 20)
        Text("Or")
        Image("linea")
            .padding(.leading, 20)
            .frame(width: 100)
    }
}

// FUNCION PARA LOGO (Log In)
func LogosEnlaces(nombreFacebook: String, nombreGoodle: String, nombreManzana: String) -> some View {
    return HStack {
        Image(nombreFacebook)
            .resizable()
            .frame(width: 12, height: 24)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 50)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray, lineWidth: 1)
            )

        Image(nombreGoodle)
            .resizable()
            .frame(width: 23.64, height: 23.64)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 50)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray, lineWidth: 1)
            )

        Image(nombreManzana)
            .resizable()
            .frame(width: 21.12, height: 26.01)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 50)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray, lineWidth: 1)
            )
    }
}

// FUNCION PARA IR A OTRA PANTALLA
func IrAOtraPantalla(nombreDeTexto: String, nombreEnlace: String, clickEnButton: @escaping () -> Void) -> some View {
    return HStack {
        Text(nombreDeTexto)
            .foregroundColor(Color.white)
        Button {
            clickEnButton()
        } label: {
            Text(nombreEnlace)
                .foregroundColor(Color("ColorAmarillo"))
        }
    }
}
