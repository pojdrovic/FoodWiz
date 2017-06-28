//
//  ProfileViewController.swift
//  FoodWiz
//
//  Created by Petar Ojdrovic on 5/11/17.
//  Copyright © 2017 Petar Ojdrovic. All rights reserved.
//

import UIKit
import CoreData


class ProfileViewController: UIViewController {
    
    var managedObjectContext:NSManagedObjectContext!
    var hashIngsLoaded = [HashIngs]()

    @IBAction func buttonPressed(_ sender: Any) {
        //populateHashIngsTest1()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        print("about to get to LoadData!")
        //loadData()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func populateHashIngsTest1(){
        let hashIngsItem = HashIngs(context: managedObjectContext)
        hashIngsItem.hashName = 1234456
        hashIngsItem.ingredients = [123, 234, 345, 456, 567, 678, 789]
        do {
            try self.managedObjectContext.save()
        } catch{
            print("could not save data! \(error.localizedDescription)")
        }
        
    }
    
    func loadData(){
        let hashIngsRequest:NSFetchRequest<HashIngs> = HashIngs.fetchRequest()
        do {
            hashIngsLoaded = try managedObjectContext.fetch(hashIngsRequest)
        } catch {
            print("could not load data from database \(error.localizedDescription)")
        }
        
        for element in hashIngsLoaded{
            print(element.hashName)
            print(element.ingredients)
        }
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
