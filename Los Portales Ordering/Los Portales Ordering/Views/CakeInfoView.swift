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
        VStack {
            Text(cake.customerName)
            Text("Numero: \(cake.customerNumber)")
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

struct CakeInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CakeInfoView(cake: Cake.preview)
    }
}
