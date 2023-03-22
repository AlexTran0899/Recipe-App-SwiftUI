//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by Alex Tran on 3/21/23.
//

import Foundation
class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init () {
        // Parsed the local json file
        let service = DataService()
        // Set the recipes Property
        self.recipes = service.getLocalData()
    }
    static func calculatePortion(ingredient: Ingredient, recipeServings: Int,targetServingSize: Int) -> String {
        var portion = ""
        var top = ingredient.num ?? 1
        var bottom = ingredient.denom ?? 1
        var wholePortion = 0

        if ingredient.num != nil {
            // get a single serving size
            bottom *= recipeServings
            // get target portion by multiplying numerator by target servings
            top *= targetServingSize
            // Reduce fraction by greatest common divisor
            let divisor = Rational.gcd(top, bottom)
            top /= divisor
            bottom /= divisor
            // get the whole portion if top is more than bottom
            if top >= bottom {
                wholePortion = top / bottom
                top = top % bottom
                portion += String(wholePortion)
            }
            if top > 0 {
                portion += wholePortion > 0 ? " " : ""
                portion += "\(top)/\(bottom)"
            }
            if var unit = ingredient.unit {
                // Calculate appropriate suffix
                if wholePortion > 1 {
                    if unit.suffix(2) == "ch" {
                        unit += "es"
                    } else if unit.suffix(1) == "f" {
                        unit = String(unit.dropLast())
                        unit += "ves"
                    } else {
                        unit += "s"
                    }
                }
                portion += ingredient.num == nil && ingredient.denom == nil ? "" : " " + unit
                return portion
            }
            // express remainder as a fraction
            return portion
        }
        
        return ""
    }
}
