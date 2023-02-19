//
//  SignUpViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 15/02/23.
//

import Foundation
import FirebaseAuth

class SignUpViewModel:ObservableObject{
    
    func registrarUsuario(correo:String, pasword:String){
        Auth.auth().createUser(withEmail: correo, password: pasword){ authResult, error in
            if let errornoNull = error {
                print("No se registro usuario")
            } else {
                print("Se Registro usuario correctamente")
            }
        }
    }
}
