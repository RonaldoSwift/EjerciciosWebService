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
    let detalleMusicaViewModel: DetalleMusicaViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                KFImage(URL(string: sharedViewModel.musica.url))
                    .resizable()
                    .frame(width: 80, height: 90)
                Text(sharedViewModel.musica.titulo)
                    .font(.largeTitle)
                    .bold()
                Text(sharedViewModel.musica.cantante)

                HStack {
                    Button {
                        detalleMusicaViewModel.loadMusic(urlDeMusica: sharedViewModel.musica.urlDeMusica)
                    } label: {
                        Image(systemName: "gobackward")
                            .resizable()
                            .padding()
                            .frame(width: 70, height: 70)
                            .foregroundColor(Color("ColorButton"))
                            .cornerRadius(10)
                    }

                    Button {
                        detalleMusicaViewModel.playMusic()
                    } label: {
                        Image(systemName: "play.circle")
                            .resizable()
                            .padding()
                            .frame(width: 70, height: 70)
                            .foregroundColor(Color("ColorButton"))
                            .cornerRadius(10)
                    }

                    Button {
                        detalleMusicaViewModel.pauseMusic()
                    } label: {
                        Image(systemName: "pause.circle.fill")
                            .resizable()
                            .padding()
                            .frame(width: 70, height: 70)
                            .foregroundColor(Color("ColorButton"))
                            .cornerRadius(10)
                    }
                }
                .padding(.top, 80)
            }
        }
    }
}

struct DetalleMusicaView_Previews: PreviewProvider {
    static var previews: some View {
        DetalleMusicaView()
    }
}
