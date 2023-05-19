//
//  SearchView.swift
//  Los Portales Ordering
//
//  Created by Miguel Villasenor on 4/28/23.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var vm: CakesViewModel
    var body: some View {
        NavigationStack {
            VStack {
                SearchBar(text: $vm.searchText)
                ScrollView {
                    LazyVStack {
                        ForEach(vm.searchableCakes) { cake in
                            NavigationLink {
                                CakeInfoView(cake: cake)
                            } label: {
                                CakeCellView(cake: cake)
                            }

                        }
                    }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(CakesViewModel())
    }
}
