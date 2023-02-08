//
//  PostCasasResponse.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 7/02/23.
//

import Foundation

struct PostCasasResponse: Decodable{
    let id: String
    let distrito: String
    let direccion: String
    let precio: Int
    let descripcion: String
    let area: Int
    let url: String
}
