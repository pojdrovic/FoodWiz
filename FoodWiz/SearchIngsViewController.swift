//
//  SearchIngsViewController.swift
//  FoodWiz
//
//  Created by Petar Ojdrovic on 5/17/17.
//  Copyright © 2017 Petar Ojdrovic. All rights reserved.
//

import UIKit

class SearchIngsViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    // Field for the input of text
    @IBOutlet weak var textField: UITextField!
    // Field for the table view
    @IBOutlet weak var tableView: UITableView!
    
    var autoCompletePossibilities: [String] = ["Wand", "Wizzard", "Test"]
    var autoComplete: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Function to search for substrings of larger strings.
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
        
        return true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        let index = indexPath.row as Int
        cell.textLabel!.text = autoComplete[index]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autoComplete.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("inside the did select row functioN!")
        
        let selectedCell: UITableViewCell = tableView.cellForRow(at: indexPath)!
        
        textField.text = selectedCell.textLabel!.text!
        print(textField.text!)
        
        
    }
    
    func addToArrayFromString(string: String){
        
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
