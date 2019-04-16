//
//  LineView.swift
//  UIStudy
//
//  Created by 정영빈 on 17/04/2019.
//  Copyright © 2019 정영빈. All rights reserved.
//

import Foundation
import UIKit

class LineView : UIView {
    
    private let xibName = "LineView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func lineInit(){
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        draw(CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
    }
    
    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        
        aPath.move(to: CGPoint(x:0, y:0))
        
        aPath.addLine(to: CGPoint(x:self.bounds.width, y:0))
        aPath.lineWidth = 2
        
        //Keep using the method addLineToPoint until you get to the one where about to close the path
        
        aPath.close()
        
        //If you want to stroke it with a red color
        UIColor(rgb: 0x008366).set()
        aPath.stroke()
        //If you want to fill it as well
        aPath.fill()
    }
}
