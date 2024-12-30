//
//  HomeView.swift
//  ProjectExample
//
//  Created by Mohamed Ameen on 28/12/24.
//

//import SwiftUI
//import SwiftData
//
//// MARK: - Recipe Model
//@Model
//struct Recipe {
//    var title: String
//    var category: String
//    var time: String
//    var imageName: String
//    var isTrending: Bool
//    var author: String
//}
//
//// MARK: - ContentView
//struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var recipes: [Recipe]
//    
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                VStack(alignment: .leading, spacing: 20) {
//                    
//                    // Search Bar
//                    HStack {
//                        TextField("Search recipes", text: .constant(""))
//                            .padding(10)
//                            .background(Color(.systemGray6))
//                            .cornerRadius(8)
//                        Image(systemName: "magnifyingglass")
//                            .foregroundColor(.gray)
//                    }
//                    .padding(.horizontal)
//                    
//                    // Trending Recipes Section
//                    if let trendingRecipes = recipes.filter({ $0.isTrending }), !trendingRecipes.isEmpty {
//                        SectionHeader(title: "Trending now 🔥")
//                        ScrollView(.horizontal, showsIndicators: false) {
//                            HStack(spacing: 15) {
//                                ForEach(trendingRecipes) { recipe in
//                                    TrendingRecipeCard(recipe: recipe)
//                                }
//                            }
//                            .padding(.horizontal)
//                        }
//                    }
//                    
//                    // Popular Categories Section
//                    SectionHeader(title: "Popular category")
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(spacing: 15) {
//                            ForEach(Array(Set(recipes.map { $0.category })), id: \.self) { category in
//                                Text(category)
//                                    .padding(.horizontal, 10)
//                                    .padding(.vertical, 5)
//                                    .background(Color.red.opacity(0.1))
//                                    .cornerRadius(8)
//                            }
//                        }
//                        .padding(.horizontal)
//                    }
//                    
//                    // Recent Recipes Section
//                    SectionHeader(title: "Recent recipe")
//                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
//                        ForEach(recipes) { recipe in
//                            RecipeCard(recipe: recipe)
//                        }
//                    }
//                    .padding(.horizontal)
//                }
//            }
//            .navigationTitle("Find best recipes for cooking")
//            .toolbar {
//                ToolbarItem(placement: .bottomBar) {
//                    Button(action: addDummyRecipe) {
//                        Image(systemName: "plus.circle.fill")
//                            .font(.largeTitle)
//                            .foregroundColor(.red)
//                    }
//                }
//            }
//        }
//    }
//    
//    // Add a dummy recipe for testing
//    private func addDummyRecipe() {
//        let newRecipe = Recipe(
//            title: "New Recipe",
//            category: "Breakfast",
//            time: "15 Mins",
//            imageName: "example-image",
//            isTrending: Bool.random(),
//            author: "Test Author"
//        )
//        modelContext.insert(newRecipe)
//    }
//}

//import SwiftUI
//import SwiftData
//
//// MARK: - ContentView
//struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var recipes: [Recipe]
//
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                VStack(alignment: .leading, spacing: 20) {
//                    
//                    // Search Bar
//                    HStack {
//                        TextField("Search recipes", text: .constant(""))
//                            .padding(10)
//                            .background(Color(.systemGray6))
//                            .cornerRadius(8)
//                        Image(systemName: "magnifyingglass")
//                            .foregroundColor(.gray)
//                    }
//                    .padding(.horizontal)
//                    
//                    // Trending Recipes Section
//                    if let trendingRecipes = recipes.filter({ $0.isTrending }), !trendingRecipes.isEmpty {
//                        SectionHeader(title: "Trending now 🔥")
//                        ScrollView(.horizontal, showsIndicators: false) {
//                            HStack(spacing: 15) {
//                                ForEach(trendingRecipes) { recipe in
//                                    TrendingRecipeCard(recipe: recipe)
//                                }
//                            }
//                            .padding(.horizontal)
//                        }
//                    }
//                    
//                    // Popular Categories Section
//                    SectionHeader(title: "Popular category")
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(spacing: 15) {
//                            ForEach(Array(Set(recipes.map { $0.category })), id: \.self) { category in
//                                Text(category)
//                                    .padding(.horizontal, 10)
//                                    .padding(.vertical, 5)
//                                    .background(Color.red.opacity(0.1))
//                                    .cornerRadius(8)
//                            }
//                        }
//                        .padding(.horizontal)
//                    }
//                    
//                    // Recent Recipes Section
//                    SectionHeader(title: "Recent recipes")
//                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
//                        ForEach(recipes) { recipe in
//                            RecipeCard(recipe: recipe)
//                        }
//                    }
//                    .padding(.horizontal)
//                }
//            }
//            .navigationTitle("Find best recipes for cooking")
//            .toolbar {
//                ToolbarItem(placement: .bottomBar) {
//                    Button(action: addDummyRecipe) {
//                        Image(systemName: "plus.circle.fill")
//                            .font(.largeTitle)
//                            .foregroundColor(.red)
//                    }
//                }
//            }
//        }
//    }
//
//    // Add a dummy recipe for testing
//    private func addDummyRecipe() {
//        let newRecipe = Recipe(
//            title: "New Recipe",
//            category: "Breakfast",
//            cookingTime: 15,  // In minutes
//            imageName: "example-image"
//        )
//        modelContext.insert(newRecipe)
//    }
//}
//
//import SwiftUI
//import SwiftData
//
//// MARK: - SectionHeader View
//struct SectionHeader: View {
//    var title: String
//
//    var body: some View {
//        Text(title)
//            .font(.headline)
//            .foregroundColor(.primary)
//            .padding(.leading)
//            .padding(.top, 10)
//    }
//}
//
//// MARK: - TrendingRecipeCard View
//struct TrendingRecipeCard: View {
//    var recipe: Recipe
//
//    var body: some View {
//        VStack {
//            // Recipe Image
//            Image(recipe.imageName) // Assuming you have images in assets
//                .resizable()
//                .scaledToFit()
//                .frame(width: 150, height: 100)
//                .cornerRadius(8)
//            
//            // Recipe Title
//            Text(recipe.title)
//                .font(.caption)
//                .lineLimit(1)
//                .foregroundColor(.primary)
//            
//            // Recipe Category
//            Text(recipe.category)
//                .font(.subheadline)
//                .foregroundColor(.secondary)
//        }
//        .frame(width: 150)
//        .padding(10)
//        .background(Color.white)
//        .cornerRadius(12)
//        .shadow(radius: 5)
//    }
//}
//
//// MARK: - ContentView (HomeView)
//struct HomeView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var recipes: [Recipe]
//
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                VStack(alignment: .leading, spacing: 20) {
//                    
//                    // Search Bar
//                    HStack {
//                        TextField("Search recipes", text: .constant(""))
//                            .padding(10)
//                            .background(Color(.systemGray6))
//                            .cornerRadius(8)
//                        Image(systemName: "magnifyingglass")
//                            .foregroundColor(.gray)
//                    }
//                    .padding(.horizontal)
//                    
//                    // Trending Recipes Section
//                    if let trendingRecipes = recipes.filter({ $0.isTrending }), !trendingRecipes.isEmpty {
//                        SectionHeader(title: "Trending now 🔥")
//                        ScrollView(.horizontal, showsIndicators: false) {
//                            HStack(spacing: 15) {
//                                ForEach(trendingRecipes) { recipe in
//                                    TrendingRecipeCard(recipe: recipe)
//                                }
//                            }
//                            .padding(.horizontal)
//                        }
//                    }
//                    
//                    // Popular Categories Section
//                    SectionHeader(title: "Popular category")
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(spacing: 15) {
//                            ForEach(Array(Set(recipes.map { $0.category })), id: \.self) { category in
//                                Text(category)
//                                    .padding(.horizontal, 10)
//                                    .padding(.vertical, 5)
//                                    .background(Color.red.opacity(0.1))
//                                    .cornerRadius(8)
//                            }
//                        }
//                        .padding(.horizontal)
//                    }
//                    
//                    // Recent Recipes Section
//                    SectionHeader(title: "Recent recipes")
//                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
//                        ForEach(recipes) { recipe in
//                            RecipeCard(recipe: recipe)
//                        }
//                    }
//                    .padding(.horizontal)
//                }
//            }
//            .navigationTitle("Find best recipes for cooking")
//            .toolbar {
//                ToolbarItem(placement: .bottomBar) {
//                    Button(action: addDummyRecipe) {
//                        Image(systemName: "plus.circle.fill")
//                            .font(.largeTitle)
//                            .foregroundColor(.red)
//                    }
//                }
//            }
//        }
//    }
//
//    // Add a dummy recipe for testing
//    private func addDummyRecipe() {
//        let newRecipe = Recipe(
//            title: "New Recipe",
//            category: "Breakfast",
//            cookingTime: 15,  // In minutes
//            imageName: "example-image" // Replace with an actual image name in your assets
//        )
//        modelContext.insert(newRecipe)
//    }
//}
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}

//import SwiftUI
//import SwiftData
//
//// MARK: - SectionHeader View
//struct SectionHeader: View {
//    var title: String
//
//    var body: some View {
//        Text(title)
//            .font(.headline)
//            .foregroundColor(.primary)
//            .padding(.leading)
//            .padding(.top, 10)
//    }
//}
//
//// MARK: - TrendingRecipeCard View
//struct TrendingRecipeCard: View {
//    var recipe: Recipe
//
//    var body: some View {
//        VStack {
//            // Recipe Image
//            Image("Trending Now") // Assuming you have images in assets
//                .resizable()
//                .scaledToFit()
//                .frame(width: 150, height: 100)
//                .cornerRadius(8)
//            
//            // Recipe Title
//            Text(recipe.title)
//                .font(.caption)
//                .lineLimit(1)
//                .foregroundColor(.primary)
//            
//            // Recipe Category
//            Text(recipe.category)
//                .font(.subheadline)
//                .foregroundColor(.secondary)
//        }
//        .frame(width: 150)
//        .padding(10)
//        .background(Color.white)
//        .cornerRadius(12)
//        .shadow(radius: 5)
//    }
//}
//
//// MARK: - RecipeCard View
//struct RecipeCard: View {
//    var recipe: Recipe
//
//    var body: some View {
//        VStack {
//            // Recipe Image
//            Image(recipe.imageName) // Assuming you have images in assets
//                .resizable()
//                .scaledToFit()
//                .frame(width: 150, height: 100)
//                .cornerRadius(8)
//            
//            // Recipe Title
//            Text(recipe.title)
//                .font(.caption)
//                .lineLimit(1)
//                .foregroundColor(.primary)
//            
//            // Recipe Category
//            Text(recipe.category)
//                .font(.subheadline)
//                .foregroundColor(.secondary)
//            
//            // Recipe Cooking Time
//            Text("\(recipe.cookingTime) mins")
//                .font(.footnote)
//                .foregroundColor(.gray)
//        }
//        .frame(width: 150)
//        .padding(10)
//        .background(Color.white)
//        .cornerRadius(12)
//        .shadow(radius: 5)
//    }
//}
//
//// MARK: - HomeView (ContentView)
//struct HomeView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var recipes: [Recipe]
//
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                VStack(alignment: .leading, spacing: 20) {
//                    
//                    // Search Bar
//                    HStack {
//                        TextField("Search recipes", text: .constant(""))
//                            .padding(10)
//                            .background(Color(.systemGray6))
//                            .cornerRadius(8)
//                        Image(systemName: "magnifyingglass")
//                            .foregroundColor(.gray)
//                    }
//                    .padding(.horizontal)
//                    
//                    // Trending Recipes Section
//                    // Trending Recipes Section
//                    if !recipes.filter({ $0.isTrending }).isEmpty {
//                        SectionHeader(title: "Trending now 🔥")
//                        ScrollView(.horizontal, showsIndicators: false) {
//                            HStack(spacing: 15) {
//                                ForEach(recipes.filter({ $0.isTrending })) { recipe in
//                                    TrendingRecipeCard(recipe: recipe)
//                                }
//                            }
//                            .padding(.horizontal)
//                        }
//                    }
//
//                    
//                    // Popular Categories Section
//                    SectionHeader(title: "Popular category")
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(spacing: 15) {
//                            ForEach(Array(Set(recipes.map { $0.category })), id: \.self) { category in
//                                Text(category)
//                                    .padding(.horizontal, 10)
//                                    .padding(.vertical, 5)
//                                    .background(Color.red.opacity(0.1))
//                                    .cornerRadius(8)
//                            }
//                        }
//                        .padding(.horizontal)
//                    }
//                    
//                    // Recent Recipes Section
//                    SectionHeader(title: "Recent recipes")
//                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
//                        ForEach(recipes) { recipe in
//                            RecipeCard(recipe: recipe)
//                        }
//                    }
//                    .padding(.horizontal)
//                }
//            }
//            .navigationTitle("Find best recipes for cooking")
//            .toolbar {
//                ToolbarItem(placement: .bottomBar) {
//                    Button(action: addDummyRecipe) {
//                        Image(systemName: "plus.circle.fill")
//                            .font(.largeTitle)
//                            .foregroundColor(.red)
//                    }
//                }
//            }
//        }
//    }
//
//    // Add a dummy recipe for testing
//    private func addDummyRecipe() {
//        let newRecipe = Recipe(
//            title: "New Recipe",
//            category: "Breakfast",
//            cookingTime: 15,  // In minutes
//            imageName: "example-image", // Replace with an actual image name in your assets
//            author: "Your Name" // Add the author parameter
//        )
//        modelContext.insert(newRecipe)
//    }
//}
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}

import SwiftUI
import SwiftData

// MARK: - SectionHeader View
struct SectionHeader: View {
    var title: String
    var showSeeAll: Bool = false
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
            Spacer()
            if showSeeAll {
                Button("See all") {}
                    .font(.subheadline)
                    .foregroundColor(.red)
            }
        }
        .padding(.horizontal)
        .padding(.top, 10)
    }
}

// MARK: - TrendingRecipeCard View
struct TrendingRecipeCard: View {
    var recipe: Recipe

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("Trending Now") // Assuming you have images in assets
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 120)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(recipe.title)
                    .font(.caption)
                    .bold()
                    .lineLimit(1)
                    .foregroundColor(.white)
                Text("\(recipe.cookingTime) mins")
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.9))
            }
            .padding(6)
            .background(Color.black.opacity(0.6))
            .cornerRadius(8)
            .padding(5)
        }
        .frame(width: 150)
        .shadow(radius: 5)
    }
}

// MARK: - RecipeCard View
struct RecipeCard: View {
    var recipe: Recipe

    var body: some View {
        VStack(alignment: .leading) {
            Image(recipe.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .cornerRadius(8)
            Text(recipe.title)
                .font(.headline)
                .lineLimit(2)
            Text("By \(recipe.author)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 3)
    }
}

// MARK: - HomeView (ContentView)
struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var recipes: [Recipe]

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Search Bar
                HStack {
                    TextField("Search recipes", text: .constant(""))
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // Trending Recipes Section
                        if !recipes.filter({ $0.isTrending }).isEmpty {
                            SectionHeader(title: "Trending now 🔥", showSeeAll: true)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(recipes.filter({ $0.isTrending })) { recipe in
                                        TrendingRecipeCard(recipe: recipe)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        
                        // Popular Categories Section
                        SectionHeader(title: "Popular category")
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(Array(Set(recipes.map { $0.category })), id: \.self) { category in
                                    Text(category)
                                        .font(.subheadline)
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .background(Color.red.opacity(0.1))
                                        .cornerRadius(16)
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        // Recent Recipes Section
                        SectionHeader(title: "Recent recipes", showSeeAll: true)
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                            ForEach(recipes) { recipe in
                                RecipeCard(recipe: recipe)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .navigationTitle("Find best way for cooking")

                // Bottom Tab Bar
                HStack {
                    Spacer()
                    Image(systemName: "house.fill")
                        .font(.title)
                        .foregroundColor(.gray)
                    Spacer()
                    Button(action: addDummyRecipe) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    }
                    Spacer()
                    Image(systemName: "bell.fill")
                        .font(.title)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding()
                .background(Color.white)
                .shadow(radius: 5)
            }
        }
    }

    // Add a dummy recipe for testing
    private func addDummyRecipe() {
        let newRecipe = Recipe(
            title: "New Recipe",
            category: "Breakfast",
            cookingTime: 15, // In minutes
            imageName: "example-image", // Replace with an actual image name in your assets
            author: "Chef John" // Add author value here
        )
        modelContext.insert(newRecipe)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
