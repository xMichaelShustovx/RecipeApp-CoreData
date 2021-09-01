//
//  SearchBarView.swift
//  RecipeApp
//
//  Created by Michael Shustov on 01.09.2021.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var filterBy: String
    
    var body: some View {

        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(radius: 4)
            
            HStack {
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Filter by...", text: $filterBy)
                
                Button {
                    filterBy = ""
                }
                label: {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.gray)
                }

            }
            .padding(.horizontal, 10)
        }
        .frame(height: 38)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(filterBy: Binding.constant(""))
    }
}
