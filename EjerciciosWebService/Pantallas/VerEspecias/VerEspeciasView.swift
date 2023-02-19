//
//  VerEspeciasView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 15/02/23.
//

import SwiftUI

struct VerEspeciasView: View {
    
    @State private var coffe : String = ""
    var verEspeciasViewModel: VerEspeciasViewModel = VerEspeciasViewModel()
    @State private var especias: [GetEspeciasResponse] = []
    @State private var mostrarSiguientePantalla = false
    @EnvironmentObject var sharedViewModel: SharedViewModel
    
    var body: some View {
        ZStack{
            Image("VerFondo")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Image("simboloCaffe")
                        .resizable()
                        .frame(width: 51.61,height: 51.61)
                        .scaledToFit()
                    VStack{
                        Text("COFFEE")
                        Text("TASTE!")
                    }
                    .multilineTextAlignment(.leading)
                    .font(.custom("Gilroy-Regular", size: 13))
                }
                
                HStack{
                    Image("perfil")
                        .resizable()
                        .frame(width: 42,height: 42)
                    Spacer()
                    Image("Guiones")
                        .resizable()
                        .frame(width:25,height: 12)
                        .scaledToFit()
                }
                .padding()
                
                HStack{
                    Text("Hi, ")
                        .font(.custom("Gilroy-Light", size: 17))
                    Text("Carlos")
                        .font(.custom("Gilroy-ExtraBold", size: 30))
                        .bold()
                    Spacer()
                }
                .padding()
                
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color("SombraColor"))
                    TextField("Comino,pimienta,canela...", text: $coffe)
                    Spacer()
                    Image("slas")
                        .resizable()
                        .frame(width: 19,height: 12)
                }
                .padding()
                .frame(maxWidth:350)
                .background(
                    Capsule()
                        .strokeBorder(Color("SombraColor"),lineWidth: 0.8)
                        .clipped()
                )
                .clipShape(Capsule())
                
                ScrollView(.horizontal){
                    HStack{
                        Pildora(nombre: "Cofeetttttttt")
                        Pildora(nombre: "Beer")
                        Pildora(nombre: "WineBar")
                        Pildora(nombre: "Calzado")
                    }
                }
                
                ScrollView{
                    ScrollView(.horizontal){
                        if(especias.count > 0){
                            HStack{
                                ForEach(Array(zip(especias.indices,especias)), id: \.0){
                                    (position:Int,getEspeciasResponse:GetEspeciasResponse) in
                                    CeldaEspecias(especia: getEspeciasResponse, clickEnCelda: {
                                        especias[position].corazonActivado = !especias[position].corazonActivado
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
                            let especiasDelServidor = try await verEspeciasViewModel.obtenerTodasLasEspecias()
                            self.especias = especiasDelServidor
                        }
                        catch{
                            fatalError("No se encontraron resultados")
                        }
                    }
                    .padding()
                    .background(Color("ColorPrincipal"))
                    .navigationTitle("Lista")
                    NavigationLink(destination: EspeciasDescripcionView(),
                                   isActive: $mostrarSiguientePantalla) {
                        EmptyView()
                    }
                    
                    
                    HStack{
                        Text("Frozen Beverages")
                            .foregroundColor(Color("ColorOjo"))
                        Spacer()
                        Text("See All")
                            .foregroundColor(Color("ColorPaswordOlvidado"))
                            .font(.custom("Gilroy-Light", size: 17))
                            .underline(true, color: Color("ColorPaswordOlvidado"))
                    }
                    .padding()
                    
                    ScrollView(.horizontal){
                        if(especias.count > 0){
                            HStack{
                                ForEach(Array(zip(especias.indices,especias)), id: \.0){
                                    (position:Int,getEspeciasResponse:GetEspeciasResponse) in
                                    CeldaEspeciasLargo(especia: getEspeciasResponse, clickEnCelda: {
                                        especias[position].corazonActivado = !especias[position].corazonActivado
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
                            let especiasDelServidor = try await verEspeciasViewModel.obtenerTodasLasEspecias()
                            self.especias = especiasDelServidor
                        }
                        catch{
                            fatalError("No se encontraron resultados")
                        }
                    }
                    .padding()
                    .background(Color("ColorPrincipal"))
                    .navigationTitle("Lista")
                    NavigationLink(destination: EspeciasDescripcionView(),
                                   isActive: $mostrarSiguientePantalla) {
                        EmptyView()
                    }
                }
            }
        }
    }
    
    private func Pildora(nombre:String) -> some View{
        return HStack{
            Text(nombre)
        }
        .padding()
        .background(
            Capsule()
                .strokeBorder(Color("SombraColor"),lineWidth: 0.8)
                .clipped()
        )
        .clipShape(Capsule())
    }
}

struct VerEspeciasView_Previews: PreviewProvider {
    static var previews: some View {
        VerEspeciasView()
    }
}
