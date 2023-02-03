//
//  PostComidasResponse.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 2/02/23.
//

import Foundation
struct PostComidasResponse: Decodable{
    let id: String
    let nombre: String
    let precio: Int
    let url: String
}
