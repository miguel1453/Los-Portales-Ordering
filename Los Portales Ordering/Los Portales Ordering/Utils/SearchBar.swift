//
//  SearchBar.swift
//  Los Portales Ordering
//
//  Created by Miguel Villasenor on 4/29/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(6)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(6)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
        }
        .padding(.horizontal, 4)
    }
}

struct SearchBar_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SearchBar(text: .constant(""))
    }
}
