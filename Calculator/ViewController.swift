//
//  ViewController.swift
//  Calculator
//
//  Created by csfeng on 16/7/2.
//  Copyright © 2016年 fcs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber:Bool = false
  
    @IBAction func appentDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text!+digit
        }else{
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        
        
        
        
       // print("digit = \(digit)")
    }

    var operandStack = Array<Double>()
    
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        print("operandStack is \(operandStack)")
        
    }
    
    var displayValue:Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }


}

