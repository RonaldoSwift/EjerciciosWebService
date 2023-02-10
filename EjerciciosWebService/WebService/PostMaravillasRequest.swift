//
//  PostMaravillasRequest.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 9/02/23.
//

import Foundation
struct PostMaravillasRequest:Encodable{
    let id: String
    let nombre:String
    let descripcion: String
    let url:String
}
