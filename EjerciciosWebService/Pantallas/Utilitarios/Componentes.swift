//
//  Componentes.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 8/02/23.
//

import Foundation
import Kingfisher
import SwiftUI

func celdaDeVerCasas(casa:GetCasasResponse,
                     clickEnTexto: @escaping ()-> Void,
                     clickEnTacho: @escaping () -> Void,
                     clickEnCorazonDescativado: @escaping () -> Void,
                     clickEnCorazonActivado: @escaping () -> Void
)-> some View{
    ZStack{
        HStack{
            KFImage(URL(string: casa.url))
                .resizable()
                .frame(width: 150,height: 150)
                .border(Color.red,width: 3.0)
                .scaledToFit()
            
            Text("ID:\(casa.id) \nDistrito:\(casa.distrito)  \nDireccrion:\(casa.direccion)  \nPrecio:\(casa.precio)  \nArea:\(casa.area)")
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
        }
        
        VStack{
            HStack{
                Spacer()
                if(casa.corazonActivado == true){
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
    .padding(20)
    .shadow(radius: 5)
    .background(Color("ColorButton"))
    .cornerRadius(12)
}
