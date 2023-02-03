//
//  ComidaImgeView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 2/02/23.
//

import SwiftUI
import Kingfisher

struct ComidaImgeView: View {
    
    var verComidasView: VerComidaView = VerComidaView()
    @EnvironmentObject var sharedComidaViewModel: SharedViewModel
    
    var body: some View {
        VStack{
            KFImage(URL(string: sharedComidaViewModel.getComidasResponse.url))
                .resizable()
                .border(Color.red,width: 3.0)
                .frame(width: 380,height: 200)
                .scaledToFit()
            
            Spacer()
            
            ScrollView {
                Text(sharedComidaViewModel.getComidasResponse.descripcion)
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
            
        }
        .padding()
        .background(Color("FondoPrincipal"))
        .navigationTitle("INFORMACION")
    }
}

struct ComidaImgeView_Previews: PreviewProvider {
    static var previews: some View {
        ComidaImgeView()
    }
}
