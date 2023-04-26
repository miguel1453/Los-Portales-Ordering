//
//  Cake.swift
//  Cakey
//
//  Created by Miguel Villasenor on 11/8/22.
//

import FirebaseFirestoreSwift

struct Cake: Identifiable, Decodable {
    
    @DocumentID var id: String?
    let customerName: String
    let customerNumber: String
    let cakePickupDate: String
    let cakeColor: String
    let cakeSize: String
    let cakeMessage: String
    let cakeImage: String
    let cakeComments: String
}

extension Cake {
    static let preview = Cake(customerName: "Miguel", customerNumber: "9107422001", cakePickupDate: "Apr 22 2023, 11:57 PM", cakeColor: "UIExtendedSRGBColorSpace 0 0 1 1", cakeSize: "Grande", cakeMessage: "Happy Birthday Mami", cakeImage: "Flowers", cakeComments: "No chantilly")
}
