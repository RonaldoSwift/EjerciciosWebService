//
//  ComprasView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 16/02/23.
//

import SwiftUI

struct ComprasView: View {
    var body: some View {
        ZStack{
            Image("FondoDePantallas")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("COMPRAS")
            }
            .padding()
        }
    }
}

struct ComprasView_Previews: PreviewProvider {
    static var previews: some View {
        ComprasView()
    }
}
