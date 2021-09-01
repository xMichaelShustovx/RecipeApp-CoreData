//
//  RecipeCategoryView.swift
//  RecipeApp
//
//  Created by Michael Shustov on 08.08.2021.
//

import SwiftUI

struct RecipeCategoryView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    @Binding var selectedTab: Int
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            Text("Categories")
                .padding(.top, 40)
                .font(Font.custom("Avenir Heavy", size: 28))
            
            GeometryReader { geo in
                
                ScrollView (showsIndicators: false) {
                    
                    LazyVGrid (columns: [GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top)], alignment: .center, spacing: 20) {
                        
                        ForEach(Array(model.categories), id: \.self) { category in
                            
                            Button {
                                selectedTab = Constants.listTab
                                model.selectedCategory = category
                            } label: {
                                VStack {
                                    Image(category)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: (geo.size.width - 20)/2, height: (geo.size.width - 20)/2)
                                        .cornerRadius(10)
                                        .clipped()
                                    
                                    Text(category)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    .padding(.bottom, 30)
                }
            }
        }
        .padding(.horizontal)
    }
}
