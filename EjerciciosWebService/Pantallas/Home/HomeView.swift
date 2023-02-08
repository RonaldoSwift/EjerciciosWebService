//
//  VerCasaView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 7/02/23.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    var verCasaViewModel: HomeViewModel = HomeViewModel()
    @State private var casas: [GetCasasResponse] = []
    @State private var mostrarSiguientePantalla = false
    @EnvironmentObject var sharedViewModel: SharedViewModel
    
    var body: some View {
        ZStack{
            VStack{
                Image("ListaCasa")
                    .resizable()
                    .scaledToFit()
                if(casas.count > 0){
                    ScrollView {
                        ForEach(Array(zip(casas.indices, casas)), id: \.0){ (position:Int, getCasasResponse:GetCasasResponse) in
                            celdaDeVerCasas(
                                casa: getCasasResponse,
                                clickEnTexto: {
                                    sharedViewModel.guardarGetCasasResponse(getCasasReponse: getCasasResponse)
                                    mostrarSiguientePantalla = true
                                },
                                clickEnTacho: {
                                    Task{
                                        do{
                                            let _ = try await self.verCasaViewModel.eliminarCasaDeWebService(deletCasasRequest: DeleteCasasRequest.init(id: getCasasResponse.id))
                                            let casasDelServidor = try await verCasaViewModel.obtenerTodasLasCasasDeWebService()
                                            casas = casasDelServidor
                                        } catch let error{
                                            print("Error")
                                        }
                                    }
                                }, clickEnCorazonDescativado: {
                                    casas[position].corazonActivado = true
                                    //Guardamos el favorito en base de datos
                                    Task{
                                        await verCasaViewModel.crearCasaEnBaseDeDatos(getCasasResponse: getCasasResponse)
                                    }
                                }, clickEnCorazonActivado: {
                                    casas[position].corazonActivado = false
                                })
                        }
                    }
                }
                else{
                    Spacer()
                    Text("No se encontro Lista de Casas")
                    Spacer()
                }
            }
            .task {
                do{
                    let casas = try await verCasaViewModel.obtenerTodasLasCasasDeWebService()
                    self.casas = casas
                } catch{
                    fatalError("No se encontraron resultados")
                }
            }
            .padding()
            .background(Color("ColorPrincipal"))
            .navigationTitle("Lista")
            
            NavigationLink(destination: DescripcionCasaView(),
                           isActive: $mostrarSiguientePantalla) {
                EmptyView()
            }
        }
    }
    
    
}

struct VerCasaView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
