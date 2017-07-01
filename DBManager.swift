//
//  DBManager.swift
//  FoodWiz
//
//  Created by Petar Ojdrovic on 6/26/17.
//  Copyright © 2017 Petar Ojdrovic. All rights reserved.
//

import UIKit
import Foundation

let sharedInstance = DBManager()


class DBManager: NSObject {
    
    var database: FMDatabase? = nil
    
    class func getInstance() -> DBManager {
        if sharedInstance.database == nil {
        sharedInstance.database = FMDatabase(path: Util.getPath(fileName: "FoodWizDB.db"))
        }
        return sharedInstance
    }
    
    // MARK - Insert Data Into Table
    
    func insertDataHashIngs(_ hashIngsTble_info:hashIngsTbl_Info) -> Bool {
        sharedInstance.database!.open()
        let isInserted = sharedInstance.database!.executeUpdate("INSERT INTO hashesAndIngs(hash, ingredients) VALUES(?,?)", withArgumentsIn: [hashIngsTbl_Info.hash, hashIngsTble_info.ingsAsIntArray])
        sharedInstance.database!.close()
        return (isInserted != nil)
    }
    
    func getAllAvailableRecipes(ingredients: [Int]) -> NSMutableArray {
        
        // Open the connection to the database.
        sharedInstance.database!.open()
        
        // get the set of owned ingredients
        let setOfOwnedIngredients = Set(ingredients)
        
        let resultSet:FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM recipes", withArgumentsIn: [0])
        
        var iterator = 0
        
        // Declaring the array of recipes to return.
        let recpiesToReturn:NSMutableArray = NSMutableArray()
        
        // Build the objects if the result set is not empty.
        if(resultSet != nil) {
            // Iterate through all the items in the database.
            while(resultSet.next()) {
                iterator = iterator + 1
                
                // build the temporary recipe object.
                let tempRecipe:recipe_info = recipe_info()
                
                // Now to build the various components of a recipe.
                
                // Title of Recipe
                tempRecipe.recipeTitle = String(describing: resultSet.string(forColumn: "recipeName"))
                
                // Hash of Recipe
                tempRecipe.hashName = Int(resultSet.int(forColumn: "recipeHashedName"))
                
                // Description of Recipe
                tempRecipe.recipeDescription = String(describing: resultSet.string(forColumn: "recipeDescription"))
                
                // Recipe Meta Data
                //tempRecipe.recipeMetaData =
                
                // Ingredient Meta Data
                //tempRecipe.ingredientMetaData =
                
                // List of ingredients
                //tempRecipe.allIngredients =
                
                // Recipe Instructions
                //tempRecipe.instructions =
                
                // dietary restrictions
                tempRecipe.dietaryRestriction = Int(resultSet.int(forColumn: "recipeDietary"))
                
                recpiesToReturn.add(tempRecipe)
                
            }
            
            sharedInstance.database!.close()
            return recpiesToReturn
            
        }
        
        
        // Final return of the available recipes.
        return recpiesToReturn
        
    }
    
    
    // function to get all hashes and ingredients.
    // Need to pass in the array of ingredients which you have.
    func getAllHashIngs(ingredients: [Int]) -> NSMutableArray {
        print(ingredients)
        sharedInstance.database!.open()
        
        let setOfOwnedIngredients = Set(ingredients)
        
        let resultSet:FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM hashesAndIngs", withArgumentsIn: [0])
        
        var iterator = 0
        
        let itemInfo:NSMutableArray = NSMutableArray()
        if(resultSet != nil) {
            while resultSet.next() {
                iterator = iterator + 1
                let item:hashIngsTbl_Info = hashIngsTbl_Info()
                //item.hashName = Int(resultSet.int(forColumn: "hash"))
                item.hashName = Int(resultSet.int(forColumn: "hash"))
                //print(item.hashName)
                let tempStringOfIngredints = String(describing: resultSet.string(forColumn: "ingredients"))
                let values = tempStringOfIngredints.components(separatedBy: " ").flatMap { Int($0.trimmingCharacters(in: .whitespaces)) }
                //let tempValues = tempStringOfIngredints.characters.split{$0 == " "}.map(String.init)
                
                
                // TODO - FIX SO THAT WORKS WHEN INGREDINTS ARE LESS THAN 2!!!!
                //var tempArrayOfInts = [Int]()
                
                //let stringOfWordsArray = tempStringOfIngredints.components(separatedBy: " ")
                
                //for word in stringOfWordsArray{
                //    tempArrayOfInts.append(Int(word)!)
                //    print(tempArrayOfInts)
                //}
                
                if values.count == 0 {
                    print("Thing is too small!")
                    //print(tempStringOfIngredints)
                } else {
                    item.ingsAsIntArray = values
                    let setOfRecipeIngredients = Set(item.ingsAsIntArray)
                    if setOfRecipeIngredients.isSubset(of: setOfOwnedIngredients){
                        //print("Found matching recipe!")
                        //print(setOfOwnedIngredients)
                        //print(setOfRecipeIngredients)
                        //print(item.hashName)
                        itemInfo.add(item)
                    } else {
                        //print("not found!")
                    }
                }

                //item.ingsAsString = String(describing: resultSet.string(forColumn: "ingredients"))
                //item.ingsAsIntArray = values
                //print(item.ingsAsIntArray)
                
                //let setOfRecipeIngredients = Set(item.ingsAsIntArray)
                //print(setOfRecipeIngredients)
                //print(setOfOwnedIngredients)
                //if setOfRecipeIngredients.isSubset(of: setOfOwnedIngredients){
                    //print("Found matching recipe!")
                    //print(setOfOwnedIngredients)
                    //print(setOfRecipeIngredients)
                    //print(item.hashName)
                    //itemInfo.add(item)
                //}
                //else {
                    //print("Not found!")
                //}
                
                //print(item.ingsAsIntArray)
                
                //itemInfo.add(item)
            }
            
            print("size of db is")
            print(iterator)
        }
        sharedInstance.database!.close()
        print("length of found recipes is")
        print(itemInfo.count)
        return itemInfo
    }
}

