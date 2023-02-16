//
//  Componente.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 15/02/23.
//

import Foundation
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
    }
    
}

func ContraseñaDeTelefonoTextField(contraseñaDeCelular:Binding<String>) -> some View{
    return ZStack{
        HStack{
            Image(systemName: "ellipsis")
            TextField("", text: contraseñaDeCelular)
            Spacer()
            Image(systemName: "eye.fill")
        }
        .padding()
        .frame(maxWidth:.infinity, maxHeight: 50)
        .background(
            Capsule()
                .strokeBorder(Color("SombraColor"),lineWidth: 0.8)
                .clipped()
        )
        .clipShape(Capsule())
        
        Text("RE-PASSWORD")
            .frame(maxWidth: .infinity, maxHeight: 72, alignment: .topLeading)
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0))
    }
}


func ButtonMarron(texto:String) -> some View{
    return HStack{
        Spacer()
        Text(texto)
        Spacer()
        Image(systemName:"chevron.right")
    }
    .padding()
    .frame(width: 272,height: 56)
    .foregroundColor(Color.white)
    .background(Color("ColorButton"))
    .cornerRadius(10)
}

