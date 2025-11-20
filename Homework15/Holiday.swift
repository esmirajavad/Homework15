/*:
 ## CIS137 iOS/SWIFT Programming
 
 ## Homework 15
 
 Student: Esmira Babayeva
 
 Instructor: Hellen Pacheco
 
 20 November, 2025
 
 App using TabView.
 Each tap contains picture,
 holiday name, short description and
 recipe.
 json file used to store the data
 used in the app
 
 New feature: Context menu.
 JSON file updated (Holiday.swit as well) to be used as
 context menu. When image clicked 3 options appeAr:
 Show Fun Fact
 Learn More
 Related Recipes (Repeated at Sweet recipes section)
 
 Each of option navigates to a new sheet
 
 Helper.swift

 */





import Foundation

struct Recipe: Identifiable, Decodable {
    let id = UUID()
    let title: String
    let details: String
}

struct Holiday: Identifiable, Decodable {
    let id = UUID()
    let name: String
    let image: String
    let about: String
    let funFact: String      // NEW
    let moreInfo: String     // NEW
    let recipes: [Recipe]
}
