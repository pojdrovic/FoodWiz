//
//  CustonTableViewCell.swift
//  FoodWiz
//
//  Created by Petar Ojdrovic on 5/17/17.
//  Copyright © 2017 Petar Ojdrovic. All rights reserved.
//

import UIKit

class CustonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
