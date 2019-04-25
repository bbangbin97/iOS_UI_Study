//
//  ImageExtention.swift
//  UIStudy
//
//  Created by 정영빈 on 16/04/2019.
//  Copyright © 2019 정영빈. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func toCircleImage() {
        
        self.layer.cornerRadius = self.frame.size.width / 2.0
        
    }
    
    func makeShadow() {
        
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.25
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0, height: 0.5)
    }
    
}
