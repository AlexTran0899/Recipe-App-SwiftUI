//
//  ingredients.swift
//  RecipeListApp
//
//  Created by Alex Tran on 3/22/23.
//

import Foundation
class Ingredient: Identifiable, Decodable {
    var id:UUID?
    var name: String
    var num: Int?
    var denom: Int?
    var unit: String?
}
