//
//  ContentView.swift
//  RecipeListApp
//
//  Created by Alex Tran on 3/21/23.
//

import SwiftUI

struct RecipeListView: View {
    // Reference the view model
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        NavigationView {
            List(model.recipes) { r in
                    NavigationLink {
                        RecipeDetailView(recipe: r)
                    } label: {
                        HStack(spacing: 20) {
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50,height: 50, alignment: .center)
                                .clipped()
                                .cornerRadius(5.0)
                            Text(r.name)
                    }
                }
            }.navigationTitle("All recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
