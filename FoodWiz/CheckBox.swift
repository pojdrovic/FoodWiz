//
//  CheckBox.swift
//  FoodWiz
//
//  Created by Petar Ojdrovic on 5/17/17.
//  Copyright © 2017 Petar Ojdrovic. All rights reserved.
//

import UIKit

class CheckBox: UIButton {
    
    // Images
    //let uncheckImage = UIImage(named:)
    let uncheckedImage = #imageLiteral(resourceName: "User-Interface-Unchecked-Checkbox-icon")
    let checkedImage = #imageLiteral(resourceName: "User-Interface-Checked-Checkbox-icon")
    
    // Boolean properties
    var isChecked:Bool = false{
        didSet{
            if isChecked == true{
                self.setImage(checkedImage, for: .normal)
            } else{
                self.setImage(uncheckedImage, for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: "buttonClicked", for: UIControlEvents.touchUpInside)
        self.isChecked = false
    }
    
    func buttonClicked(sender:UIButton){
        if(sender == self){
            if isChecked == true{
                isChecked = false
            }else{
                isChecked = true
            }
        }
    }
    

}
