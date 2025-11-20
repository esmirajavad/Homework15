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
 
 ContenView.swift

 */




import SwiftUI

struct ContentView: View {
    let holidays: [Holiday] = Bundle.main.decode("holidays.json")

    // One optional Holiday per sheet
    @State private var funFactHoliday: Holiday?
    @State private var moreInfoHoliday: Holiday?
    @State private var recipesHoliday: Holiday?

    var body: some View {
        NavigationStack {
            TabView {
                ForEach(holidays) { holiday in
                    List {
                        // Holiday name and image with description
                        VStack(spacing: 12) {
                            Text(holiday.name)
                                .font(.title)
                                .bold()

                            Image(holiday.image)
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .shadow(radius: 5)
                                .contextMenu {
                                    Button("Show Fun Fact") {
                                        funFactHoliday = holiday
                                    }

                                    Button("Learn More") {
                                        moreInfoHoliday = holiday
                                    }

                                    Button("Related Recipes") {
                                        recipesHoliday = holiday
                                    }
                                }

                            Text(holiday.about)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.vertical, 4)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)

                        // Recipes section
                        Section {
                            Text("Sweet Recipes")
                                .font(.headline)
                                .padding(.top, 8)
                                .frame(maxWidth: .infinity, alignment: .center)

                            ForEach(holiday.recipes) { recipe in
                                NavigationLink(recipe.title) {
                                    RecipeDetailView(holidayName: holiday.name, recipe: recipe)
                                }
                            }
                        }
                    }
                    .listSectionSpacing(17) // spacing between sections
                    .navigationTitle(holiday.name)
                    .tabItem { Text(holiday.name) }
                }
            }
            // SHEET: Fun Fact
            .sheet(item: $funFactHoliday) { holiday in
                NavigationStack {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Fun Fact")
                                .font(.largeTitle)
                                .bold()

                            Text(holiday.funFact)
                                .font(.body)
                                .padding(.top, 8)
                        }
                        .padding()
                    }
                    .navigationTitle(holiday.name)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Done") { funFactHoliday = nil }
                        }
                    }
                }
            }

            // SHEET: Learn More
            .sheet(item: $moreInfoHoliday) { holiday in
                NavigationStack {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            Text(holiday.name)
                                .font(.title)
                                .bold()

                            Text(holiday.moreInfo)
                                .font(.body)
                        }
                        .padding()
                    }
                    .navigationTitle("Learn More")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Done") { moreInfoHoliday = nil }
                        }
                    }
                }
            }

            // SHEET: Related Recipes
            .sheet(item: $recipesHoliday) { holiday in
                NavigationStack {
                    List(holiday.recipes) { recipe in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(recipe.title)
                                .font(.headline)
                            Text(recipe.details)
                                .font(.subheadline)
                        }
                        .padding(.vertical, 4)
                    }
                    .navigationTitle("\(holiday.name) Recipes")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Done") { recipesHoliday = nil }
                        }
                    }
                }
            }
        }
    }
}

#Preview { ContentView() }
