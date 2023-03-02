//
//  PlayListViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 24/02/23.
//

import FirebaseFirestore
import Foundation

class PlayListViewModel: ObservableObject {
    var fireStore = Firestore.firestore()
    @Published var musicas: [Musica] = []

    func traerMusicasDeFireBase() {
        let coleccion = fireStore.collection("musicas")
        coleccion.getDocuments { (querySnapshot: QuerySnapshot?, error: Error?) in
            guard error == nil else {
                print("\(error) Hubo un error no se pudo traer las mucicas")
                return
            }

            if let querySnapshot = querySnapshot {
                for documento in querySnapshot.documents {
                    let data = documento.data()

                    let cantante = data["cantante"] as? String ?? ""
                    let id = data["id"] as? String ?? ""
                    let titulo = data["titulo"] as? String ?? ""
                    let url = data["url"] as? String ?? ""
                    let urlDeMusica = data["urlDeMusica"] as? String ?? ""

                    print("\(cantante)- \(titulo)")

                    self.musicas.append(Musica(id: id, cantante: cantante, titulo: titulo, url: url, urlDeMusica: urlDeMusica))
                }
            }
        }
    }
}
