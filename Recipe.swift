//
//  Recipe.swift
//  ProjectExample
//
//  Created by Mohamed Ameen on 28/12/24.
//

//import Foundation
//import SwiftData
//
//@Model
//class Recipe {
//    @Attribute(.unique) var id: UUID // Unique identifier for each recipe
//    var title: String // Recipe title
//    var category: String // Category like Breakfast, Lunch, etc.
//    var cookingTime: Int // Time required to cook in minutes
//    var imageName: String // Name of the image in your assets folder
//    var isTrending: Bool
//    
//    // Initializer
//    init(id: UUID = UUID(), title: String, category: String, cookingTime: Int, imageName: String) {
//        self.id = id
//        self.title = title
//        self.category = category
//        self.cookingTime = cookingTime
//        self.imageName = imageName
//        self.isTrending = isTrending
//    }
//}

import SwiftData

@Model
class Recipe {
    var title: String
    var category: String
    var cookingTime: Int
    var imageName: String
    var isTrending: Bool
    var author: String
    
    init(title: String, category: String, cookingTime: Int, imageName: String, isTrending: Bool = false, author: String) {
        self.title = title
        self.category = category
        self.cookingTime = cookingTime
        self.imageName = imageName
        self.isTrending = isTrending
        self.author = author
    }
}
