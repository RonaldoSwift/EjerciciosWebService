//
//  EjerciciosWebServiceApp.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 31/01/23.
//

import SwiftUI

@main
struct EjerciciosWebServiceApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var  appDelegate
    var sharedViewModel: SharedViewModel = SharedViewModel()
    
    var body: some Scene {
        WindowGroup {
            MenuPrincipalView()
                .environmentObject(sharedViewModel)
        }
    }
}
