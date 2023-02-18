//
//  LikesView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 16/02/23.
//

import SwiftUI

struct LikesView: View {
    var body: some View {
        ZStack{
            Image("FondoDePantallas")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Corazon")
            }
            .padding()
        }
    }
}

struct LikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView()
    }
}
