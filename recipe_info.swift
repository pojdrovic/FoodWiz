//
//  recipe_info.swift
//  FoodWiz
//
//  Created by Petar Ojdrovic on 6/28/17.
//  Copyright © 2017 Petar Ojdrovic. All rights reserved.
//

import Foundation
import UIKit



// Definititions fot the recipe_info type. This template object holds all the information necessary
// to create and store recipe objects.
// These recipe objects are sourced from the data in the FoodWizDB.db sqlite file.
class recipe_info: NSObject {
    // The hashed name of the recipe
    var hashName:Int = Int()
    
    // The string title of the recipe (will be displayed as the thing to click on in the app).
    var recipeTitle:String = String()
    
    // The string instructions of the recipe. Numbered 1-n, where n is the number of steps.
    var instructions:[String] = [String]()
    
    // The ingredient meta-data. This is an array of integers, where each integer corresponds to an ingredient.
    var ingredientMetaData:[Int] = [Int]()
    
    // Dietary restrictions. 1 for vegeterian, 0 for not.
    var dietaryRestriction:Int = Int()
    
    // Filename - this is the name of the file which was used to create the recipe object.
    var fileName:String = String()
    
    // This is the list of metadata corresponding to the recipe. Number of servings, prep time, cook time.
    var recipeMetaData:[String] = [String]()
    
    // Description of the recipe. Short sentance describing the recipe.
    var RecipeDescription:String = String()
    
    // All the ingredients grouped together
    var allIngredients:[String] = [String]()
    
    // All the ingredients broken down by subsection
    var allIngredientsByType:[String:[String]] = [String:[String]]()
    
}
