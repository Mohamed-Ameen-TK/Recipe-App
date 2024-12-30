//
//  ProjectExampleApp.swift
//  ProjectExample
//
//  Created by Mohamed Ameen on 28/12/24.
//

//import SwiftUI
//import SwiftData
//
//@main
//struct ProjectExampleApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
//
//    var body: some Scene {
//        WindowGroup {
//            SplashScreen()
//        }
//        .modelContainer(sharedModelContainer)
//    }
//}

//import SwiftUI
//import SwiftData
//import Firebase // Import Firebase
//
//@main
//struct ProjectExampleApp: App {
//    // Firebase and SwiftData initialization
//    init() {
//        // Configure Firebase
//        FirebaseApp.configure()
//    }
//    
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
//
//    var body: some Scene {
//        WindowGroup {
//            SplashScreen()
//        }
//        .modelContainer(sharedModelContainer)
//    }
//}

//import SwiftUI
//import SwiftData
//import Firebase
//
//@main
//struct ProjectExampleApp: App {
//    // Firebase and SwiftData initialization
//    init() {
//        // Configure Firebase
//        FirebaseApp.configure()
//        
//        // Populate sample data
//        populateSampleRecipes()
//    }
//    
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Recipe.self, // Include Recipe model
//            Item.self,   // Include other models as needed
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
//
//    var body: some Scene {
//        WindowGroup {
//            SplashScreen()
//        }
//        .modelContainer(sharedModelContainer)
//    }
//    
//    /// Populate sample recipes
//    private func populateSampleRecipes() {
//        // Get the main context from the ModelContainer
//        let context = sharedModelContainer.mainContext
//        
//        // Check if recipes already exist
//        let existingRecipes = context.fetch(Recipe.self) ?? []
//        guard existingRecipes.isEmpty else { return } // Skip if data already exists
//
//        // Sample Recipes
//        let sampleRecipes = [
//            Recipe(title: "How to make sushi", category: "Lunch", cookingTime: 15, imageName: "sushi"),
//            Recipe(title: "Pepper sweetcorn ramen", category: "Dinner", cookingTime: 10, imageName: "ramen"),
//            Recipe(title: "Homemade pancake", category: "Breakfast", cookingTime: 20, imageName: "pancake"),
//        ]
//
//        // Add Recipes to the Context
//        for recipe in sampleRecipes {
//            context.insert(recipe)
//        }
//
//        // Save the Context
//        do {
//            try context.save()
//            print("Sample recipes added successfully!")
//        } catch {
//            print("Failed to add sample recipes: \(error)")
//        }
//    }
//}

//import SwiftUI
//import SwiftData
//import Firebase
//
//@main
//struct ProjectExampleApp: App {
//    // Firebase and SwiftData initialization
//    init() {
//        // Configure Firebase
//        FirebaseApp.configure()
//        
//        // Populate sample data
//        populateSampleRecipes()
//    }
//    
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Recipe.self, // Include Recipe model
//            Item.self,   // Include other models as needed
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
//
//    var body: some Scene {
//        WindowGroup {
//            SplashScreen()
//        }
//        .modelContainer(sharedModelContainer)
//    }
//    
//    /// Populate sample recipes
//    private func populateSampleRecipes() {
//        // Get the main context from the ModelContainer
//        let context = sharedModelContainer.mainContext
//        
//        // Create a fetch request for Recipe
//        let fetchRequest: NSFetchRequest<Recipe> = Recipe.fetchRequest()
//        
//        do {
//            // Check if recipes already exist
//            let existingRecipes = try context.fetch(fetchRequest)
//            guard existingRecipes.isEmpty else { return } // Skip if data already exists
//
//            // Sample Recipes
//            let sampleRecipes = [
//                Recipe(title: "How to make sushi", category: "Lunch", cookingTime: 15, imageName: "sushi"),
//                Recipe(title: "Pepper sweetcorn ramen", category: "Dinner", cookingTime: 10, imageName: "ramen"),
//                Recipe(title: "Homemade pancake", category: "Breakfast", cookingTime: 20, imageName: "pancake"),
//            ]
//
//            // Add Recipes to the Context
//            for recipe in sampleRecipes {
//                context.insert(recipe)
//            }
//
//            // Save the Context
//            try context.save()
//            print("Sample recipes added successfully!")
//
//        } catch {
//            print("Failed to fetch or add sample recipes: \(error)")
//        }
//    }
//}

//import SwiftUI
//import SwiftData
//import Firebase
//import CoreData // Add this import
//
//@main
//struct ProjectExampleApp: App {
//    // Firebase and SwiftData initialization
//    init() {
//        // Configure Firebase
//        FirebaseApp.configure()
//        
//        // Populate sample data
//        populateSampleRecipes()
//    }
//    
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Recipe.self, // Include Recipe model
//            Item.self,   // Include other models as needed
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
//
//    var body: some Scene {
//        WindowGroup {
//            SplashScreen()
//        }
//        .modelContainer(sharedModelContainer)
//    }
//    
//    /// Populate sample recipes
//    private func populateSampleRecipes() {
//        // Get the main context from the ModelContainer
//        let context = sharedModelContainer.mainContext
//        
//        // Create a fetch request for Recipe
//        let fetchRequest: NSFetchRequest<Recipe> = Recipe.fetchRequest()
//        
//        do {
//            // Check if recipes already exist
//            let existingRecipes = try context.fetch(fetchRequest)
//            guard existingRecipes.isEmpty else { return } // Skip if data already exists
//
//            // Sample Recipes
//            let sampleRecipes = [
//                Recipe(title: "How to make sushi", category: "Lunch", cookingTime: 15, imageName: "sushi"),
//                Recipe(title: "Pepper sweetcorn ramen", category: "Dinner", cookingTime: 10, imageName: "ramen"),
//                Recipe(title: "Homemade pancake", category: "Breakfast", cookingTime: 20, imageName: "pancake"),
//            ]
//
//            // Add Recipes to the Context
//            for recipe in sampleRecipes {
//                context.insert(recipe)
//            }
//
//            // Save the Context
//            try context.save()
//            print("Sample recipes added successfully!")
//
//        } catch {
//            print("Failed to fetch or add sample recipes: \(error)")
//        }
//    }
//}

//import SwiftUI
//import SwiftData
//import Firebase
//
//@main
//struct ProjectExampleApp: App {
//    // Firebase and SwiftData initialization
//    init() {
//        // Configure Firebase
//        FirebaseApp.configure()
//        
//        // Populate sample data
//        populateSampleRecipes()
//    }
//    
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Recipe.self, // Include Recipe model
//            Item.self,   // Include other models as needed
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
//
//    var body: some Scene {
//        WindowGroup {
//            SplashScreen()
//        }
//        .modelContainer(sharedModelContainer)
//    }
//    
//    /// Populate sample recipes
//    private func populateSampleRecipes() {
//        // Get the main context from the ModelContainer
//        let context = sharedModelContainer.mainContext
//        
//        // Fetch the existing recipes using SwiftData's fetch API
//        let existingRecipes: [Recipe]
//        do {
//            existingRecipes = try context.fetch(Recipe.self) ?? []
//        } catch {
//            print("Failed to fetch existing recipes: \(error)")
//            return
//        }
//
//        guard existingRecipes.isEmpty else { return } // Skip if data already exists
//
//        // Sample Recipes
//        let sampleRecipes = [
//            Recipe(title: "How to make sushi", category: "Lunch", cookingTime: 15, imageName: "sushi"),
//            Recipe(title: "Pepper sweetcorn ramen", category: "Dinner", cookingTime: 10, imageName: "ramen"),
//            Recipe(title: "Homemade pancake", category: "Breakfast", cookingTime: 20, imageName: "pancake"),
//        ]
//
//        // Add Recipes to the Context
//        for recipe in sampleRecipes {
//            context.insert(recipe)
//        }
//
//        // Save the Context
//        do {
//            try context.save()
//            print("Sample recipes added successfully!")
//        } catch {
//            print("Failed to save sample recipes: \(error)")
//        }
//    }
//}

//import SwiftUI
//import SwiftData
//import Firebase
//
//@main
//struct ProjectExampleApp: App {
//    // Firebase and SwiftData initialization
//    init() {
//        // Configure Firebase
//        FirebaseApp.configure()
//        
//        // Populate sample data
//        populateSampleRecipes()
//    }
//    
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Recipe.self, // Include Recipe model
//            Item.self,   // Include other models as needed
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
//
//    var body: some Scene {
//        WindowGroup {
//            SplashScreen()
//        }
//        .modelContainer(sharedModelContainer)
//    }
//    
//    /// Populate sample recipes
//    private func populateSampleRecipes() {
//        // Get the main context from the ModelContainer
//        let context = sharedModelContainer.mainContext
//        
//        // Create a FetchDescriptor for Recipe
//        let fetchDescriptor = FetchDescriptor<Recipe>()
//
//        do {
//            // Fetch the existing recipes using the FetchDescriptor
//            let existingRecipes = try context.fetch(fetchDescriptor)
//            guard existingRecipes.isEmpty else { return } // Skip if data already exists
//
//            // Sample Recipes
//            let sampleRecipes = [
//                Recipe(title: "How to make sushi", category: "Lunch", cookingTime: 15, imageName: "sushi"),
//                Recipe(title: "Pepper sweetcorn ramen", category: "Dinner", cookingTime: 10, imageName: "ramen"),
//                Recipe(title: "Homemade pancake", category: "Breakfast", cookingTime: 20, imageName: "pancake"),
//            ]
//
//            // Add Recipes to the Context
//            for recipe in sampleRecipes {
//                context.insert(recipe)
//            }
//
//            // Save the Context
//            try context.save()
//            print("Sample recipes added successfully!")
//
//        } catch {
//            print("Failed to fetch or add sample recipes: \(error)")
//        }
//    }
//}

//import SwiftUI
//import SwiftData
//import Firebase
//
//@main
//struct ProjectExampleApp: App {
//    // Firebase and SwiftData initialization
//    init() {
//        // Configure Firebase
//        FirebaseApp.configure()
//        
//        // Populate sample data
//        populateSampleRecipes()
//    }
//    
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Recipe.self, // Include Recipe model
//            Item.self,   // Include other models as needed
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
//
//    var body: some Scene {
//        WindowGroup {
//            SplashScreen()
//        }
//        .modelContainer(sharedModelContainer)
//    }
//    
//    /// Populate sample recipes
//    private func populateSampleRecipes() {
//        // Get the main context from the ModelContainer
//        let context = sharedModelContainer.mainContext
//        
//        // Create a FetchDescriptor for Recipe
//        let fetchDescriptor = FetchDescriptor<Recipe>()
//
//        do {
//            // Fetch the existing recipes using the FetchDescriptor
//            let existingRecipes = try context.fetch(fetchDescriptor)
//            guard existingRecipes.isEmpty else { return } // Skip if data already exists
//
//            // Sample Recipes
//            let sampleRecipes = [
//                Recipe(title: "How to make sushi", category: "Lunch", cookingTime: 15, imageName: "sushi"),
//                Recipe(title: "Pepper sweetcorn ramen", category: "Dinner", cookingTime: 10, imageName: "ramen"),
//                Recipe(title: "Homemade pancake", category: "Breakfast", cookingTime: 20, imageName: "pancake"),
//            ]
//
//            // Add Recipes to the Context
//            for recipe in sampleRecipes {
//                context.insert(recipe)
//            }
//
//            // Save the Context
//            try context.save()
//            print("Sample recipes added successfully!")
//
//        } catch {
//            print("Failed to fetch or add sample recipes: \(error)")
//        }
//    }
//}

//import SwiftUI
//import SwiftData
//import Firebase
//
//@main
//struct ProjectExampleApp: App {
//    // Firebase and SwiftData initialization
//    init() {
//        // Configure Firebase
//        FirebaseApp.configure()
//        
//        // Populate sample data (if needed)
//        populateSampleRecipes()
//    }
//    
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Recipe.self, // Ensure Recipe is defined
//            Item.self,   // Ensure Item is defined and valid
//        ])
//        
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//        
//        do {
//            print("Attempting to create ModelContainer...")
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            print("Failed to create ModelContainer: \(error.localizedDescription)")
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
//}

//import SwiftUI
//import SwiftData
//import Firebase
//
//@main
//struct ProjectExampleApp: App {
//    // Firebase and SwiftData initialization
//    init() {
//        // Configure Firebase
//        FirebaseApp.configure()
//        
//        // Populate sample data (if needed)
//        populateSampleRecipes()
//    }
//    
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Recipe.self, // Ensure Recipe is defined
//            Item.self,   // Ensure Item is defined and valid
//        ])
//        
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//        
//        do {
//            print("Attempting to create ModelContainer...")
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            print("Failed to create ModelContainer: \(error.localizedDescription)")
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
//
//    var body: some Scene {
//        WindowGroup {
//            SplashScreen() // Your main view here
//        }
//    }
//    
//    // Sample function to populate recipes if needed
//    func populateSampleRecipes() {
//        // You can add code to create sample data for your `Recipe` model here.
//        print("Populating sample recipes...")
//        // Example: Create and save sample recipe
//    }
//}

//import SwiftUI
//import SwiftData
//import Firebase
//
//@main
//struct ProjectExampleApp: App {
//    // Use UIApplicationDelegateAdaptor to satisfy Firebase's App Delegate expectations
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
//
//    var sharedModelContainer: ModelContainer = {
//        // Ensure models are valid
//        let schema = Schema([
//            Recipe.self,
//            Item.self,
//        ])
//        
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//        
//        do {
//            print("Attempting to create ModelContainer...")
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            print("Failed to create ModelContainer: \(error.localizedDescription)")
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
//
//    var body: some Scene {
//        WindowGroup {
//            SplashScreen()
//                .modelContainer(sharedModelContainer)
//        }
//    }
//}
//
//// MARK: - AppDelegate
//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication,
//                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        // Firebase Configuration
//        FirebaseApp.configure()
//        return true
//    }
//}

import SwiftUI
import SwiftData
import Firebase

@main
struct ProjectExampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize Firebase
        FirebaseApp.configure()
        return true
    }
}
