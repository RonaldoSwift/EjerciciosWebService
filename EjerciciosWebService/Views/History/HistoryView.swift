//
//  HistoryView.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 23/02/23.
//

import SwiftUI

struct HistoryView: View {
    @State var yourArray: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    var columns: [GridItem] =
        Array(repeating: .init(.flexible()), count: 2)
    @State var selection: Int = 1
    var body: some View {
        VStack {
            Picker(selection: $selection, label: Text("GridStyles"), content: {
                Text("Easily grows").tag(1)
                Text("manual").tag(2)
            }).pickerStyle(SegmentedPickerStyle())

            switch selection {
            case 1:
                ScrollView {
                    LazyVGrid(columns: columns) {
                        // This doesnt have to be a loop but it would make it scalable
                        ForEach(yourArray, id: \.self) { item in
                            Button(action: {
                                print(item.description)
                            }, label: {
                                Rectangle().overlay(Text(item.description).foregroundColor(.white)).foregroundColor(.blue).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)

                            })
                        }
                    }
                }
            case 2:
                VStack {
                    HStack {
                        Button(action: {
                            print(yourArray[0].description)
                        }, label: {
                            Rectangle().overlay(Text(yourArray[0].description).foregroundColor(.white)).foregroundColor(.blue).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)

                        })
                        Button(action: {
                            print(yourArray[1].description)
                        }, label: {
                            Rectangle().overlay(Text(yourArray[1].description).foregroundColor(.white)).foregroundColor(.blue).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)

                        })
                    }
                    HStack {
                        Button(action: {
                            print(yourArray[2].description)
                        }, label: {
                            Rectangle().overlay(Text(yourArray[2].description).foregroundColor(.white)).foregroundColor(.blue).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)

                        })
                        Button(action: {
                            print(yourArray[3].description)
                        }, label: {
                            Rectangle().overlay(Text(yourArray[3].description).foregroundColor(.white)).foregroundColor(.blue).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)

                        })
                    }
                    HStack {
                        Button(action: {
                            print(yourArray[4].description)
                        }, label: {
                            Rectangle().overlay(Text(yourArray[4].description).foregroundColor(.white)).foregroundColor(.blue).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)

                        })
                        Button(action: {
                            print(yourArray[5].description)
                        }, label: {
                            Rectangle().overlay(Text(yourArray[5].description).foregroundColor(.white)).foregroundColor(.blue).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)

                        })
                    }
                }

            default:
                Text("unknown selection")
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
