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

//    View Models Compartidos
    @ObservedObject var appSharedViewModel = AppSharedViewModel()
    var sharedViewModel: SharedViewModel = .init()

    var body: some Scene {
        WindowGroup {
            MenuPrincipalView()
                .id(appSharedViewModel.rooViewID)
                .environmentObject(appSharedViewModel)
                .environmentObject(sharedViewModel)
        }
    }
}
