//
//  RecipeHighlights.swift
//  RecipeApp
//
//  Created by Michael Shustov on 08.08.2021.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights: [String]) {
        
        for index in 0..<highlights.count {
            
            if index == highlights.count - 1 {
                
                allHighlights += highlights[index]
            }
            else {
                
                allHighlights += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHighlights)
            .font(Font.custom("Avenir", size: 15))
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test1", "test2", "test3"])
    }
}
