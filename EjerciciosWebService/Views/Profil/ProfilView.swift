//
//  ProfilView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 23/02/23.
//

import FirebaseAuth
import SwiftUI

struct ProfilView: View {
    @EnvironmentObject var appSharedViewModel: AppSharedViewModel

    var body: some View {
        VStack {
            Button {
                do {
                    try Auth.auth().signOut()
                    appSharedViewModel.rooViewID = UUID()

                } catch {
                    print("No se pudo cerrar sesion")
                }
            } label: {
                Text("Cerrar sesion")
            }
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
