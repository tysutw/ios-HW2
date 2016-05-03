//
//  oneLineTableViewCell.swift
//  hw2
//
//  Created by TsungYen Su on 5/3/16.
//  Copyright © 2016 TsungYen Su. All rights reserved.
//

import UIKit

class oneLineTableViewCell: UITableViewCell {

    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var firstLineNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
