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
    let cakePickupTime: String
    let cakeColor: String
    let cakeSize: String
    let cakeMessage: String
    let cakeImage: String
    let cakeComments: String
}

extension Cake {
    static let preview = Cake(customerName: "Miguel", customerNumber: "9107422001", cakePickupDate: "Apr 22 2023", cakePickupTime: "7:00PM", cakeColor: "UIExtendedSRGBColorSpace 0 0 1 1", cakeSize: "Grande", cakeMessage: "Happy Birthday Mami", cakeImage: "Flowers", cakeComments: "No chantilly")
    
    static let sizes = ["Pequeño", "Mediano", "Grande"]
    
    static let times = ["9:00 AM", "9:30 AM", "10:00 AM", "10:30 AM", "11:00 AM", "11:30 AM", "12:00 PM", "12:30 PM", "1:00 PM", "1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM"]

}
