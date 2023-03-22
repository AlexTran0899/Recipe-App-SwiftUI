//
//  DetailView.swift
//  RecipeListApp
//
//  Created by Alex Tran on 3/21/23.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    @State var selectedServingSize =  2
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                // MARK: Recipe Title
                Text(recipe.name)
                    .padding(.top, 20)
                    .padding(.leading)
                    .bold()
                    .font(.system(size: 30))
                // MARK: Picker
                VStack(alignment: .leading){
                    Text("Select your serving size: ")
                    Picker("Serving size", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }.pickerStyle(SegmentedPickerStyle())
                        .frame(width: 180)
                }
                .padding()
                
                // MARK: Ingrediences
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    ForEach(recipe.ingredients){ item in
                        Text("• " +
                             RecipeModel.calculatePortion(ingredient: item, recipeServings: recipe.servings, targetServingSize: selectedServingSize)
                             + " " + item.name.lowercased()).padding(.bottom, 1)
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
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        // create a dummy recipe and pass it into the detail views so we can preview it
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
