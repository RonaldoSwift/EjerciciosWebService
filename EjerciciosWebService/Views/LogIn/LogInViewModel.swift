//
//  LogInViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 23/02/23.
//

import Foundation
import FirebaseAuth

class LogInViewModel:ObservableObject{
    @Published var irAHomePage:Bool = false
    @Published var mostrarErrorAlert:Bool = false
    
    func login(emali:String, pasword:String){
        Auth.auth().signIn(withEmail: emali, password: pasword) { [self]authResult,error in
            
            if let errorNoNulo = error{
                print("No se pudo hacer el Login")
                mostrarErrorAlert = true
            } else{
                print("Se inicio secion exitosamente \(authResult?.user)")
                irAHomePage = true
                UserDefaults.standard.set(emali, forKey: "LLAVE_CORREO")
            }
        }
    }
}
