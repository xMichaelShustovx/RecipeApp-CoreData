//
//  AddRecipeView.swift
//  RecipeApp
//
//  Created by Michael Shustov on 02.09.2021.
//

import SwiftUI

struct AddRecipeView: View {
    
    @State private var name = ""
    @State private var summary = ""
    @State private var prepTime = ""
    @State private var cookTime = ""
    @State private var totalTime = ""
    @State private var servings = ""
    
    @State private var highlights = [String]()
    @State private var directions = [String]()
    
    var body: some View {
    
        VStack {
            
            HStack {
                
                Button(action: {
                    
                    
                    
                }, label: {
                    Text("Clear")
                })
                
                Spacer()
                
                Button(action: {
                    
                    
                    
                }, label: {
                    Text("Save")
                })
            }
            
            ScrollView (showsIndicators: false) {
                
                VStack {
                    
                    AddMetaData(name: $name,
                                summary: $summary,
                                prepTime: $prepTime,
                                cookTime: $cookTime,
                                totalTime: $totalTime,
                                servings: $servings)
                    
                    AddListData(list: $highlights, title: "Highlights", placeholderText: "Vegetarian")
                    
                    AddListData(list: $directions, title: "Directions", placeholderText: "Add some french juice")
                    
                }
            }
        }
        .padding(.horizontal)
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
