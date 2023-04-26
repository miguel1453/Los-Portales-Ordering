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
        VStack {
            Text(cake.customerName)
            Text(cake.cakeSize)
            Text(cake.cakePickupDate)
        }
        .frame(width: 350)
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
    }
}

struct CakeCellView_Previews: PreviewProvider {
    static var previews: some View {
        CakeCellView(cake: Cake.preview)
    }
}
