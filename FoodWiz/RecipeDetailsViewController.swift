//
//  RecipeDetailsViewController.swift
//  FoodWiz
//
//  Created by Petar Ojdrovic on 7/5/17.
//  Copyright © 2017 Petar Ojdrovic. All rights reserved.
//

import UIKit

class RecipeDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionlabel: UILabel!
    @IBOutlet var ingsTableView: UITableView!
    @IBOutlet var instrTableView: UITableView!
    
    var dbMan = DBManager()
    
    var currentRecipe = recipe_info()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var selectedRecipeHash = UserDefaults.standard.object(forKey: "selectedRecipe") as! Int
        print("inside the new view controller!")
        
        currentRecipe = DBManager.getInstance().getRecipeFromHash(hashName: selectedRecipeHash)
        titleLabel.text = currentRecipe.recipeTitle
        descriptionlabel.text = currentRecipe.recipeDescription

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("inside CellForRow!")
        var cell:UITableViewCell?
        
        //var currTableView = tableView
        
        if tableView == self.ingsTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "ingCell", for: indexPath)
            cell?.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            cell!.textLabel!.text = currentRecipe.allIngredients[indexPath.row]
        }
        
        if tableView == self.instrTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "instrCell", for: indexPath)
            cell!.textLabel!.text = currentRecipe.instructions[indexPath.row]
        }
        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("calling numberOfRowsInSection!")
        
        var count:Int?
        
        if tableView == self.ingsTableView {
            count = currentRecipe.allIngredients.count
        }
        
        if tableView == self.instrTableView {
            count = currentRecipe.instructions.count
        }
        
        return count!
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
