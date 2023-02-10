//
//  ActualizarMaravillaViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 9/02/23.
//

import Foundation
import Alamofire

class ActualizarMaravillaViewModel:ObservableObject{
    func actualizarMaravilla(putMaravillasRequest: PutMaravillasRequest) async throws -> PutMaravillasResponse {
        
        await withUnsafeContinuation({ (continuation: UnsafeContinuation<PutMaravillasResponse, Never>) in
            AF.request(
                "https://amazing-office-375916.ue.r.appspot.com/maravillas/\(putMaravillasRequest.id)",
                method: .put,
                parameters: putMaravillasRequest,
                encoder: JSONParameterEncoder.default
            ).validate()
                .responseDecodable(of: PutMaravillasResponse.self) { (dataResponse: DataResponse<PutMaravillasResponse, AFError>) in
                    let statusCode = dataResponse.response?.statusCode
                    
                    switch(dataResponse.result){
                    case .success(let putMaravillasResponse):
                        continuation.resume(returning: putMaravillasResponse)
                        break
                    case .failure(let aferror):
                        print(aferror)
                        break
                    }
                }
        })
    }
}
