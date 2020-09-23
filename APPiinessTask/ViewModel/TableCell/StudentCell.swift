//
//  StudentCell.swift
//  APPiinessTask
//
//  Created by admin on 9/23/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {
    
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblDob: UILabel!
    
    
    static let identifier = "StudentCell"
    static let nib = UINib(nibName: "StudentCell", bundle: nil)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
