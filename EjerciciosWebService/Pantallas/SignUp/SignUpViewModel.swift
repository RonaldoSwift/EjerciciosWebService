//
//  SignUpViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 15/02/23.
//

import Foundation
import FirebaseAuth

class SignUpViewModel:ObservableObject{
    
    @Published var irAInfoView:Bool = false
    @Published var mostrarErrorAlert:Bool = false
    
    
    func registrarUsuario(correo:String, pasword:String){
        Auth.auth().createUser(withEmail: correo, password: pasword){ [self]authResult, error in
            if let errornoNull = error {
                print("No se registro usuario")
                mostrarErrorAlert = true
            } else {
                print("Se Registro usuario correctamente")
                irAInfoView = true
                UserDefaults.standard.set(correo, forKey: "LLAVE_CORREO")
            }
        }
    }
}
