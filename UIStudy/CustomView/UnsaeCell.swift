//
//  UnsaeCell.swift
//  UIStudy
//
//  Created by 정영빈 on 18/04/2019.
//  Copyright © 2019 정영빈. All rights reserved.
//

import UIKit

class UnsaeCell: UITableViewCell {

    @IBOutlet weak var unsaeImageView: UIImageView!
    @IBOutlet weak var unsaeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
