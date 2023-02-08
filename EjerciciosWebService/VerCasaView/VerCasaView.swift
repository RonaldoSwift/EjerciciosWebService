//
//  VerCasaView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 7/02/23.
//

import SwiftUI
import Kingfisher

struct VerCasaView: View {
    var verCasaViewModel: VerCasaViewModel = VerCasaViewModel()
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
                        ForEach(casas, id: \.id) { (getCasasResponse:GetCasasResponse) in
                            celdaDeVerCasas(
                                casas: getCasasResponse,
                                clickEnTexto: {
                                    sharedViewModel.guardarGetCasasResponse(getCasasReponse: getCasasResponse)
                                    mostrarSiguientePantalla = true
                                },
                                clickEnTacho: {
                                    Task{
                                        do{
                                            let _ = try await self.verCasaViewModel.eliminarCasa(deletCasasRequest: DeleteCasasRequest.init(id: getCasasResponse.id))
                                            let casasDelServidor = try await verCasaViewModel.obtenerTodasLasCasas()
                                            casas = casasDelServidor
                                        } catch let error{
                                            print("Error")
                                        }
                                    }
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
                    let casas = try await verCasaViewModel.obtenerTodasLasCasas()
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
    
    private func celdaDeVerCasas(casas:GetCasasResponse,
                                 clickEnTexto: @escaping ()-> Void,
                                 clickEnTacho: @escaping () -> Void
    )-> some View{
        ZStack{
            HStack{
                KFImage(URL(string: casas.url))
                    .resizable()
                    .frame(width: 150,height: 150)
                    .border(Color.red,width: 3.0)
                    .scaledToFit()
                
                Text("ID:\(casas.id) \nDistrito:\(casas.distrito)  \nDireccrion:\(casas.direccion)  \nPrecio:\(casas.precio)  \nArea:\(casas.area)")
                    .onTapGesture {
                        clickEnTexto()
                    }
                Button {
                    clickEnTacho()
                } label: {
                    Image("Tachito")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30,height: 30)
                }
            }
            
            VStack{
                HStack{
                    Spacer()
                    Image(systemName: "heart.fill")
                        .foregroundColor(Color.red)
                }
                Spacer()
            }
        }
    }
}

struct VerCasaView_Previews: PreviewProvider {
    static var previews: some View {
        VerCasaView()
    }
}
