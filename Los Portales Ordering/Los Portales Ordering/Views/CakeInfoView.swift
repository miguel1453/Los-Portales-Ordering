//
//  CakeInfoView.swift
//  Cakey
//
//  Created by Miguel Villasenor on 11/8/22.
//

import SwiftUI

struct CakeInfoView: View {
    var cake: Cake
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Cliente")) {
                        HStack {
                            Text("Nombre")
                            Spacer()
                            Text(cake.customerName)
                        }
                        HStack {
                            Text("Numero")
                            Spacer()
                            Text(cake.customerNumber)
                        }
                        
                    }
                    Section(header: Text("Tiempo de Recogida")) {
                        HStack {
                            Text("Dia")
                            Spacer()
                            Text(cake.cakePickupDate)
                        }
                        HStack {
                            Text("Hora")
                            Spacer()
                            Text(cake.cakePickupTime)
                        }
                        
                    }
                    Section(header: Text("Pastel")) {
                        HStack {
                            Text("Tamaño")
                            Spacer()
                            Text(cake.cakeSize)
                        }
                        HStack {
                            Text("Color")
                            Spacer()
                            Text(cake.cakeColor)
                        }
                        HStack {
                            Text("Dedicatoria")
                            Spacer()
                            Text(cake.cakeMessage)
                        }
                        HStack{
                            Text("Dibujo")
                            Spacer()
                            Text(cake.cakeImage)
                        }
                    }
                    Section(header: Text("Commentarios")) {
                        Text(cake.cakeComments)
                    }
                }
                .navigationTitle(cake.customerName)
                
                //            List {
                //                HStack {
                //                    Text(cake.cakePickupDate, style: .date)
                //                    Text(cake.date, style: .time)
                //                }
                //                HStack {
                //                    Text("Color: ")
                //                    cake.color
                //                }
                //                Text("Tamaño: \(cake.size)")
                //                Text("Dedicatoria: \"\(cake.message)\"")
                //                Text("Dibujo: \(cake.image)")
                //                Text("Commentarios: \(cake.comments)")
                //
                //
                //            }
            }
        }
        
    }
}

struct CakeInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CakeInfoView(cake: Cake.preview)
    }
}
