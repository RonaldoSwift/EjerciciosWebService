//
//  DetalleMusicaView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 27/02/23.
//

import Kingfisher
import SwiftUI

struct DetalleMusicaView: View {
    @EnvironmentObject var sharedViewModel: SharedViewModel

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                KFImage(URL(string: sharedViewModel.musica.url))
            }
        }
    }
}

struct DetalleMusicaView_Previews: PreviewProvider {
    static var previews: some View {
        DetalleMusicaView()
    }
}
