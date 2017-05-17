//
//  SearchIngredientsViewController.swift
//  FoodWiz
//
//  Created by Petar Ojdrovic on 5/17/17.
//  Copyright © 2017 Petar Ojdrovic. All rights reserved.
//

import UIKit

class SearchIngredientsViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    // Temporary Data Storage
    var masterIngredientsList: [String] = ["String", "Word", "cheese", "crocs", "crap", "local", "slocum", "hescut", "cut", "vlcut", "curry", "scuda", "locut", "locust", "coronary"]
    var autoComplete: [String] = []
    var selectedIngredients: [String] = []
    
    
    
    @IBOutlet weak var searchingIngsTableView: UITableView!
    @IBOutlet weak var searchIngsTextFieldOutlet: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchIngsTextFieldOutlet.delegate = self
        searchIngsTextFieldOutlet.layer.cornerRadius = 3
        
        searchingIngsTableView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Function to search for substrings within the larger string.
    func searchAutocompleteEntriesWithSubstring(_ substring: String) {
        autoComplete.removeAll(keepingCapacity: false)
        
        for key in masterIngredientsList {
            
            let myString:NSString! = key as NSString
            
            //let substringRange :NSRange! = myString.range(of: substring)
            
            //if (substringRange.location  == 0) {
            //  autoComplete.append(key)
            //}
            
            if(myString.range(of: substring).location != NSNotFound){
                autoComplete.append(key)
                //print(autoComplete)
            }
        }
        
        searchingIngsTableView.reloadData()
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let substring = (searchIngsTextFieldOutlet.text! as NSString).replacingCharacters(in: range, with: string)
        //searchAutocompleteEntriesWithSubstring(substring)
        
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        return cell
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
