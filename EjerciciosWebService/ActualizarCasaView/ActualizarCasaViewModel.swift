//
//  ActualizarCasaViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 7/02/23.
//

import Foundation
import Alamofire

class ActualizarCasaViewModel: ObservableObject{
    
    func actualizarComida(putCasasRequest: PutCasasRequest) async throws -> PutCasasResponse {
        
        await withUnsafeContinuation({ (continuation: UnsafeContinuation<PutCasasResponse, Never>) in
            AF.request(
                "https://amazing-office-375916.ue.r.appspot.com/lugares/\(putCasasRequest.id)",
                method: .put,
                parameters: putCasasRequest,
                encoder: JSONParameterEncoder.default
            ).validate()
                .responseDecodable(of: PutCasasResponse.self) { (dataResponse: DataResponse<PutCasasResponse, AFError>) in
                    let statusCode = dataResponse.response?.statusCode
                    
                    switch(dataResponse.result){
                    case .success(let putCasasResponse):
                        continuation.resume(returning: putCasasResponse)
                        break
                    case .failure(let aferror):
                        print(aferror)
                        break
                    }
                }
        })
    }
}
