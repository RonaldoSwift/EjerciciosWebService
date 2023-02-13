//
//  MaravillasDescripcionView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 10/02/23.
//

import SwiftUI
import Kingfisher

struct MaravillasDescripcionView: View {
    var verMaravilla: VerMaravillasView = VerMaravillasView()
    @EnvironmentObject var sharedViewModel: SharedViewModel
    
    var body: some View {
        VStack{
            KFImage(URL(string: sharedViewModel.getMaravillasResponse.url))
                .resizable()
                .border(Color.red,width: 3.0)
                .frame(width: 380,height: 200)
                .scaledToFit()
            
            Text(sharedViewModel.getMaravillasResponse.nombre)
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color.white)
            Spacer()
            
            ScrollView{
                Text(sharedViewModel.getMaravillasResponse.descripcion)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(Color.black)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.black)
    }
}

struct MaravillasDescripcionView_Previews: PreviewProvider {
    static var previews: some View {
        MaravillasDescripcionView()
    }
}
