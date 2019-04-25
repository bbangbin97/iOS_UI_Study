//
//  ProfileModel.swift
//  UIStudy
//
//  Created by 정영빈 on 16/04/2019.
//  Copyright © 2019 정영빈. All rights reserved.
//

import Foundation
import UIKit

class ProfileModel {
    
    let profileImage : UIImage
    let profileName : String
    let profileBirth: String
    
    init() {
        profileImage = UIImage(named: "imageforTest")!
        profileName = "정영빈 (남)"
        profileBirth = "양력 1997.01.21 소띠 물병자리"
    }
}
