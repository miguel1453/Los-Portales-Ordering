//
//  Los_Portales_OrderingApp.swift
//  Los Portales Ordering
//
//  Created by Miguel Villasenor on 4/25/23.
//

import SwiftUI
import Firebase

@main
struct Los_Portales_OrderingApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            CakeOrdersView()
                .environmentObject(CakesViewModel())
        }
    }
}
