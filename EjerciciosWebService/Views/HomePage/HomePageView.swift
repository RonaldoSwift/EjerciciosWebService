//
//  HomePageView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 22/02/23.
//

import Kingfisher
import SwiftUI

struct HomePageView: View {
    var homePageViewModel: HomePageViewModel = .init()
    @State private var listaDeMusicas: [Musica] = []
    @State private var detalleDeMusica: Bool = false
    @EnvironmentObject var sharedViewModel: SharedViewModel

    var body: some View {
        ZStack {
            Color.black
            VStack {
                HStack {
                    Image("Lupa")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.trailing, 60)
                    LogoDeSpotify()
                    Image("Ajustes")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.leading, 60)
                }
                .padding(.bottom, 20)

                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("ColorAmarillo"))
                        .frame(width: 314, height: 118)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Popular")
                                .foregroundColor(Color.white)
                            Text("Sisa Rasa")
                                .font(.title2)
                                .bold()
                                .foregroundColor(Color.white)
                            Text("Mahalini")
                                .foregroundColor(Color.white)
                        }
                        .padding()
                        Image("MujerImage")
                            .resizable()
                            .frame(width: 134, height: 142)
                            .padding(.leading, 30)
                            .padding(.bottom, 25)
                        Image(systemName: "chevron.right")
                            .padding(.trailing, 15)
                    }
                }

                Text("Today’s hits")
                    .font(.title2)
                    .bold()
                    .padding(.trailing, 100)

                ScrollView(.horizontal) {
                    HStack {
                        ForEach(listaDeMusicas, id: \.id) { musica in
                            celdaMusica(musica: musica, clickEnCelda: {
                                // GUARDAMOS LA LISTA DE MUSCIAS PARA USARLO EN OTRA PANTALLA
                                sharedViewModel.guardarMusica(musica: musica)
                                detalleDeMusica = true
                            })
                        }
                    }
                }

                ScrollView(.horizontal) {
                    HStack {
                        Text("Artist")
                            .font(.title2)
                            .bold()
                            .padding(.leading, 10)
                        Text("Album")
                            .font(.title2)
                            .bold()
                            .padding(.leading, 30)
                        Text("Podcast")
                            .font(.title2)
                            .bold()
                            .padding(.leading, 30)
                        Text("Get")
                            .font(.title2)
                            .bold()
                            .padding(.leading, 30)
                    }
                }
            }
            .padding()
            NavigationLink(destination: DetalleMusicaView(), isActive: $detalleDeMusica) {
                EmptyView()
            }
        }
        // TRAES DEL VIEW MODEL
        .onReceive(homePageViewModel.$musicas) { musicas in
            listaDeMusicas = musicas
        }
        // EJECUTA CUANDO LA PANTALLA APARECE
        .onAppear {
            homePageViewModel.traerMusicasDeFireBase()
        }
    }

    private func celdaMusica(musica: Musica, clickEnCelda: @escaping () -> Void) -> some View {
        return VStack {
            KFImage(URL(string: musica.url))
            Text("\(musica.titulo)")
                .multilineTextAlignment(.leading)
            Text("\(musica.cantante)")
                .multilineTextAlignment(.leading)
        }
        .onTapGesture {
            clickEnCelda()
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
