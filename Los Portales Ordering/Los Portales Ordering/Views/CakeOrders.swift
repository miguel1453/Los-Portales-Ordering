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
            ScrollView {
                if !vm.todayCakes.isEmpty {
                    Section(header: Text("Hoy").font(.title.bold())) {
                        ForEach(vm.todayCakes) { cake in
                            NavigationLink {
                                CakeInfoView(cake: cake)
                            } label: {
                                CakeCellView(cake: cake)
                            }
                            
                        }
                    }
                }
                
                if !vm.tomorrowCakes.isEmpty {
                    Section(header: Text("Mañana").font(.title.bold())) {
                        ForEach(vm.tomorrowCakes) { cake in
                            NavigationLink {
                                CakeInfoView(cake: cake)
                            } label: {
                                CakeCellView(cake: cake)
                            }
                        }
                    }
                }
                
                if !vm.dayAfterTomorrow.isEmpty {
                    Section(header: Text("Pasado Mañana").font(.title.bold())) {
                        ForEach(vm.dayAfterTomorrow) { cake in
                            NavigationLink {
                                CakeInfoView(cake: cake)
                            } label: {
                                CakeCellView(cake: cake)
                            }
                        }
                    }
                }
                    
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
        
        
        .sheet(isPresented: $showsheet) {
            NewOrderView(showsheet: $showsheet)
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CakeOrdersView()
            .environmentObject(CakesViewModel())
    }
}
