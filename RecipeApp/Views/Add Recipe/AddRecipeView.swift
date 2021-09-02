//
//  AddRecipeView.swift
//  RecipeApp
//
//  Created by Michael Shustov on 02.09.2021.
//

import SwiftUI

struct AddRecipeView: View {
    
    // Properties for recipe meta data
    @State private var name = ""
    @State private var summary = ""
    @State private var prepTime = ""
    @State private var cookTime = ""
    @State private var totalTime = ""
    @State private var servings = ""
    
    // List type recipe meta data
    @State private var highlights = [String]()
    @State private var directions = [String]()
    
    // Ingredient data
    @State private var ingredients = [IngredientJSON]()
    
    var body: some View {
    
        VStack {
            
            HStack {
                
                Button(action: {
                    clear()
                }, label: {
                    Text("Clear")
                })
                
                Spacer()
                
                Button(action: {
                    
                    // Add recipe to core data
                    addRecipe()
                    
                    // Clear the form after adding recipe
                    clear()
                    
                }, label: {
                    Text("Add")
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
                    
                    AddIngredientData(ingredients: $ingredients)
                    
                }
            }
        }
        .padding(.horizontal)
    }
    
    func clear() {
        
        name = ""
        summary = ""
        prepTime = ""
        cookTime = ""
        totalTime = ""
        servings = ""
        
        highlights = [String]()
        directions = [String]()
        
        ingredients = [IngredientJSON]()
        
    }
    
    func addRecipe() {
        
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
