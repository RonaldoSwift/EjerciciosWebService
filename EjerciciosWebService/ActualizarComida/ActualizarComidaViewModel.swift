//
//  ActualizarComidaViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 2/02/23.
//

import Foundation
import Alamofire

class ActualizarComidaViewModel:ObservableObject{
    func actualizarComida(putComidasRequest: PutComidasRequest) async throws -> PutComidasResponse {
        
        await withUnsafeContinuation({ (continuation: UnsafeContinuation<PutComidasResponse, Never>) in
            AF.request(
                "https://amazing-office-375916.ue.r.appspot.com/comidas/\(putComidasRequest.id)",
                method: .put,
                parameters: putComidasRequest,
                encoder: JSONParameterEncoder.default
            ).validate()
                .responseDecodable(of: PutComidasResponse.self) { (dataResponse: DataResponse<PutComidasResponse, AFError>) in
                    let statusCode = dataResponse.response?.statusCode
                    
                    switch(dataResponse.result){
                    case .success(let putComidasResponse):
                        continuation.resume(returning: putComidasResponse)
                        break
                    case .failure(let aferror):
                        print(aferror)
                        break
                    }
                }
        })
    }
}
