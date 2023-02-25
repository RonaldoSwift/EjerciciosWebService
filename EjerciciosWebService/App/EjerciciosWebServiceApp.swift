//
//  EjerciciosWebServiceApp.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 31/01/23.
//

import SwiftUI
@main
struct EjerciciosWebServiceApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @ObservedObject var appState = AppSharedViewModel()
    var body: some Scene {
        WindowGroup {
            MenuPrincipalView()
                .id(appState.rooViewID)
                .environmentObject(appState)
        }
    }
}
