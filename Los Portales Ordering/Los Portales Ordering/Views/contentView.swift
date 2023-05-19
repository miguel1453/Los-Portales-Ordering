//
//  TabView.swift
//  Los Portales Ordering
//
//  Created by Miguel Villasenor on 4/28/23.
//

import SwiftUI

struct contentView: View {
    @EnvironmentObject var vm: CakesViewModel
    var body: some View {
        
        TabView {
            CakeOrdersView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
        .tabViewStyle(.automatic)
    }
}


struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        contentView()
            .environmentObject(CakesViewModel())
    }
}
