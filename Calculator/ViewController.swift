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

    //链接运算符
    @IBAction func operate(sender: UIButton) {
        let opertion = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber{
             enter()
        }
        switch opertion {
        case "×": perfermOpertion {$0 * $1}
        case "÷": perfermOpertion {$0 / $1}
        case "+": perfermOpertion {$0 + $1}
        case "−": perfermOpertion {$0 - $1}
        default:break
        }
    }
    
    func perfermOpertion(opertion:(Double,Double) -> Double){
        if operandStack.count >= 2 {
            displayValue = opertion(operandStack.removeLast(),operandStack.removeLast())
            enter()
        }
    }
}

