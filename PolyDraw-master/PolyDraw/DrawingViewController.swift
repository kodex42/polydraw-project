//
//  ViewController.swift
//  PolyDraw
//
//  Created by Chris Chadillon on 2017-03-02.
//  Copyright © 2017 Chris Chadillon. All rights reserved.
//

import UIKit

class DrawingViewController: UIViewController {
    @IBOutlet weak var undoButton: UIButton!

    @IBAction func shapeChosen(_ sender: UISegmentedControl) {
        self.drawingView.shapeType = sender.selectedSegmentIndex
    }
    
    @IBAction func undoLastDraw(_ sender: UIButton) {
        self.drawingView.undoLast()
    }
    
    @IBOutlet weak var drawingView: DrawingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        drawingView.theOptions = Options(lineWidth: 1.0, lineColor: UIColor.black, fill: false, fillColor: UIColor.black)
        
        undoButton.isEnabled = false
        self.drawingView.undoButton = self.undoButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! OptionsViewController
        destination.parentView = self
    }
}

