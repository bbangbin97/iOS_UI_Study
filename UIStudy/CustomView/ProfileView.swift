//
//  ProfileView.swift
//  UIStudy
//
//  Created by 정영빈 on 16/04/2019.
//  Copyright © 2019 정영빈. All rights reserved.
//

import Foundation
import UIKit

class ProfileView : UIView {
    
    
    @IBOutlet weak var profileMainView: UIView!
    @IBOutlet weak var profileBirthLabel: UILabel!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    private let xibName = "ProfileView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        profileInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        profileInit()
    }
    
    private func profileInit() {
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        
        profileMainView.layer.borderWidth = 1
        profileMainView.layer.borderColor = UIColor.lightGray.cgColor
        view.frame = self.bounds
    
        addSubview(view)
    }
}
