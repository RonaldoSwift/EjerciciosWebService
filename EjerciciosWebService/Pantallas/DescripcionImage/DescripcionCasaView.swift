//
//  DescripcionCasaView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 7/02/23.
//

import SwiftUI
import Kingfisher

struct DescripcionCasaView: View {
    var verCasasView: HomeView = HomeView()
    @EnvironmentObject var sharedViewModel: SharedViewModel
    var body: some View {
        VStack{
            KFImage(URL(string: sharedViewModel.getCasasResponse.url))
                .resizable()
                .border(Color.red,width: 3.0)
                .frame(width: 380,height: 200)
                .scaledToFit()
            Spacer()
            
            ScrollView{
                Text(sharedViewModel.getCasasResponse.descripcion)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(Color.black)
            }
            
            Spacer()
            
            Button {
                print("Pedido reservado")
            } label: {
                Text("Reservar")
            }
            .padding()
            .frame(width: 300,height: 50)
            .background(Color("Boton"))
            .foregroundColor(Color.white)
            .cornerRadius(10)
            Spacer()
        }
        .padding()
        .background(Color("ColorPrincipal"))
    }
}

struct DescripcionCasaView_Previews: PreviewProvider {
    static var previews: some View {
        DescripcionCasaView()
    }
}
