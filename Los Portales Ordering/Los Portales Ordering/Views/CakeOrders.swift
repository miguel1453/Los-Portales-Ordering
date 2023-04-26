//
//  ContentView.swift
//  Cakey
//
//  Created by Miguel Villasenor on 11/7/22.
//

import SwiftUI

struct CakeOrdersView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    @EnvironmentObject var vm: CakesViewModel
    @State var showsheet = false
    @State private var selection = 0
   
    var body: some View {
        NavigationStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
            Text("Ordenes de Pastel")
                .font(.title2)
                .fontWeight(.bold)
            Group {
               if sizeClass == .regular {
                       ScrollView {
                           LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                               ForEach(vm.cakes) { cake in
                                   NavigationLink(destination: CakeInfoView(cake: cake)) {
                                       CakeCellView(cake: cake)
                                   }
                               }
                           }
                           .padding()
                   }
               } else {
                   ScrollView {
                       ForEach(vm.cakes) { cake in
                           NavigationLink(destination: CakeInfoView(cake: cake)) {
                               CakeCellView(cake: cake)
                           }
                       }
                   }
               }
            }
            .sheet(isPresented: $showsheet) {
                NewOrderView(showsheet: $showsheet)
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        showsheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CakeOrdersView()
            .environmentObject(CakesViewModel())
    }
}
