//
//  Options.swift
//  PolyDraw
//
//  Created by student on 2017-04-28.
//  Copyright © 2017 Chris Chadillon. All rights reserved.
//

import Foundation
import UIKit

struct Options {
    var lineWidth:Double
    var lineColor:UIColor
    var fill:Bool
    var fillColor:UIColor
    
    init(lineWidth:Double, lineColor:UIColor, fill:Bool, fillColor:UIColor) {
        self.lineWidth = lineWidth
        self.lineColor = lineColor
        self.fill = fill
        self.fillColor = fillColor
    }
}
