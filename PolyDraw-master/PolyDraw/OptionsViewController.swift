//
//  OptionsViewController.swift
//  PolyDraw
//
//  Created by student on 2017-04-21.
//  Copyright © 2017 Chris Chadillon. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {
    @IBOutlet weak var lineColorButton: UIButton!
    @IBOutlet weak var fillColorButton: UIButton!
    @IBOutlet weak var lineWidthSlider: UISlider!
    @IBOutlet weak var fillSwitch: UISwitch!
    @IBOutlet weak var thePreview: PreviewView!
    
    var parentView: DrawingViewController!
    var theOptionsSoFar: Options!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.lineWidthSlider.value = Float(self.parentView.drawingView.theOptions.lineWidth)
        self.lineColorButton.backgroundColor = self.parentView.drawingView.theOptions.lineColor
        self.fillSwitch.isOn = self.parentView.drawingView.theOptions.fill
        self.fillColorButton.backgroundColor = self.parentView.drawingView.theOptions.fillColor
        
        self.lineWidthSlider.addTarget(self, action: #selector(self.optionsChanged), for: .valueChanged)
        self.fillSwitch.addTarget(self, action: #selector(self.optionsChanged), for: .valueChanged)
        
        self.theOptionsSoFar = self.parentView.drawingView.theOptions
        self.thePreview.theOptions = self.theOptionsSoFar
        self.thePreview.display()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ColorPickerViewController
        destination.parentController = self
        
        if segue.identifier == "showColorPickerLineColor" {
            destination.colorButton = self.lineColorButton
        }
        if segue.identifier == "showColorPickerFillColor" {
            destination.colorButton = self.fillColorButton
        }
    }
    
    @IBAction func saveOptions(_ sender: UIButton) {
        self.parentView.drawingView.theOptions = self.theOptionsSoFar
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func optionsChanged() {
        self.theOptionsSoFar.lineWidth = Double(self.lineWidthSlider.value)
        self.theOptionsSoFar.lineColor = self.lineColorButton.backgroundColor!
        self.theOptionsSoFar.fill = self.fillSwitch.isOn
        self.theOptionsSoFar.fillColor = self.fillColorButton.backgroundColor!
        self.thePreview.theOptions = self.theOptionsSoFar
        self.thePreview.display()
    }
}
