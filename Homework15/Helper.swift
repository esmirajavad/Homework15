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

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from bundle.")
        }
        guard let decoded = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Could not decode \(file).")
        }
        return decoded
    }
}
