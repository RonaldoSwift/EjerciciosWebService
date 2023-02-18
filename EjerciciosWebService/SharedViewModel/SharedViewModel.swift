//
//  SharedViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 16/02/23.
//

import Foundation

class SharedViewModel: ObservableObject{
    @Published var getEspeciasResponse: GetEspeciasResponse = GetEspeciasResponse.init(id: "", nombre: "", precio: 0, url: "", corazonActivado: false)
    
    func guardarGetEspeciasResponse(getEspeciasResponse: GetEspeciasResponse){
        self.getEspeciasResponse = getEspeciasResponse
    }
}
