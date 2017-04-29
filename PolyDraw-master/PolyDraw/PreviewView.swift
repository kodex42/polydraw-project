//
//  PreviewView.swift
//  PolyDraw
//
//  Created by student on 2017-04-28.
//  Copyright © 2017 Chris Chadillon. All rights reserved.
//

import UIKit

class PreviewView: UIView {
    var theOptions: Options!
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let possibleContext = UIGraphicsGetCurrentContext()
        if let theContext = possibleContext {
            let width = self.bounds.width - 50
            let height = self.bounds.height - 50
            let rectangle = Rect(X: 25, Y: 25, options: self.theOptions, theHeight: Double(height), theWidth: Double(width))
            rectangle.draw(theContext)
        }
    }
    
    func display() {
        self.setNeedsDisplay()
    }
}
