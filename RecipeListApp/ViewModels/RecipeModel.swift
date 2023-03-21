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
}
