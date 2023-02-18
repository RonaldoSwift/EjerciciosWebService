//
//  PerfilView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 16/02/23.
//

import SwiftUI

struct PerfilView: View {
    var body: some View {
        ZStack{
            Image("FondoDePantallas")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Prefil")
            }
            .padding()
        }
    }
}

struct PerfilView_Previews: PreviewProvider {
    static var previews: some View {
        PerfilView()
    }
}
