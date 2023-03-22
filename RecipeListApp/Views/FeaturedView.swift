//
//  FeaturedView.swift
//  RecipeListApp
//
//  Created by Alex Tran on 3/22/23.
//

import SwiftUI

struct FeaturedView: View {
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Text("Featured Recipes")
                .padding(.leading)
                .padding(.top, 40)
                .bold()
                .font(.system(size: 30))
            GeometryReader { geo in
                TabView {
                    ForEach(0..<model.recipes.count, id: \.self) { i in
                        if model.recipes[i].featured {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                VStack {
                                    Image(model.recipes[i].image)
                                        .resizable()
                                        .scaledToFill()
                                    Text(model.recipes[i].name)
                                        .padding(10)
                                        .font(.headline)
                                }
                            }.frame(width: geo.size.width - 40, height: geo.size.height - 100,alignment: .center)
                                .cornerRadius(20)
                                .shadow(color: Color(hue: 1.0, saturation: 0.021, brightness: 0.792), radius: 10, x: -10 , y: 5)
                        }
                    }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            VStack(alignment: .leading, spacing: 10) {
                Text("Prep Time")
                    .font(.headline)
                Text("Highlight")
                    .font(.headline)
                Text("Highlight")
            }.padding([.leading,.bottom])
        }
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
            .environmentObject(RecipeModel())
    }
}
