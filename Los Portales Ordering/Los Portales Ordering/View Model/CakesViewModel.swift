//
//  CakeViewModel.swift
//  Cakey
//
//  Created by Miguel Villasenor on 11/8/22.
//

import Foundation
import Firebase
import SwiftUI

class CakesViewModel: ObservableObject {
    @Published var cakes = [Cake]()
    
    private let service = CakeService()
    
    init() {
        self.fetchCakes()
    }
    
    func uploadCake(customerName: String, customerNumber: String, cakePickupDate: Date, cakeColor: Color, cakeSize: String, cakeMessage: String, cakeImage: String, cakeComments: String) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy, HH:mm"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        let dateString = formatter.string(from: cakePickupDate)
        
        let colorString = cakeColor.description
        
        service.postCake(customerName: customerName, customerNumber: customerNumber, cakePickupDate: dateString, cakeColor: colorString, cakeSize: cakeSize, cakeMessage: cakeMessage, cakeImage: cakeImage, cakeComments: cakeComments) { _ in }
        }
    
    func fetchCakes() {
        print("DEBUG: fetchCAkes called")
        service.fetchCakes { cakes in
            self.cakes = cakes
        }
    }
        
    }
    
//    func sort() {
//        cakes.sort {
//            $0.date < $1.date
//        }
//    }


