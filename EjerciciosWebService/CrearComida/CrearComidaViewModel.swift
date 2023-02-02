//
//  CrearComidaViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 2/02/23.
//

import Foundation
import Alamofire

class CrearComidaViewModel:ObservableObject{
    func crearComida(postComidasRequest: PostComidasRequest) async throws -> PostComidasResponse {
        await withUnsafeContinuation({ (continuation: UnsafeContinuation<PostComidasResponse, Never>) in
            AF.request(
                "https://amazing-office-375916.ue.r.appspot.com/comidas",
                method: .post,
                parameters: postComidasRequest,
                encoder: JSONParameterEncoder.default
            ).validate()
                .responseDecodable(of: PostComidasResponse.self) { (dataResponse: DataResponse<PostComidasResponse, AFError>) in
                    let statusCode = dataResponse.response?.statusCode
                    switch(dataResponse.result){
                    case .success(let postComidasResponse):
                        continuation.resume(returning: postComidasResponse)
                        break
                    case .failure(let aferror):
                        print(aferror)
                        break
                    }
                }
        })
    }
}
