//
//  HelperFunctions.swift
//  FoodWiz
//
//  Created by Petar Ojdrovic on 5/30/17.
//  Copyright © 2017 Petar Ojdrovic. All rights reserved.
//

import Foundation


// Function to turn the JSON file of ingredients (the dictionary of ings such as made in python)
// into the dictionary within swift

func convertJSONtoDictionary(text: String) -> [String: Any]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}

