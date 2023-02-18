//
//  Componente.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 15/02/23.
//

import Foundation
import Kingfisher
import SwiftUI

func NumeroDeTelefonoTextField(numeroDeCelular:Binding<String>) -> some View{
    return  ZStack{
        HStack{
            Image(systemName: "iphone.gen1")
            TextField("+51", text: numeroDeCelular)
        }
        .padding()
        .frame(maxWidth:.infinity, maxHeight: 50)
        .background(
            Capsule()
                .strokeBorder(Color("SombraColor"),lineWidth: 0.8)
                .clipped()
        )
        .clipShape(Capsule())
        
        Text("PHONE NUMBER")
            .frame(maxWidth: .infinity, maxHeight: 72, alignment: .topLeading)
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0))
            .font(.custom("Gilroy-Regular", size: 12))
        Text("*")
            .foregroundColor(Color.red)
            .frame(maxWidth: .infinity, maxHeight: 72, alignment: .topLeading)
            .padding(EdgeInsets(top: 0, leading: 130, bottom: 0, trailing: 0))
        
    }
}

func ContraseñaDeTelefonoTextField(contraseñaDeCelular:Binding<String>) -> some View{
    return ZStack{
        HStack{
            Image(systemName: "ellipsis")
            SecureField("", text: contraseñaDeCelular)
            Spacer()
            Image(systemName: "eye.slash.fill")
                .foregroundColor(Color("ColorOjo"))
        }
        .padding()
        .frame(maxWidth:.infinity, maxHeight: 50)
        .background(
            Capsule()
                .strokeBorder(Color("SombraColor"),lineWidth: 0.8)
                .clipped()
        )
        .clipShape(Capsule())
        
        Text("PASSWORD")
            .frame(maxWidth: .infinity, maxHeight: 72, alignment: .topLeading)
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0))
            .font(.custom("Gilroy-Regular", size: 12))
        Text("*")
            .foregroundColor(Color.red)
            .frame(maxWidth: .infinity, maxHeight: 72, alignment: .topLeading)
            .padding(EdgeInsets(top: 0, leading: 100, bottom: 0, trailing: 0))
        
    }
}


func ButtonMarron(texto:String) -> some View{
    return HStack{
        Spacer()
        Text(texto)
        Spacer()
        Image("flechaSiguiente")
            .resizable()
            .frame(width: 20,height: 20)
    }
    .padding()
    .frame(width: 272,height: 56)
    .foregroundColor(Color.white)
    .background(Color("ColorButton"))
    .cornerRadius(10)
}

func CeldaEspecias(especia:GetEspeciasResponse,
                   clickEnCelda: @escaping () -> Void) -> some View{
    
    return VStack{
        KFImage(URL(string: especia.url))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 80,height: 80)
            .background(Color.black)
            .clipShape(Circle())
        
        Text(especia.nombre)
            .font(.custom("Gilroy-Light", size: 15))
            .bold()
        
        Text("$\(especia.precio)")
            .font(.custom("Gilroy-Light", size: 13))
            .foregroundColor(Color("ColorPaswordOlvidado"))
        
    }
    .padding(20)
    .background(obtenerColoDeCelda(esSeleccionado: especia.corazonActivado))
    .cornerRadius(10)
    .onTapGesture {
        clickEnCelda()
    }
}

func CeldaEspeciasLargo(especia:GetEspeciasResponse,
                   clickEnCelda: @escaping () -> Void) -> some View{
    
    return HStack{
        KFImage(URL(string: especia.url))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 80,height: 80)
            .background(Color.black)
            .clipShape(Circle())
        VStack{
            Text(especia.nombre)
                .font(.custom("Gilroy-Light", size: 15))
                .bold()
            
            Text("$\(especia.precio)")
                .font(.custom("Gilroy-Light", size: 13))
                .foregroundColor(Color("ColorPaswordOlvidado"))
        }
    }
    .padding(20)
    .background(obtenerColoDeCelda(esSeleccionado: especia.corazonActivado))
    .cornerRadius(10)
    .onTapGesture {
        clickEnCelda()
    }
}


func obtenerColoDeCelda(esSeleccionado: Bool) -> Color{
    if(esSeleccionado){
        return Color("ColorPaswordOlvidado")
    }
    else{
        return Color("ColorButton")
    }
}

func LogoGeneralCelda()-> some View{
    return VStack{
        Image("simboloCaffe")
            .resizable()
            .frame(width: 51.61,height: 51.61)
            .scaledToFit()
        Text("COFFEE TASTE!")
            .font(.custom("Gilroy-Regular", size: 13))
            .baselineOffset(50)
    }
}

func ForGotPasworCelda() -> some View{
    return Text("Forgot password?")
        .foregroundColor(Color("ColorPaswordOlvidado"))
        .font(.custom("Gilroy-Light", size: 17))
        .underline(true, color: Color("ColorPaswordOlvidado"))
        .padding(.bottom,60)
}
