//
//  VerCasaViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 7/02/23.
//

import Foundation
import Alamofire

class VerCasaViewModel: ObservableObject{
    func obtenerTodasLasCasas() async throws ->[GetCasasResponse]{
        await withUnsafeContinuation({ (continuation:UnsafeContinuation<[GetCasasResponse],Never>) in
            AF.request(
                "https://amazing-office-375916.ue.r.appspot.com/lugares",
                method: .get
            )
            .responseDecodable(of:[GetCasasResponse].self){dataResponse in
                let status = dataResponse.response?.statusCode
                print("Status Code \(status)")
                switch(dataResponse.result){
                case .success(let getCasasResponse):
                    print(getCasasResponse)
                    continuation.resume(returning: getCasasResponse)
                    break
                case .failure(let aferror):
                    print(aferror)
                    break
                }
            }
        })
    }
    
    func eliminarCasa(deletCasasRequest: DeleteCasasRequest) async throws -> DeleteCasasResponse {
        await withUnsafeContinuation({ (continuation: UnsafeContinuation<DeleteCasasResponse, Never>) in
            AF.request(
                "https://amazing-office-375916.ue.r.appspot.com/lugares/\(deletCasasRequest.id)",
                method: .delete,
                parameters: deletCasasRequest,
                encoder: JSONParameterEncoder.default
            ).validate()
                .responseDecodable(of: DeleteCasasResponse.self) { (dataResponse: DataResponse<DeleteCasasResponse, AFError>) in
                    let statusCode = dataResponse.response?.statusCode
                    
                    switch(dataResponse.result){
                    case .success(let deleteCasasResponse):
                        continuation.resume(returning: deleteCasasResponse)
                        break
                    case .failure(let aferror):
                        print(aferror)
                        break
                    }
                }
        })
    }
}
