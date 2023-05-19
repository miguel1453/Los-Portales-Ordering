//
//  CakeViewModel.swift
//  Cakey
//
//  Created by Miguel Villasenor on 11/8/22.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase
import SwiftUI

@MainActor
class CakesViewModel: ObservableObject {
    @Published var groupedCakes = [String: [Cake]]()
    @Published var allCakes = [Cake]()
    @Published var tomorrowCakes = [Cake]()
    @Published var todayCakes = [Cake]()
    @Published var dayAfterTomorrow = [Cake]()
    @Published var searchText = ""
    
    var searchableCakes: [Cake] {
        if searchText.isEmpty {
            return allCakes
        } else {
            let lowercasedQuery = searchText.lowercased()
            
            return allCakes.filter({
                $0.customerName.lowercased().contains(lowercasedQuery) ||
                $0.customerNumber.contains(lowercasedQuery) ||
                $0.cakeMessage.lowercased().contains(lowercasedQuery) ||
                $0.cakeImage.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
//    private let service = CakeService()
    
    init() {
        Task {
            try await self.fetchCakes()
        }
    }
    
    func uploadCake(customerName: String, customerNumber: String, cakePickupDate: Date, cakePickupTime: String, cakeColor: String, cakeSize: String, cakeMessage: String, cakeImage: String, cakeComments: String) async throws {
        ///Date to string
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        let dateString = formatter.string(from: cakePickupDate)
        
        do {
            let cake = Cake(customerName: customerName, customerNumber: customerNumber, cakePickupDate: dateString, cakePickupTime: cakePickupTime, cakeColor: cakeColor, cakeSize: cakeSize, cakeMessage: cakeMessage, cakeImage: cakeImage, cakeComments: cakeComments)
            let encodedCake = try Firestore.Encoder().encode(cake)
            try await Firestore.firestore().collection("cakeOrders").document().setData(encodedCake)
            
        } catch { print("DEBUG: error uploading cake") }
    }
    
    func fetchCakes() async throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd yyyy"

        /// Get today's date
        let today = Date()
        let todayString = dateFormatter.string(from: today)

        /// Get tomorrow's date
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today)!
        let tomorrowString = dateFormatter.string(from: tomorrow)

        /// Get the day after tomorrow's date
        let dayAfterTomorrow = Calendar.current.date(byAdding: .day, value: 2, to: today)!
        let dayAfterTomorrowString = dateFormatter.string(from: dayAfterTomorrow)
        
        do {
            print("DEBUG: fetchCAkes called")
            let snapshot = try? await Firestore.firestore().collection("cakeOrders").order(by: "cakePickupDate").getDocuments()
            self.allCakes = snapshot!.documents.compactMap({ try? $0.data(as: Cake.self)})
            self.allCakes.sort(by: { $0.cakePickupTime < $1.cakePickupTime })
            self.groupedCakes = Dictionary(grouping: self.allCakes, by: { cake in
                cake.cakePickupDate
            })
            self.tomorrowCakes = groupedCakes[tomorrowString, default: []]
            self.todayCakes = groupedCakes[todayString, default: []]
            self.dayAfterTomorrow = groupedCakes[dayAfterTomorrowString, default: []]
        }
    }
        
    
}
    


