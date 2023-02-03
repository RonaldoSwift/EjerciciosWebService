//
//  PutComidasRequest.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 2/02/23.
//

import Foundation
struct PutComidasRequest: Encodable{
    let id: String
    let nombre: String
    let precio: Int
    let url: String
}
