//
//  PostEspeciasRequest.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 16/02/23.
//

import Foundation

struct PostEspeciasRequest : Encodable{
    var id: String
    var nombre: String
    var precio: Int
    var url: String
}
