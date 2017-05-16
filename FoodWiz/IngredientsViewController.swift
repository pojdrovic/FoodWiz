//
//  IngredientsViewController.swift
//  FoodWiz
//
//  Created by Petar Ojdrovic on 5/16/17.
//  Copyright © 2017 Petar Ojdrovic. All rights reserved.
//

import UIKit

class IngredientsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var availableIngredients: [String] = ["Apples", "Bread", "cheese", "wheat", "flour", "food", "crumbs", "water", "olive oil", "canola oil", "garlic", "onions", "Yummy"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Will return number of rows in the table view.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(availableIngredients.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create a cell
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "ingCell")
        // Populate the text label of that cell with the text in the availableIngredients list
        cell.textLabel?.text = availableIngredients[indexPath.row]
        
        return(cell)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
