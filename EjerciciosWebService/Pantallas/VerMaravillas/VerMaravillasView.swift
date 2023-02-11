//
//  VerMaravillasView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 9/02/23.
//

import SwiftUI
import Kingfisher

struct VerMaravillasView: View {
    
    var verMaravillasViewModel: VerMaravillasViewModel = VerMaravillasViewModel()
    @State private var maravillas:[GetMaravillasResponse] = []
    @State private var mostrarSiguientePantalla = false
    @EnvironmentObject var sharedViewModel:SharedViewModel
    
    var body: some View {
        ZStack{
            Image("FondoVerPantalla")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                if(maravillas.count > 0){
                    ScrollView {
                        ForEach(Array(zip(maravillas.indices, maravillas)), id: \.0){ (position:Int, getMaravillasResponse:GetMaravillasResponse) in
                            celdaDeVerMaravillas(
                                maravillas: getMaravillasResponse,
                                clickEnTexto: {
                                    sharedViewModel.guardarGetMaravillasResponse(getMaravillasResponse: getMaravillasResponse)
                                    mostrarSiguientePantalla = true
                                },
                                clickEnTacho: {
                                    Task{
                                        do{
                                            let _ = try await self.verMaravillasViewModel.eliminarMaravillaDeWebService(deletMaravillasRequest: DeleteMaravillasRequest.init(id: getMaravillasResponse.id))
                                            let maravillasDelServidor = try await verMaravillasViewModel.obtenerTodasLasMaravillas()
                                            maravillas = maravillasDelServidor
                                        } catch let error{
                                            print("Error")
                                        }
                                    }
                                }, clickEnCorazonDescativado: {
                                    maravillas[position].corazonActivado = true
                                    //Guardamos el favorito en base de datos
                                    Task{
                                        await verMaravillasViewModel.crearMaravillaEnBaseDeDatos(getMaravillasResponse: getMaravillasResponse )
                                    }
                                }, clickEnCorazonActivado: {
                                    maravillas[position].corazonActivado = false
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
                    let maravillasDelServidor = try await verMaravillasViewModel.obtenerTodasLasMaravillas()
                    self.maravillas = maravillasDelServidor
                } catch{
                    fatalError("No se encontraron resultados")
                }
            }
            .padding()
            .background(Color("ColorPrincipal"))
            .navigationTitle("Lista")
            
            NavigationLink(destination: MaravillasDescripcionView(),
                           isActive: $mostrarSiguientePantalla) {
                EmptyView()
            }
        }
    }
}
   

struct VerMaravillasView_Previews: PreviewProvider {
    static var previews: some View {
        VerMaravillasView()
    }
}
