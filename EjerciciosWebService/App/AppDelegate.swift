//
//  AppDelegate.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 22/02/23.
//

import FirebaseCore
import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
