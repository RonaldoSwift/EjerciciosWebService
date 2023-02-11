//
//  LikesViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 10/02/23.
//

import Foundation
import CoreData

class LikesViewModel: ObservableObject{
    
    let persistenContainer : NSPersistentContainer
    
    init(){
        self.persistenContainer = NSPersistentContainer(name: "EjerciciosWebService")
        self.persistenContainer.loadPersistentStores {(description: NSPersistentStoreDescription, error: Error?) in
            if error != nil {
                fatalError("No se pudo caragr la base de datos")
            }
        }
    }
    
//    MARK: ELIMINAR
    func eliminarMaravillaDeBaseDeDatos(_ id: String) async -> (){
        do{
            try eliminar(id)
        } catch{
            fatalError("Error no se pudo eliminar")
        }
    }
    
    private func eliminar(_ id: String) throws -> (){
        let casaItemEntity = try getEntityById(id)!
        let context = persistenContainer.viewContext
        context.delete(casaItemEntity)
        do{
            try context.save()
        } catch{
            context.rollback()
            fatalError("Error \(error.localizedDescription)")
        }
    }
    
//    MARK: OBENTER
    
    func obtenerTodaslasMaravillasDeBaseDeDatos() async -> [GetMaravillasResponse]{
        do{
            let casas = try getAll()
            return casas
        } catch{
            return []
        }
    }
    
    private func getAll() throws ->[GetMaravillasResponse]{
        let request = MaravillaItemEntity.fetchRequest()
        return try persistenContainer.viewContext.fetch(request).map({
            (maravillaItemEntity : MaravillaItemEntity) in
            GetMaravillasResponse(
                id: maravillaItemEntity.id!,
                nombre: maravillaItemEntity.nombre!,
                descripcion: maravillaItemEntity.descripcion!,
                url: maravillaItemEntity.url!,
                corazonActivado: true
            )
        })
    }
    
    private func getEntityById(_ id: String) throws -> MaravillaItemEntity?{
        let request = MaravillaItemEntity.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "id = %@", id)
        let context = persistenContainer.viewContext
        let pacienteEntity = try context.fetch(request)[0]
        return pacienteEntity
    }
    
    private func saveContext(){
        let context = persistenContainer.viewContext
        if(context.hasChanges){
            do{
                try context.save()
            } catch{
                fatalError("Error \(error.localizedDescription)")
            }
        }
    }
}
