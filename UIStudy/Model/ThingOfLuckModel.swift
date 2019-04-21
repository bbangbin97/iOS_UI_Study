//
//  ThingOfLuck.swift
//  UIStudy
//
//  Created by 정영빈 on 21/04/2019.
//  Copyright © 2019 정영빈. All rights reserved.
//

import Foundation
import UIKit

class ThingOfLuckModel {
    
    let unsaeColorSet =  [UIColor.init(rgb: 0x00ffff),UIColor.init(rgb: 0x7c2348),UIColor.init(rgb: 0x000080),UIColor.init(rgb: 0xff7f00),UIColor.init(rgb: 0xedacb1)].shuffled()
    let unsaeDirectionSet = ["동","서","남","북"].shuffled()
    let unsaNumSet = Array(1..<21).shuffled()
    
    let unsaeDirectionCount = Int.random(in: 1..<3)
    let unsaeColorCount = Int.random(in: 1..<4)
    let unsaeNumCount = Int.random(in: 1..<3)
    
    var unsaeNum = [Int]()
    var unsaeDirection = [String]()
    var unsaeColor = [UIColor]()
    
    init(){
        
        for i in 0..<unsaeColorCount {
            unsaeColor.append(unsaeColorSet[i])
        }
        
        for i in 0..<unsaeDirectionCount {
            unsaeDirection.append(unsaeDirectionSet[i])
        }
        
        for i in 0..<unsaeNumCount {
            unsaeNum.append(unsaNumSet[i])
        }
    
    }
}
