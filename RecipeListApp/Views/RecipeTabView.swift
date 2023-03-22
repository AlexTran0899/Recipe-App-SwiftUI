//
//  RecipeTabView.swift
//  RecipeListApp
//
//  Created by Alex Tran on 3/21/23.
//

import SwiftUI

struct RecipeTabView: View {
    @State var currTab = 0
    var body: some View {
        TabView(selection: $currTab) {
            Text("Featured")
                .tabItem {
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }.tag(0)
            RecipeListView()
                .tabItem {
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }.tag(1)
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
