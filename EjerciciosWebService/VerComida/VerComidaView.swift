//
//  VerComidaView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 2/02/23.
//

import SwiftUI
import Kingfisher

struct VerComidaView: View {
    var verComidasViewModel:VerComidaViewModel = VerComidaViewModel()
    @State private var comidas: [GetComidasResponse] = []
    @State private var mostrarSiguientePantalla = false
    @EnvironmentObject var sharedComidaViewModel: SharedViewModel
    
    var body: some View {
        ZStack{
            VStack{
                Image("VerComida")
                    .resizable()
                    .border(Color("Boton"),width: 6.0)
                    .scaledToFit()
                Spacer()
                
                if(comidas.count > 0){
                    ScrollView(.vertical){
                        VStack(spacing: 20){
                            ForEach(comidas, id: \.id) { (getComidasResponse:GetComidasResponse) in
                                celdaDeVerComida(comida: getComidasResponse, clickEnTexto: {
                                    sharedComidaViewModel.guardarGetComidasResponse(getComidasResponse: getComidasResponse)
                                    mostrarSiguientePantalla = true
                                }, clickEnTacho: {
                                    Task{
                                        do{
                                            let _ = try await verComidasViewModel.eliminarMusica(deletComidasRequest: DeleteComidasRequest.init(id: getComidasResponse.id))
                                            let comidasDelServidor = try await verComidasViewModel.obtenerTodasLasComidas()
                                            comidas = comidasDelServidor
                                        } catch let error{
                                            print("Error")
                                        }
                                    }
                                })
                            }
                        }
                    }
                }
                else{
                    Spacer()
                    Text("No se encontro Menu De Comidas")
                    Spacer()
                }
            }
            .task {
                do{
                    let comidas = try await verComidasViewModel.obtenerTodasLasComidas()
                    self.comidas = comidas
                } catch{
                    fatalError("No se encontraron resultados")
                }
            }
            .padding()
            .background(Color("FondoPrincipal"))
            .navigationTitle("Lista")
            NavigationLink(destination: ComidaImgeView(),
                           isActive: $mostrarSiguientePantalla) {
                EmptyView()
            }
        }
    }
    
    private func celdaDeVerComida(comida: GetComidasResponse, clickEnTexto: @escaping () ->Void, clickEnTacho: @escaping () ->Void) -> some View{
        return HStack{
            KFImage(URL(string: comida.url))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100,height: 100, alignment: .center)
                .border(Color.red,width: 3.0)
                .clipped()
            Text("ID:\(comida.id) \nNombre:\(comida.nombre) \nPrecio:\(comida.precio)")
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
    }
}

struct VerComidaView_Previews: PreviewProvider {
    static var previews: some View {
        VerComidaView()
    }
}
