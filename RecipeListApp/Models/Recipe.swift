//
//  Recipe.swift
//  RecipeListApp
//
//  Created by Alex Tran on 3/21/23.
//

import Foundation

class Recipe: Identifiable, Decodable {
    var id: UUID?
    var name:String
    var featured:Bool
    var image: String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var highlights:[String]
    var ingredients:[Ingredients]
    var directions:[String]
    
    func print(){
        Swift.print(self.name)
    }
}
