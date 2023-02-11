//
//  LikesView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 9/02/23.
//

import SwiftUI

struct LikesView: View {
    var likesViewModel: LikesViewModel = LikesViewModel()
    @State private var maravillasFavoritas: [GetMaravillasResponse] = []
    
    var body: some View {
        ZStack{
            Image("FondoLikes")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                ForEach(maravillasFavoritas, id: \.id){ (maravillaFavoritas:GetMaravillasResponse) in
                    celdaDeVerMaravillas(maravillas: maravillaFavoritas) {
                        
                    } clickEnTacho: {
                        Task{
                            await likesViewModel.eliminarMaravillaDeBaseDeDatos(maravillaFavoritas.id)
                            let obtenerMaravillasRestantes = await likesViewModel.obtenerTodaslasMaravillasDeBaseDeDatos()
                            maravillasFavoritas = obtenerMaravillasRestantes
                        }
                    } clickEnCorazonDescativado: {
                        
                    } clickEnCorazonActivado: {
                        
                    }
                }
                .padding()
            }
        }
        .onAppear {
            Task{
                let maravillaGuardadasEnBaseDeDatos = await likesViewModel.obtenerTodaslasMaravillasDeBaseDeDatos()
                maravillasFavoritas = maravillaGuardadasEnBaseDeDatos
                UserDefaults.standard.set(maravillasFavoritas.count, forKey: "CantidadFavoritos")
            }
        }
    }
}

struct LikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView()
    }
}
