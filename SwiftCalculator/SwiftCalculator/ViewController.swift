//
//  ViewController.swift
//  SwiftCalculator
//
//  Created by David U. Okonkwo on 8/31/20.
//  Copyright © 2020 Decagon HQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Operations:String {
        case Add = "+"
        case Divide = "/"
        case Subtract = "-"
        case Multiply = "*"
        case Nill = "null"
        case Percentage = "%"
    }
    
    var runningNumber = ""
    var valueOnTheLeft = ""
    var valueOnTheRight = ""
    var result = ""
    var currentOperation:Operations = .Nill

    @IBOutlet var outputLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLabel.text = "0"
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
    }

    @IBAction func buttonNumberPressed(_ sender: UIButton) {
        if runningNumber.count <= 8{
            runningNumber += "\(sender.tag)"
            outputLabel.text = runningNumber
        }
    }
    
    @IBAction func allClear(_ sender: UIButton) {
        runningNumber = ""
        valueOnTheLeft = ""
        valueOnTheRight = ""
        result = ""
        currentOperation = .Nill
        outputLabel.text = "0"
    }
    @IBAction func plusOrMinus(_ sender: Any) {
    }
    @IBAction func percentageButton(_ sender: UIButton) {
        operation(operand: .Percentage)
    }
    @IBAction func divideButton(_ sender: UIButton) {
        operation(operand: .Divide)
    }
    
    @IBAction func multiplicationButton(_ sender: UIButton) {
        operation(operand: .Multiply)
    }
    @IBAction func minuButton(_ sender: UIButton) {
        operation(operand: .Subtract)
    }
    @IBAction func plusButton(_ sender: UIButton) {
        operation(operand: .Add)
    }
    
    @IBAction func equalsButton(_ sender: UIButton) {
        operation(operand: currentOperation)
    }
    @IBAction func decimalPointButton(_ sender: UIButton) {
        if runningNumber.count <= 7{
            runningNumber += "."
            outputLabel.text = runningNumber
        }
    }
    
    func operation (operand:Operations){
        if currentOperation != .Nill{
            if runningNumber != ""{
                valueOnTheRight = runningNumber
                runningNumber = ""
                if currentOperation == .Add{
                    result = "\(Double(valueOnTheLeft)! + Double(valueOnTheRight)!)"
                }else if currentOperation == .Divide{
                    result = "\(Double(valueOnTheLeft)! / Double(valueOnTheRight)!)"
                }else if currentOperation == .Multiply{
                    result = "\(Double(valueOnTheLeft)! * Double(valueOnTheRight)!)"
                }else if currentOperation == .Subtract {
                    result = "\(Double(valueOnTheLeft)! - Double(valueOnTheRight)!)"
                }else if currentOperation == .Percentage {
                    result = "\(Double(valueOnTheLeft)! / Double(100))"
                }
                valueOnTheLeft = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                    result = "\(Int(Double(result)!))"
                }
                outputLabel.text = result
            }
            currentOperation = operand
        }else {
            valueOnTheLeft = runningNumber
            runningNumber = ""
            currentOperation = operand
        }
    }
}

