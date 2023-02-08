//
//  CasaHeartView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 7/02/23.
//

import SwiftUI

struct FavoritosView: View {
    var favoritoViewModel: FavoritosViewModel = FavoritosViewModel()
    @State private var casasFavoritas: [GetCasasResponse] = []
    
    var body: some View {
        VStack{
            ScrollView{
                ForEach(casasFavoritas, id: \.id){ (casaFavorita:GetCasasResponse) in
                    celdaDeVerCasas(casa: casaFavorita) {
                        
                    } clickEnTacho: {
                        Task{
                           await favoritoViewModel.eliminarCasaDeBaseDeDatos(casaFavorita.id)                            
                           let obtenerCasasRestantes = await favoritoViewModel.obtenerTodaslasCasasDeBaseDeDatos()
                            casasFavoritas = obtenerCasasRestantes
                        }
                    } clickEnCorazonDescativado: {
                        
                    } clickEnCorazonActivado: {
                        
                    }
                    
                }
            }
        }
        .padding()
        .background(Color("ColorPrincipal"))
        .onAppear {
            Task{
                let casasGuardadasEnBaseDeDatos = await favoritoViewModel.obtenerTodaslasCasasDeBaseDeDatos()
                casasFavoritas = casasGuardadasEnBaseDeDatos
                UserDefaults.standard.set(casasFavoritas.count, forKey: "CantidadFavoritos")
            }
        }
    }
    
}

struct CasaHeartView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritosView()
    }
}
