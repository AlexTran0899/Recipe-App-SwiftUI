//
//  DetailView.swift
//  RecipeListApp
//
//  Created by Alex Tran on 3/21/23.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                // MARK: Ingrediences
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    ForEach(recipe.ingredients, id: \.self){ item in
                        Text("• " + item)
                    }
                }.padding([.horizontal], 10)
                // MARK: Direction
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    ForEach(0..<recipe.directions.count, id: \.self) { i in
                        Text(String(i + 1) + ". " +
                             recipe.directions[i])
                            .padding(.bottom, 5)
                    }
                }.padding([.horizontal], 10)
            }
        }.navigationBarTitle(recipe.name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        // create a dummy recipe and pass it into the detail views so we can preview it
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
