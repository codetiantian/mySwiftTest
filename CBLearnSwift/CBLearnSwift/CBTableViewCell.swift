//
//  CBTableViewCell.swift
//  CBLearnSwift
//
//  Created by Elaine on 15--5.
//  Copyright © 2015年 yinuo. All rights reserved.
//

import UIKit

class CBTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.myImageView.backgroundColor = UIColor.redColor()
        self.myImageView.layer.cornerRadius = 15.0
        self.myImageView.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellItemWithName(strName : String) {
        self.nameLabel.text = strName
    }
}
