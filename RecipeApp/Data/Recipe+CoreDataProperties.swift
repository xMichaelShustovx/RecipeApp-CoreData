//
//  Recipe+CoreDataProperties.swift
//  RecipeApp
//
//  Created by Michael Shustov on 26.08.2021.
//
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String
    @NSManaged public var category: String?
    @NSManaged public var featured: Bool
    @NSManaged public var image: Data?
    @NSManaged public var summary: String
    @NSManaged public var prepTime: String
    @NSManaged public var cookTime: String
    @NSManaged public var totalTime: String
    @NSManaged public var servings: Int
    @NSManaged public var highlights: [String]
    @NSManaged public var directions: [String]
    @NSManaged public var ingredients: NSSet

}

// MARK: Generated accessors for ingredients
extension Recipe {

    @objc(addIngredientsObject:)
    @NSManaged public func addToIngredients(_ value: Ingredient)

    @objc(removeIngredientsObject:)
    @NSManaged public func removeFromIngredients(_ value: Ingredient)

    @objc(addIngredients:)
    @NSManaged public func addToIngredients(_ values: NSSet)

    @objc(removeIngredients:)
    @NSManaged public func removeFromIngredients(_ values: NSSet)

}

extension Recipe : Identifiable {

}
