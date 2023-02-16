//
//  VerEspeciasView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 15/02/23.
//

import SwiftUI

struct VerEspeciasView: View {
    
    @State private var coffe : String = ""
    
    var body: some View {
        ZStack{
            Image("VerFondo")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("simboloCaffe")
                    .resizable()
                    .frame(width: 51.61,height: 51.61)
                    .scaledToFit()
                Text("Especies !")
                
                HStack{
                    Image("perfil")
                        .frame(width: 42,height: 42)
                    Spacer()
                    Image(systemName: "text.alignright")
                        .frame(width: 42,height: 42)
                }
                
                HStack{
                    Text("Hola, ")
                        .font(.custom("Gilroy-Light", size: 17))
                    Text("Carlos")
                        .font(.custom("Gilroy-ExtraBold", size: 30))
                        .bold()
                    Spacer()
                }
                
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
                        Text("ESPECIAS")
                    }
                    .padding()
                    .frame(maxWidth:100)
                    .background(
                        Capsule()
                            .strokeBorder(Color("SombraColor"),lineWidth: 0.8)
                            .clipped()
                    )
                    .clipShape(Capsule())
                }
                
                ScrollView(.horizontal){
                    HStack{
                        
                    }
                }
                
            }
            .padding()
        }
    }
}

struct VerEspeciasView_Previews: PreviewProvider {
    static var previews: some View {
        VerEspeciasView()
    }
}
