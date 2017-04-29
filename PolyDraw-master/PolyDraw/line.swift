//
//  line.swift
//  PolyDraw
//
//  Created by student on 2017-04-21.
//  Copyright © 2017 Chris Chadillon. All rights reserved.
//

import UIKit

class Line:Shape {
    var xDisplacement: Double
    var yDisplacement: Double
    
    init(X: Double, Y: Double, options:Options, xDisplacement: Double, yDisplacement: Double) {
        self.xDisplacement = xDisplacement
        self.yDisplacement = yDisplacement
        super.init(X: X, Y: Y, options: options)
    }
    
    override func draw(_ theContext: CGContext) {
        let start = CGPoint(x: self.X, y: self.Y)
        let end = CGPoint(x: self.xDisplacement, y: self.yDisplacement)
        theContext.move(to: start)
        theContext.addLine(to: end)
        theContext.setLineWidth(CGFloat(self.options.lineWidth))
        theContext.setStrokeColor(self.options.lineColor.cgColor)
        theContext.strokePath()
    }   
}
