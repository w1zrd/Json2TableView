//
//  TableViewCell.swift
//  TheActors
//
//  Created by Михалев Александр on 05/04/2018.
//  Copyright © 2018 RP Team. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var CellImage: UIImageView!
    @IBOutlet weak var CellLbl1: UILabel!
    @IBOutlet weak var CellLbl2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
