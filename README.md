A simple SwiftUI app displaying holidays, images, descriptions, fun facts, and sweet recipes.

 Overview

This app uses a TabView to display multiple holidays.
Each tab shows:

Holiday name

Themed image

Short description

Sweet recipes with details

Extra info loaded from a JSON file

Users can long-press the holiday image to open a context menu with three actions.

 Features
Holiday Content

Images, names, and descriptions

Recipes loaded from holidays.json

Detailed recipe view using NavigationLink

Context Menu on Image

Long-pressing the image opens:

Show Fun Fact (sheet)

Learn More (sheet with extended info)

Related Recipes (sheet listing recipes)

Multiple Sheets

Each context menu option presents its own sheet using SwiftUI’s .sheet(item:).

JSON Data

All holiday information — including:

name

image

about

funFact

moreInfo

recipes (title + details)

is stored in a bundled JSON file.

 Technologies Used

SwiftUI

NavigationStack

TabView

Sheets

Context Menus

JSON Decoding (Codable)

List & Section layouts


 File Structure
 
ContentView.swift

Holiday.swift

RecipeDetailView.swift

holidays.json



 Requirements

Xcode 15 or later

iOS 17+

SwiftUI enabled project
