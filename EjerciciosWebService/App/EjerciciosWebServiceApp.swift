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
    @ObservedObject var appState = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            MenuPrincipalView()
                .id(appState.rooViewID)
                .environmentObject(sharedViewModel)
                .environmentObject(appState)
        }
    }
}
