//
//  SharedViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 7/02/23.
//

import Foundation

class SharedViewModel: ObservableObject{
    @Published var getCasasResponse: GetCasasResponse = GetCasasResponse.init(id: "", distrito: "", direccion: "", precio: 0, descripcion: "", area: 0, url: "", corazonActivado: false)
    
    func guardarGetCasasResponse(getCasasReponse: GetCasasResponse){
        self.getCasasResponse = getCasasReponse
    }
}
