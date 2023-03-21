//
//  DataService.swift
//  RecipeListApp
//
//  Created by Alex Tran on 3/21/23.
//

import Foundation
class DataService {
    func getLocalData() -> [Recipe] {
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        // Check if pathString is not nil, otherwise return empyty object
        guard pathString != nil else {
           return [Recipe]()
        }
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        // Create a data object
        do{
            let data = try Data(contentsOf: url)
            // Decode the json data
            do {
                let decoder = JSONDecoder()
                let recipeData = try decoder.decode([Recipe].self, from: data)
                // Add the unique IDS
                for r in recipeData {
                    r.id = UUID()
                }
                // Return the recipes
                return recipeData
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
        return [Recipe]()
    }
}
