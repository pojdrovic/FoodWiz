//
//  Util.swift
//  FoodWiz
//
//  Created by Petar Ojdrovic on 6/27/17.
//  Copyright © 2017 Petar Ojdrovic. All rights reserved.
//

import Foundation
import UIKit

class Util: NSObject {
    
    class func getPath(fileName: String) -> String {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent(fileName)
        print(fileURL)
        return fileURL.path
    }
    
    class func copyFile(fileName: NSString) {
        let dbPath: String = getPath(fileName: fileName as String)
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: dbPath) {
            let documentsURL = Bundle.main.resourceURL
            let fromPath = documentsURL!.appendingPathComponent(fileName as String)
            print(fromPath)
            var error : NSError?
            do {
                try fileManager.copyItem(atPath: fromPath.path, toPath: dbPath)
            } catch let error1 as NSError {
                error = error1
            }
            
            let alert: UIAlertView = UIAlertView()
            if(error != nil) {
                alert.title = "Error Occured"
                alert.message = error?.localizedDescription
            } else {
                alert.title = "Successful copy!"
                alert.message = "Your Database copied successfuly."
            }
            alert.delegate = nil
            alert.addButton(withTitle: "OK")
        }
        else {
            print("something")
        }
    }
}
