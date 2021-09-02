//
//  RecipeListView.swift
//  RecipeApp
//
//  Created by Michael Shustov on 08.08.2021.
//

import SwiftUI

struct RecipeListView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
    private var recipes: FetchedResults<Recipe>
    
    @State var filterBy = ""
    
    private var filteredRecipes: [Recipe] {
        
        if filterBy.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return Array(recipes)
        }
        else {
            
            return recipes.filter { r in
                
                return r.name.contains(filterBy)
//                if r.name.contains(filterBy) {
//                    return true
//                }
//                return false
            }
        }
    }
        
    var body: some View {
        
        NavigationView {
            
            VStack (alignment: .leading) {
                
                Text("All recipes")
                    .padding(.top, 40)
                    .font(Font.custom("Avenir Heavy", size: 28))
                
                SearchBarView(filterBy: $filterBy)
                    .padding([.trailing, .bottom])
                
                
                ScrollView {
                    
                    LazyVStack (alignment: .leading) {
                        
                        ForEach(filteredRecipes) { r in
                                
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
            .navigationBarHidden(true)
            .padding(.leading)
            .onTapGesture {
                // Resign first responder
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
