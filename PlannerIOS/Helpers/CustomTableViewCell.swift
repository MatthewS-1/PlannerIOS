//
//  CustomTableViewCell.swift
//  PlannerIOS
//
//  Created by Matthew Song on 4/9/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var subtext: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
