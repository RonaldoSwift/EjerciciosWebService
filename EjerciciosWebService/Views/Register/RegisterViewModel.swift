//
//  RegisterViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 23/02/23.
//

import Foundation
import FirebaseAuth

class RegisterViewModel:ObservableObject{
    
    @Published var irAnfoTapsView : Bool = false
    @Published var mostrarErrorAlert:Bool = false
    
    func registrarUsuario(correo:String, pasword:String){
        Auth.auth().createUser(withEmail: correo, password: pasword){ [self]authResult, error in
            if let errornoNull = error {
                print("No se registro usuario")
                mostrarErrorAlert = true
            } else {
                print("Se Registro usuario correctamente")
                irAnfoTapsView = true
                UserDefaults.standard.set(correo, forKey: "LLAVE_CORREO")
            }
        }
    }
}
