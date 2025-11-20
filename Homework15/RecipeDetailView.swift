/*:
 ## CIS137 iOS/SWIFT Programming
 
 ## Homework 15
 
 Student: Esmira Babayeva
 
 Instructor: Hellen Pacheco
 
 Nivember, 2025
 
 App using TabView.
 Each tap contains picture,
 holiday name, short description and
 recipe.
 json file used to store the data
 used in the app
 
 RecipeDetailView.swift - separate swift file for navigation

 */


import SwiftUI

struct RecipeDetailView: View {
    let holidayName: String
    let recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(recipe.title)
                    .font(.largeTitle)
                    .bold()

            

                Divider()

                Text(recipe.details)
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle(recipe.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
