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
    
    // Recipe Image
    @State private var recipeImage: UIImage?
    
    // Image Picker
    @State private var isShowingImagePicker = false
    @State private var selectedImageSource = UIImagePickerController.SourceType.photoLibrary
    @State private var placeholderImage = Image("noimage")
    
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
                    
                    // Recipe image
                    placeholderImage
                        .resizable()
                        .scaledToFit()
                    
                    HStack {
                        
                        Button("Photo lybrary") {
                            selectedImageSource = .photoLibrary
                            isShowingImagePicker = true
                        }
                        
                        Text(" | ")
                        
                        Button("Camera") {
                            selectedImageSource = .camera
                            isShowingImagePicker = true
                        }
                    }
                    .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
                        ImagePicker(selectedSource: selectedImageSource, recipeImage: $recipeImage)
                    }
                    
                    // Recipe meta data
                    AddMetaData(name: $name,
                                summary: $summary,
                                prepTime: $prepTime,
                                cookTime: $cookTime,
                                totalTime: $totalTime,
                                servings: $servings)
                    
                    // List data
                    AddListData(list: $highlights, title: "Highlights", placeholderText: "Vegetarian")
                    
                    AddListData(list: $directions, title: "Directions", placeholderText: "Add some french juice")
                    
                    // Ingredient data
                    AddIngredientData(ingredients: $ingredients)
                    
                }
            }
        }
        .padding(.horizontal)
    }
    
    func loadImage() {
        if recipeImage != nil {
            placeholderImage = Image(uiImage: recipeImage!)
        }
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
