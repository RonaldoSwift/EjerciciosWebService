//
//  LogInViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 23/02/23.
//

import FirebaseAuth
import Foundation

class LogInViewModel: ObservableObject {
    @Published var irAHomePage: Bool = false
    @Published var mostrarErrorAlert: Bool = false

    func login(emali: String, password: String) {
        print(password)
        Auth.auth().signIn(withEmail: emali, password: password) { [self] authResult, error in

            if let errorNoNulo = error {
                print("No se pudo hacer el Login")
                mostrarErrorAlert = true
            } else {
                print("Se inicio secion exitosamente \(authResult?.user)")
                irAHomePage = true
                UserDefaults.standard.set(emali, forKey: "LLAVE_CORREO")
            }
        }
    }
}
