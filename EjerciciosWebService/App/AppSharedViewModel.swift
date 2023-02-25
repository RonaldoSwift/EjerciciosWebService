//
//  AppSharedViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 23/02/23.
//

import Foundation

//Esta calse es como un ShareViewModel
final  class AppSharedViewModel:ObservableObject{
    @Published var rooViewID = UUID()
}
