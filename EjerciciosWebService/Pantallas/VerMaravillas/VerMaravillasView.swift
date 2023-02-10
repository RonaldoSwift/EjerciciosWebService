//
//  VerMaravillasView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 9/02/23.
//

import SwiftUI

struct VerMaravillasView: View {
    var body: some View {
        ZStack{
            Image("FondoVerPantalla")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("")
                    .resizable()
                    .scaledToFit()
                Spacer()

            }
            .padding()
        }
    }
}

struct VerMaravillasView_Previews: PreviewProvider {
    static var previews: some View {
        VerMaravillasView()
    }
}
