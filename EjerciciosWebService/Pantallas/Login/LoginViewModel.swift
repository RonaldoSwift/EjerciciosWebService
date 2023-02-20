//
//  LoginViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 15/02/23.
//

import Foundation
import FirebaseAuth


class LoginViewModel:ObservableObject{
    
    @Published var irAInfoView:Bool = false
    @Published var mostrarErrorAlert:Bool = false
    
    // Iniciar Secion
    func login(emali:String, pasword:String){
        Auth.auth().signIn(withEmail: emali, password: pasword) { [self]authResult,error in
            
            if let errorNoNulo = error{
                print("No se pudo hacer el Login")
                mostrarErrorAlert = true
            } else{
                print("Se inicio secion exitosamente \(authResult?.user)")
                  irAInfoView = true
                UserDefaults.standard.set(emali, forKey: "LLAVE_CORREO")
            }
        }
    }
}
