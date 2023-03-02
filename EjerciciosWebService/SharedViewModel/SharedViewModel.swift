//
//  SharedViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 28/02/23.
//

import Foundation

class SharedViewModel: ObservableObject {
    @Published var musica: Musica = .init(id: "", cantante: "", titulo: "", url: "", urlDeMusica: "")

    func guardarMusica(musica: Musica) {
        self.musica = musica
    }
}
