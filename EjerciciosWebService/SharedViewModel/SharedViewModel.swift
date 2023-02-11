//
//  SharedViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 10/02/23.
//

import Foundation
class SharedViewModel: ObservableObject{
    @Published var getMaravillasResponse:
    GetMaravillasResponse = GetMaravillasResponse.init(id: "", nombre: "", descripcion: "", url: "", corazonActivado: false)
    
    func guardarGetMaravillasResponse(getMaravillasResponse:GetMaravillasResponse){
        self.getMaravillasResponse = getMaravillasResponse
    }
}
