//
//  AgregarMaravillaViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 9/02/23.
//

import Foundation
import Alamofire

class AgregarMaravillaViewModel:ObservableObject{
    func crearMaravila(postMaravillasRequest: PostMaravillasRequest) async throws -> PostMaravillasResponse {
        await withUnsafeContinuation({ (continuation: UnsafeContinuation<PostMaravillasResponse, Never>) in
            AF.request(
                "https://amazing-office-375916.ue.r.appspot.com/maravillas",
                method: .post,
                parameters: postMaravillasRequest,
                encoder: JSONParameterEncoder.default
            ).validate()
                .responseDecodable(of: PostMaravillasResponse.self) { (dataResponse: DataResponse<PostMaravillasResponse, AFError>) in
                    let statusCode = dataResponse.response?.statusCode
                    switch(dataResponse.result){
                    case .success(let postMaravillasResponse):
                        continuation.resume(returning: postMaravillasResponse)
                        break
                    case .failure(let aferror):
                        print(aferror)
                        break
                    }
                }
        })
    }
}
