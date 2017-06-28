//
//  HashIngs+CoreDataProperties.swift
//  FoodWiz
//
//  Created by Petar Ojdrovic on 6/15/17.
//  Copyright © 2017 Petar Ojdrovic. All rights reserved.
//

import Foundation
import CoreData


extension HashIngs {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HashIngs> {
        return NSFetchRequest<HashIngs>(entityName: "HashIngs")
    }

    @NSManaged public var hashName: Int
    @NSManaged public var ingredients: [Int]

}
