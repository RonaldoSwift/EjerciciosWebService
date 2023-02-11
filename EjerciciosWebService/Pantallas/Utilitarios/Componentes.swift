//
//  Componentes.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 10/02/23.
//

import Foundation
import Kingfisher
import SwiftUI

func celdaDeVerMaravillas(maravillas: GetMaravillasResponse,
                                  clickEnTexto: @escaping () ->Void,
                                  clickEnTacho: @escaping () ->Void,
                                  clickEnCorazonDescativado: @escaping () -> Void,
                                  clickEnCorazonActivado: @escaping () -> Void
)-> some View{
    return HStack{
        KFImage(URL(string: maravillas.url))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100,height: 100, alignment: .center)
            .border(Color.red,width: 3.0)
            .clipped()
        
        Text("ID: \(maravillas.id) \nNombre:\(maravillas.nombre)")
            .onTapGesture {
                clickEnTexto()
            }
        
        Button {
            clickEnTacho()
        } label: {
            Image("Tachito")
                .resizable()
                .scaledToFit()
                .frame(width: 30,height: 30)
        }
        VStack{
            HStack{
                Spacer()
                if(maravillas.corazonActivado == true){
                    Button {
                        clickEnCorazonActivado()
                    } label: {
                        Image(systemName: "heart.fill")
                            .foregroundColor(Color.red)
                    }
                }else{
                    Button {
                        clickEnCorazonDescativado()
                    } label: {
                        Image(systemName: "heart.fill")
                            .foregroundColor(Color.white)
                    }
                }
            }
            Spacer()
        }
    }
}
