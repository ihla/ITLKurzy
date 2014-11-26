//
//  CourseTableViewCell.swift
//  ITLKurzy
//
//  Created by Lubos Ilcik on 11/13/14.
//  Copyright (c) 2014 Lubos Ilcik. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell {

    
    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var courseDescription: UILabel!
    @IBOutlet weak var coursePrice: UILabel!
    @IBOutlet weak var courseDiscount: UILabel!
    @IBOutlet weak var courseDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
