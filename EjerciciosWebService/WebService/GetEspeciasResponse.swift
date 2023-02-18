//
//  GetEspeciasResponse.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 16/02/23.
//

import Foundation

struct GetEspeciasResponse : Decodable{
    var id: String
    var nombre: String
    var precio: Int
    var url: String
    var corazonActivado: Bool
}
