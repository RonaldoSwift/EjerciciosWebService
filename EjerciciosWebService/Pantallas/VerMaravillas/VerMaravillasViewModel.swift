//
//  VerMaravillasViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 9/02/23.
//

import Foundation
import CoreData
import Alamofire

class VerMaravillasViewModel: ObservableObject{
    
    let persitentContainer : NSPersistentContainer
    
    init(){
        self.persitentContainer = NSPersistentContainer(name: "EjerciciosWebService")
        self.persitentContainer.loadPersistentStores { (description: NSPersistentStoreDescription, error: Error?) in
            if(error != nil){
                fatalError("No se puede cargar la base de Datos")
            }
        }
    }
    
    func crearMaravillaEnBaseDeDatos(getMaravillasResponse:GetMaravillasResponse) async{
        do{
            try crear(getMaravillasResponse: getMaravillasResponse)
        } catch{
            fatalError("No se pudo agregar Casa")
        }
    }
    
    private func crear(getMaravillasResponse:GetMaravillasResponse) throws -> (){
        let maravillaItemEntity = MaravillaItemEntity(context: persitentContainer.viewContext)
        maravillaItemEntity.id = getMaravillasResponse.id
        maravillaItemEntity.nombre = getMaravillasResponse.nombre
        maravillaItemEntity.descripcion = getMaravillasResponse.descripcion
        maravillaItemEntity.url = getMaravillasResponse.url
        saveContext()
    }
    
    private func saveContext(){
        let context = persitentContainer.viewContext
        if(context.hasChanges){
            do{
                try context.save()
            } catch{
                fatalError("Error \(error.localizedDescription)")
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    func obtenerTodasLasMaravillas() async throws ->[GetMaravillasResponse]{
        await withUnsafeContinuation({ (continuation:UnsafeContinuation<[GetMaravillasResponse],Never>) in
            AF.request(
                "https://amazing-office-375916.ue.r.appspot.com/maravillas",
                method: .get
            )
            .responseDecodable(of:[GetMaravillasResponse].self){dataResponse in
                let status = dataResponse.response?.statusCode
                print("Status Code \(status)")
                switch(dataResponse.result){
                case .success(let getMaravillasResponse):
                    print(getMaravillasResponse)
                    continuation.resume(returning: getMaravillasResponse)
                    break
                case .failure(let aferror):
                    print(aferror)
                    break
                }
            }
        })
    }
    
    func eliminarMaravillaDeWebService(deletMaravillasRequest: DeleteMaravillasRequest) async throws -> DeleteMaravillasResponse {
        await withUnsafeContinuation({ (continuation: UnsafeContinuation<DeleteMaravillasResponse, Never>) in
            AF.request(
                "https://amazing-office-375916.ue.r.appspot.com/maravillas/\(deletMaravillasRequest.id)",
                method: .delete,
                parameters: deletMaravillasRequest,
                encoder: JSONParameterEncoder.default
            ).validate()
                .responseDecodable(of: DeleteMaravillasResponse.self) { (dataResponse: DataResponse<DeleteMaravillasResponse, AFError>) in
                    let statusCode = dataResponse.response?.statusCode
                    
                    switch(dataResponse.result){
                    case .success(let deleteMaravillasResponse):
                        continuation.resume(returning: deleteMaravillasResponse)
                        break
                    case .failure(let aferror):
                        print(aferror)
                        break
                    }
                }
        })
    }
}
