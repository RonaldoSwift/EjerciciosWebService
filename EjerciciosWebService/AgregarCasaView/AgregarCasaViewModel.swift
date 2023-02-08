//
//  AgregarCasaViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 7/02/23.
//

import Foundation
import Alamofire

class AgregarCasaViewModel: ObservableObject{
    
    func crearComida(postCasasRequest: PostCasasRequest) async throws -> PostCasasResponse {
        await withUnsafeContinuation({ (continuation: UnsafeContinuation<PostCasasResponse, Never>) in
            AF.request(
                "https://8080-cs-2f140b40-b0ba-4649-a6b5-fc8625d7ddf9.cs-us-east1-vpcf.cloudshell.dev/lugares",
                method: .post,
                parameters: postCasasRequest,
                encoder: JSONParameterEncoder.default
            ).validate()
                .responseDecodable(of: PostCasasResponse.self) { (dataResponse: DataResponse<PostCasasResponse, AFError>) in
                    let statusCode = dataResponse.response?.statusCode
                    switch(dataResponse.result){
                    case .success(let postCasasResponse):
                        continuation.resume(returning: postCasasResponse)
                        break
                    case .failure(let aferror):
                        print(aferror)
                        break
                    }
                }
        })
    }
}
