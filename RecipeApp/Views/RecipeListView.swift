//
//  RecipeListView.swift
//  RecipeApp
//
//  Created by Michael Shustov on 08.08.2021.
//

import SwiftUI

struct RecipeListView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @EnvironmentObject var model:RecipeModel
    
    private var title: String {
        
        if model.selectedCategory == nil || model.selectedCategory == Constants.defaultListFilter {
            return "All Recipes"
        }
        else {
            return model.selectedCategory!
        }
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack (alignment: .leading) {
                
                Text(title)
                    .padding(.top, 40)
                    .font(Font.custom("Avenir Heavy", size: 28))
                
                ScrollView {
                    
                    LazyVStack (alignment: .leading) {
                        
                        ForEach(model.recipes) { r in
                            
                            if model.selectedCategory == nil ||
                                model.selectedCategory == Constants.defaultListFilter ||
                                model.selectedCategory != nil && r.category == model.selectedCategory {
                                
                                NavigationLink(
                                    destination: RecipeDetailView(recipe:r),
                                    label: {
                                        
                                        // MARK: Row item
                                        HStack(spacing: 20.0) {
                                            let image = UIImage(data: r.image ?? Data()) ?? UIImage()
                                            Image(uiImage: image)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 50, height: 50, alignment: .center)
                                                .clipped()
                                                .cornerRadius(5)
                                            VStack (alignment: .leading) {
                                                Text(r.name)
                                                    .font(Font.custom("Avenir Heavy", size: 16))
                                                    .foregroundColor(.black)
                                                RecipeHighlights(highlights: r.highlights)
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    })
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .padding(.leading)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
