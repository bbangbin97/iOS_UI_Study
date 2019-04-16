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
    
}
