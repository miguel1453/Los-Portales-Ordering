//
//  CakeService.swift
//  Los Portales Ordering
//
//  Created by Miguel Villasenor on 4/25/23.
//

import Foundation
import Firebase

struct CakeService {
    
    func postCake(customerName: String, customerNumber: String, cakePickupDate: String, cakePikckupTime: String, cakeColor: String, cakeSize: String, cakeMessage: String, cakeImage: String, cakeComments: String, completion: @escaping(Bool) -> Void) {
    
        let data = ["customerName": customerName,
                    "customerNumber": customerNumber,
                    "cakePickupDate": cakePickupDate,
                    "cakePickupTime": cakePikckupTime,
                    "cakeColor": cakeColor,
                    "cakeSize": cakeSize,
                    "cakeMessage": cakeMessage,
                    "cakeImage": cakeImage,
                    "cakeComments": cakeComments]
        
        Firestore.firestore().collection("cakeOrders").document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: FAILED to upload Cake Order with error \(error.localizedDescription)")
                    completion(false)
                } else {
                    print("DEBUG: Successfully uploaded cake!")
                    completion(true)
                }
            }
        
        Firestore.firestore().collection("cakOrder \(cakePickupDate)").document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: FAILED to upload Cake Order with error \(error.localizedDescription)")
                    completion(false)
                } else {
                    print("DEBUG: Successfully uploaded cake!")
                    completion(true)
                }
            }
        return
    }
    
    func fetchCakes(completion: @escaping([Cake]) -> Void) {
        Firestore.firestore().collection("cakeOrders")
            .order(by: "cakePickupDate")
            .getDocuments { snapshot , _ in
                guard let documents = snapshot?.documents else {
                    print("DEBUG: ERROR FETCHING CAKING CakeService -> fetchCakes")
                    return
                }
                let cakes = documents.compactMap({ try! $0.data(as: Cake.self)})

                completion(cakes)
            }
    }
    

}
