//
//  AddListData.swift
//  RecipeApp
//
//  Created by Michael Shustov on 02.09.2021.
//

import SwiftUI

struct AddListData: View {
    
    @Binding var list: [String]
    
    @State private var item: String = ""
    
    var title: String
    var placeholderText: String
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            HStack {
                
                Text("\(title):")
                    .bold()
                
                TextField(placeholderText, text: $item)
                
                Button("Add") {
                    if item.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                        list.append(item.trimmingCharacters(in: .whitespacesAndNewlines))
                        
                        item = ""
                    }
                }
            }
            
            ForEach(list, id: \.self) { item in
             
                Text(item)
                
            }
        }
    }
}
