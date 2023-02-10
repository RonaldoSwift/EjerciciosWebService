//
//  PostMaravillasResponse.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 9/02/23.
//

import Foundation
struct PostMaravillasResponse:Decodable{
    let id: String
    let nombre:String
    let descripcion: String
    let url:String
}
