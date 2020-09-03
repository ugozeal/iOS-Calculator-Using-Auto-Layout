//
//  CircularButton.swift
//  SwiftCalculator
//
//  Created by David U. Okonkwo on 8/31/20.
//  Copyright © 2020 Decagon HQ. All rights reserved.
//

import UIKit

@IBDesignable
class CircularButton: UIButton {
    
    @IBInspectable var circularButton:Bool = false{
        didSet{
            if circularButton{
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if circularButton{
            layer.cornerRadius = frame.height / 2
        }
    }

  

}
