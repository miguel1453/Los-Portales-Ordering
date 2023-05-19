//
//  CakeCellView.swift
//  Los Portales Ordering
//
//  Created by Miguel Villasenor on 4/25/23.
//

import SwiftUI

struct CakeCellView: View {
    let cake: Cake
    var body: some View {
        HStack {
            VStack {
                Text("Nombre: \(cake.customerName)")
                Text("Numero: \(cake.customerNumber)")
            }
            Spacer()
            VStack {
                Text(cake.cakePickupDate)
                Text(cake.cakePickupTime)
            }
        }
        .foregroundColor(Color("losportalesBlue"))
        .frame(width: 300)
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color("losportalesYellow").opacity(0.3)))
    }
}

struct CakeCellView_Previews: PreviewProvider {
    static var previews: some View {
        CakeCellView(cake: Cake.preview)
    }
}
