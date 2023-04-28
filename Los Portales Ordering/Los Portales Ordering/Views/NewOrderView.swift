//
//  NewOrderView.swift
//  Cakey
//
//  Created by Miguel Villasenor on 11/7/22.
//

import SwiftUI

struct NewOrderView: View {
    @EnvironmentObject var vm: CakesViewModel
    
    @Binding var showsheet: Bool
    @State private var showingAlert = false
    
    @State private var customerName = ""
    @State private var customerNumber = ""
    @State private var cakePickupDate = Date()
    @State private var cakePickupTime = ""
    @State private var cakeColor = Color(.blue)
    @State private var cakeSize = ""
    @State private var cakeMessage = ""
    @State private var cakeImage = ""
    @State private var cakeComments = ""
    
    var allFieldsFilled: Bool {
        !customerName.isEmpty && !customerNumber.isEmpty && cakePickupDate != Date() && !cakeSize.isEmpty && !cakeMessage.isEmpty && !cakeImage.isEmpty
    }
  
    
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
            Text("New Order")
                .font(.title2)
                .fontWeight(.bold)
            List {
                TextField("Nombre y Appellido", text: $customerName)
                TextField("Numero de celular", text: $customerNumber)
                Section {
                    DatePicker("Date & Time", selection: $cakePickupDate, in: Date()..., displayedComponents: .date)                        .datePickerStyle(.graphical)
                    Picker("Hora", selection: $cakePickupTime) {
                        ForEach(Cake.times, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.wheel)
                        
                        
                }
                Section {
                
                }
                Section {
                    ColorPicker("Color", selection: $cakeColor,supportsOpacity: false)
                    Picker("Tamaño", selection: $cakeSize) {
                        ForEach(Cake.sizes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)

                    TextField("Dedicatoria", text: $cakeMessage)
                    TextField("Dibujo", text: $cakeImage)
                }
                Section {
                    TextField("Commentarios", text: $cakeComments)
                }
                HStack {
                    Spacer()
                    Button {
                        if allFieldsFilled {
                            showsheet.toggle()
                            vm.uploadCake(customerName: customerName, customerNumber: customerNumber, cakePickupDate: cakePickupDate, cakePickupTime: cakePickupTime, cakeColor: cakeColor, cakeSize: cakeSize, cakeMessage: cakeMessage, cakeImage: cakeImage, cakeComments: cakeComments)
                            vm.fetchCakes()
                        } else {
                            showingAlert.toggle()
                        }
                        
                    } label: {
                        Text("Submit")
                            .font(.headline)
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Finish Completing Form"), message: Text("Por favor completa la forma"), dismissButton: .default(Text("OK")))
                    }
                    Spacer()
                }
            }
            
        }
    }
}

struct NewOrderView_Previews: PreviewProvider {
    @State static var value = false
    static var previews: some View {
        
        NewOrderView(showsheet: $value)
            .environmentObject(CakesViewModel())
    }
}
