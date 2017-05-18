//
//  SearchViewController.swift
//  FoodWiz
//
//  Created by Petar Ojdrovic on 5/17/17.
//  Copyright © 2017 Petar Ojdrovic. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    var autoCompletePossibilities: [String] = ["wizzard", "wand"]
    var autoComplete: [String] = []
    var ownedIngredients: [String] = []
    var selectedIngredients: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.allowsMultipleSelection = true
        self.textField.layer.cornerRadius = 3
        
        textField.delegate = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchAutocompleteEntriesWithSubstring(_ substring: String) {
        autoComplete.removeAll(keepingCapacity: false)
        
        for key in autoCompletePossibilities {
            
            let myString:NSString! = key as NSString
            
            if(myString.range(of: substring).location != NSNotFound){
                autoComplete.append(key)
            }
        }
        
        tableView.reloadData()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let substring = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        searchAutocompleteEntriesWithSubstring(substring)
        
        return true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustonTableViewCell
        
        let index = indexPath.row as Int
        cell.titleLabel!.text = autoComplete[index]
        cell.shareButton.tag = indexPath.row
        //print(cell.shareButton.tag)
        //print("done")
        cell.shareButton.addTarget(self, action: #selector(self.logActions(sender: )), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autoComplete.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let selectedCell: CustonTableViewCell = tableView.cellForRow(at: indexPath)! as! CustonTableViewCell
        //let tempText = selectedCell.titleLabel!.text!

        
        //if self.selectedIngredients.contains(tempText){
        //    self.selectedIngredients.remove(at: self.selectedIngredients.index(of: tempText)!)
        //} else{
        //    self.selectedIngredients.append(tempText)
        //}
        
        //if self.selectedIngredients.contains(indexPath.row){
        //    self.selectedIngredients.remove(at: self.selectedIngredients.index(of: indexPath.row))
        //}
        
        let selectedCell: CustonTableViewCell = tableView.cellForRow(at: indexPath)! as! CustonTableViewCell
        
        let tempText = selectedCell.titleLabel!.text!
        selectedIngredients.append(tempText)
        print(selectedIngredients)
        
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let deselectedCell: CustonTableViewCell = tableView.cellForRow(at: indexPath)! as! CustonTableViewCell
        let tempText = deselectedCell.titleLabel!.text
        selectedIngredients.remove(at: self.selectedIngredients.index(of: tempText!)!)
       // print(selectedIngredients)
        
    }
    
    
    @IBAction func logActions(sender: UIButton){
        //print("inside the log actions function!")
        print(sender.tag)
        let title = autoComplete[sender.tag]
        print(title)
        ownedIngredients.append(title)
        // Now need to go back to previous view
        //print(ownedIngredients)
        tableView.reloadData()
        
    }
    
    
    // Reacts to when the add highlighted button is tapped.
    // Adds all selected items from the list of available ingredients to the list of owned ingredients
    @IBAction func addButtonTapped(_ sender: Any) {
        
        for key in selectedIngredients{
            let tempString:NSString! = key as NSString
            ownedIngredients.append(tempString as (String))
        }
        
        //ownedIngredients.append(selectedIngredients)
        print("add button tapped!")
        print(ownedIngredients)
    }
    @IBAction func addHighlightedTapped(sender: UIButton){
        
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
