//
//  HSBColorPickerViewController.swift
//  PolyDraw
//
//  Created by student on 2017-04-21.
//  Copyright © 2017 Chris Chadillon. All rights reserved.
//

import Foundation
import UIKit

class ColorPickerViewController : UIViewController {
    var parentController: OptionsViewController!
    var colorButton: UIButton!
    var newColor: UIColor!
    @IBOutlet weak var colorToChangeTo: UIImageView!
    @IBOutlet weak var redColorSlider: UISlider!
    @IBOutlet weak var greenColorSlider: UISlider!
    @IBOutlet weak var blueColorSlider: UISlider!
    @IBOutlet weak var alphaColorSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setColor()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeColor(_ sender: UISlider?) {
        let red = redColorSlider.value
        let green = greenColorSlider.value
        let blue = blueColorSlider.value
        let alpha = alphaColorSlider.value
        
        self.newColor = UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: alpha)
        self.colorToChangeTo.image = self.getImageWithColor(color: self.newColor!, size: CGSize(width: 1, height: 1))
    }
    
    @IBAction func saveTheColor(_ sender: UIButton) {
        self.colorButton?.backgroundColor = newColor
        self.parentController.optionsChanged()
        self.finishTheModal(sender)
    }
    
    @IBAction func finishTheModal(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    func setColor() {
        let color = self.colorButton?.backgroundColor
        self.newColor = color
        self.colorToChangeTo.image = getImageWithColor(color: newColor, size: CGSize(width: 1, height: 1))
        self.redColorSlider.value = Float((color?.redValue)!)
        self.greenColorSlider.value = Float((color?.greenValue)!)
        self.blueColorSlider.value = Float((color?.blueValue)!)
        self.alphaColorSlider.value = Float((color?.alphaValue)!)
    }
}

extension UIColor {
    var redValue: CGFloat{ return CIColor(color: self).red }
    var greenValue: CGFloat{ return CIColor(color: self).green }
    var blueValue: CGFloat{ return CIColor(color: self).blue }
    var alphaValue: CGFloat{ return CIColor(color: self).alpha }
}
