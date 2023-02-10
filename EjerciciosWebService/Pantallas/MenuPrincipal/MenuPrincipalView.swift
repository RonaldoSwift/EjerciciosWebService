//
//  MenuPrincipalView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 9/02/23.
//

import SwiftUI

struct MenuPrincipalView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Image("FondoPantalla")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("MENU PRINCIPAL")
                        .font(.largeTitle)
                        .bold()
                    Image("")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    
                    NavigationLink {
                        AgregarMaravillaView()
                    } label: {
                        Text("AGREGAR")
                            .padding()
                            .frame(width: 350,height: 50)
                            .border(Color.black, width: 5.0)
                            .foregroundColor(Color.white)
                            .background(Color("ColorButoon"))
                            .cornerRadius(10)
                    }
                    
                    
                    NavigationLink {
                        MenuTabsView()
                    } label: {
                        Text("VER")
                            .padding()
                            .frame(width: 350,height: 50)
                            .border(Color.black, width: 5.0)
                            .foregroundColor(Color.white)
                            .background(Color("ColorButoon"))
                            .cornerRadius(10)
                    }
                    
                    
                    NavigationLink {
                        ActualizarMaravillaView()
                    } label: {
                        Text("ACTUALIZAR")
                            .padding()
                            .frame(width: 350,height: 50)
                            .border(Color.black, width: 5.0)
                            .foregroundColor(Color.white)
                            .background(Color("ColorButoon"))
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct MenuPrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        MenuPrincipalView()
    }
}
