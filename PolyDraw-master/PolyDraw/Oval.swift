//
//  Oval.swift
//  PolyDraw
//
//  Created by Chris Chadillon on 2017-03-02.
//  Copyright © 2017 Chris Chadillon. All rights reserved.
//

import UIKit

class Oval:Shape {
    var theHeight:Double
    var theWidth:Double
    
    init(X:Double, Y:Double, options:Options, theHeight:Double, theWidth:Double) {
        self.theHeight = theHeight
        self.theWidth = theWidth
        super.init(X: X, Y: Y, options: options)
    }
    
    override func draw(_ theContext: CGContext) {
        let rect = CGRect(x: self.X, y: self.Y, width: self.theWidth, height: self.theHeight)
        theContext.addEllipse(in: rect)
        theContext.setLineWidth(CGFloat(self.options.lineWidth))
        theContext.setStrokeColor(self.options.lineColor.cgColor)
        theContext.strokePath()
        if self.options.fill {
            theContext.setFillColor(self.options.fillColor.cgColor)
            theContext.fillEllipse(in: rect)
        }
    }
}










