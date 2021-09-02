//
//  AddMetaData.swift
//  RecipeApp
//
//  Created by Michael Shustov on 02.09.2021.
//

import SwiftUI

struct AddMetaData: View {
    
    @Binding var name: String
    @Binding var summary: String
    @Binding var prepTime: String
    @Binding var cookTime: String
    @Binding var totalTime: String
    @Binding var servings: String
    
    var body: some View {
        
        Group {
            
            HStack {
                
                Text("Name: ")
                    .bold()
                TextField("Pelmeshka", text: $name)
                
            }
            
            HStack {
                
                Text("Summary: ")
                    .bold()
                TextField("Totally delicious meal", text: $summary)
                
            }
            
            HStack {
                
                Text("Preparation Time: ")
                    .bold()
                TextField("30 min", text: $prepTime)
                
            }
            
            HStack {
                
                Text("Cook Time: ")
                    .bold()
                TextField("30 min", text: $cookTime)
                
            }
            
            HStack {
                
                Text("Total Time: ")
                    .bold()
                TextField("60 min", text: $totalTime)
                
            }
            
            HStack {
                
                Text("Servings: ")
                    .bold()
                TextField("4 people", text: $servings)
                
            }
        }
    }
}
