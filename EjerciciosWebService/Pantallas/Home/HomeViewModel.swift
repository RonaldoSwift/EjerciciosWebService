//
//  HomeViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 7/02/23.
//

import Foundation
import CoreData
import Alamofire

class HomeViewModel: ObservableObject{
    
    let persitentContainer : NSPersistentContainer
    
    init(){
        self.persitentContainer = NSPersistentContainer(name: "EjerciciosWebService")
        self.persitentContainer.loadPersistentStores { (description: NSPersistentStoreDescription, error: Error?) in
            if(error != nil){
                fatalError("No se puede cargar la base de Datos")
            }
        }
    }
    
    func crearCasaEnBaseDeDatos(getCasasResponse:GetCasasResponse) async{
        do{
            try crear(getCasasResponse: getCasasResponse)
        } catch{
            fatalError("No se pudo agregar Casa")
        }
    }
    
    private func crear(getCasasResponse:GetCasasResponse) throws -> (){
        let casaItemEntity = CasaItemEntity(context: persitentContainer.viewContext)
        casaItemEntity.id = getCasasResponse.id
        casaItemEntity.precio = Int64(getCasasResponse.precio)
        casaItemEntity.url = getCasasResponse.url
        casaItemEntity.distrito = getCasasResponse.distrito
        casaItemEntity.direccion = getCasasResponse.direccion
        casaItemEntity.descripcion = getCasasResponse.descripcion
        casaItemEntity.area = Int64(getCasasResponse.area)
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
    
    
    
    func obtenerTodasLasCasasDeWebService() async throws ->[GetCasasResponse]{
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
    
    func eliminarCasaDeWebService(deletCasasRequest: DeleteCasasRequest) async throws -> DeleteCasasResponse {
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
