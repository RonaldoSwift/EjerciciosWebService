//
//  ContinueView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 21/02/23.
//

import SwiftUI

struct ContinueView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ZStack {
            Image("FondoMenu")
                .resizable()
                .frame(width: 392, height: 490)
                .padding(.bottom, 175)
            ZStack {
                // DEGRADADO PARA EL FONDO
                DegradadoParaWlFondo()
                // VISTA
                VStack {
                    Spacer()
                    Text("Choose Mode")
                    HStack {
                        VStack {
                            Image("Dark")
                                .resizable()
                                .frame(width: 73, height: 78.5)
                            Text("Dark Mode")
                                .foregroundColor(Color.white)
                        }
                        .padding(.trailing, 50)
                        VStack {
                            Image("Light")
                                .resizable()
                                .frame(width: 73, height: 73)
                            Text("Ligh Mode")
                                .foregroundColor(Color.white)
                        }
                    }
                    NavigationLink {
                        SignUpView()
                    } label: {
                        BotonVerdeSecuencial(nombre: "CONTINUE")
                    }
                    .padding(.top, 50)
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image("LogoSpotitfy")
                    .resizable()
                    .scaledToFit()
            }
        }
    }

    private func CustomBackButton() -> some View {
        let backImage = Image("BackImage")
            .resizable()
            .scaledToFit()
            .frame(width: 10, height: 10)
        return Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Circle()
                .strokeBorder(Color.gray, lineWidth: 2)
                .background(backImage)
                .frame(width: 40, height: 40)
        }
    }
}

struct ContinueView_Previews: PreviewProvider {
    static var previews: some View {
        ContinueView()
    }
}
