//
//  RecipeModel.swift
//  RecipeApp
//
//  Created by Michael Shustov on 08.08.2021.
//

import Foundation
import UIKit

class RecipeModel: ObservableObject {
    
    // Reference to the managed object context
    let managedObjectContext = PersistenceController.shared.container.viewContext
    
    @Published var recipes = [Recipe]()
    @Published var categories = Set<String>()
    @Published var selectedCategory: String?
    
    init() {

        // Check if we preloaded data into core data
        checkLoadedData()
        
        // TODO: preparation for category view
//        self.categories = Set(self.recipes.map({ r in
//            return r.category
//        }))
//        self.categories.update(with: Constants.defaultListFilter)
    }
    
    func checkLoadedData() {
        
        // Check local storage for the flag
        let status = UserDefaults.standard.bool(forKey: Constants.isDataPreloaded)
        
        // If it's false -> parse local json file
        if status == false {
            
            preloadLocalData()
            
        }
    }
    
    func preloadLocalData() {
        
        // Parse the local JSON file
        let localRecipes = DataService.getLocalData()
        
        // Create Core Data objects
        for r in localRecipes {
            
            // Create core data object
            let recipe = Recipe(context: managedObjectContext)
            
            // Set properties
            recipe.id = UUID()
            recipe.name = r.name
            recipe.category = r.category
            recipe.featured = r.featured
            recipe.image = UIImage(named: r.image)?.jpegData(compressionQuality: 1.0)
            recipe.summary = r.description
            recipe.prepTime = r.prepTime
            recipe.cookTime = r.cookTime
            recipe.totalTime = r.totalTime
            recipe.servings = r.servings
            recipe.highlights = r.highlights
            recipe.directions = r.directions
            
            for i in r.ingredients {
                
                let ingredient = Ingredient(context: managedObjectContext)
                
                ingredient.id = UUID()
                ingredient.name = i.name
                ingredient.num = i.num ?? 1
                ingredient.denom = i.denom ?? 1
                ingredient.unit = i.unit
                
                recipe.addToIngredients(ingredient)
            }
        }
        
        // Save into Core Data
        do {
            try managedObjectContext.save()
            
            // Set local storage flag
            UserDefaults.standard.setValue(true, forKey: Constants.isDataPreloaded)
            
        }
        catch {
            print(error)
        }
    }
    
    static func getPortion (ingredient: Ingredient, recipeServings: Int, targetServings: Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num
        var denumerator = ingredient.denom
        var wholePortions = 0
        
        denumerator *= recipeServings
        numerator *= targetServings
        
        let commonDivisor = Rational.greatestCommonDivisor(numerator, denumerator)
        
        denumerator  /= commonDivisor
        numerator /= commonDivisor
        
        if numerator >= denumerator {
            
            wholePortions = numerator / denumerator
            
            numerator = numerator % denumerator
            
            portion += String(wholePortions)
        }
        
        if numerator > 0 {
            
            portion += wholePortions > 0 ? " " : ""
            portion += "\(numerator)/\(denumerator)"
        }
        
        if var unit = ingredient.unit {
            
            if wholePortions > 1{
                
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
        }
            
        return portion
    }
}
