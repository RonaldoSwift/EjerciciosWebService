//
//  SharedViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 2/02/23.
//

import Foundation

class SharedViewModel: ObservableObject{
    @Published var getComidasResponse: GetComidasResponse = GetComidasResponse.init(id: "", nombre: "", precio: 0, url: "",descripcion: "")
    
    func guardarGetComidasResponse(getComidasResponse: GetComidasResponse){
        self.getComidasResponse = getComidasResponse
    }
}
