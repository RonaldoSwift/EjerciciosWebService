//
//  VerEspeciasViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 15/02/23.
//

import Foundation
import Alamofire
import CoreData
import FirebaseAuth

class VerEspeciasViewModel: ObservableObject{
    
    let persitentContainer : NSPersistentContainer
    
    init(){
        self.persitentContainer = NSPersistentContainer(name: "EjerciciosWebService")
        self.persitentContainer.loadPersistentStores { (description: NSPersistentStoreDescription, error: Error?) in
            if(error != nil){
                fatalError("No se puede cargar la base de Datos")
            }
        }
    }
    
    func crearEspeciasEnBaseDeDatos(getEspeciasResponse:GetEspeciasResponse) async{
        do{
            try crear(getEspeciasResponse: getEspeciasResponse)
        } catch{
            fatalError("No se pudo agregar Casa")
        }
    }
    
    private func crear(getEspeciasResponse:GetEspeciasResponse) throws -> (){
        let especiasItemEntity = EspeciasItemEntity(context: persitentContainer.viewContext)
        especiasItemEntity.id = getEspeciasResponse.id
        especiasItemEntity.nombre = getEspeciasResponse.nombre
        especiasItemEntity.precio = Int64(getEspeciasResponse.precio)
        especiasItemEntity.url = getEspeciasResponse.url
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
    
    func obtenerTodasLasEspecias() async throws ->[GetEspeciasResponse]{
        await withUnsafeContinuation({ (continuation:UnsafeContinuation<[GetEspeciasResponse],Never>) in
            AF.request(
                "https://amazing-office-375916.ue.r.appspot.com/especias",
                method: .get
            )
            .responseDecodable(of:[GetEspeciasResponse].self){dataResponse in
                let status = dataResponse.response?.statusCode
                print("Status Code \(status)")
                switch(dataResponse.result){
                case .success(let getEspeciasResponse):
                    print(getEspeciasResponse)
                    continuation.resume(returning: getEspeciasResponse)
                    break
                case .failure(let aferror):
                    print(aferror)
                    break
                }
            }
        })
    }
    
    func eliminarEspeciaDeWebService(deletEspeciasRequest: DeleteEspeciasRequest) async throws -> DeleteEspeciasResponse {
        await withUnsafeContinuation({ (continuation: UnsafeContinuation<DeleteEspeciasResponse, Never>) in
            AF.request(
                "https://amazing-office-375916.ue.r.appspot.com/especias/\(deletEspeciasRequest.id)",
                method: .delete,
                parameters: deletEspeciasRequest,
                encoder: JSONParameterEncoder.default
            ).validate()
                .responseDecodable(of: DeleteEspeciasResponse.self) { (dataResponse: DataResponse<DeleteEspeciasResponse, AFError>) in
                    let statusCode = dataResponse.response?.statusCode
                    
                    switch(dataResponse.result){
                    case .success(let deleteEspeciasResponse):
                        continuation.resume(returning: deleteEspeciasResponse)
                        break
                    case .failure(let aferror):
                        print(aferror)
                        break
                    }
                }
        })
    }
    
    
    func cerrarSesion(){
        do{
            try Auth.auth().signOut()
        } catch{
            print("No se pudo serrar sesion")
        }
    }
}
