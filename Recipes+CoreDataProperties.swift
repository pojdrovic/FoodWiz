//
//  Recipes+CoreDataProperties.swift
//  FoodWiz
//
//  Created by Petar Ojdrovic on 6/15/17.
//  Copyright © 2017 Petar Ojdrovic. All rights reserved.
//

import Foundation
import CoreData


extension Recipes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipes> {
        return NSFetchRequest<Recipes>(entityName: "Recipes")
    }

    @NSManaged public var title: String
    @NSManaged public var instructions: [String]
    @NSManaged public var hashedTitle: Int
    @NSManaged public var ingredientsAsMetadata: [Int]
    @NSManaged public var dietaryRestriction: Int
    @NSManaged public var fileName: String
    @NSManaged public var recipeMetaData: [String]
    @NSManaged public var recipeDescription: String
    @NSManaged public var allIngredientsAsArray: [String]
    @NSManaged public var allIngredientsAsDictionary: [String: [String]]

}
