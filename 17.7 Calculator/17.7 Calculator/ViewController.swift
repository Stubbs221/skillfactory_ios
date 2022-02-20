//
//  ViewController.swift
//  17.7 Calculator
//
//  Created by user205749 on 2/14/22.
//

import UIKit

class ViewController: UIViewController {
    var session =  CurrentSession()
    
    
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        
        if result.text == "0" {
            result.text = "\(sender.tag)" }
        else if session.isFirstNumberSet {
            result.text = "\(sender.tag)"
            session.isFirstNumberSet = false
        } else if result.text == String(session.firstNumber)  {
            result.text = "\(sender.tag)"
            session.isDotPressed = false
            print(session.isDotPressed)
        } else {
        if let text = result.text {
            result.text = "\(text)\(sender.tag)"
        }
        }
        
    }
    
    
    
    @IBAction func commaPressed(_ sender: UIButton) {
        guard session.isDotPressed else {
            if let text = result.text {
                result.text = "\(text)."
            }
            session.isDotPressed = true
            return
        }
        
    }
    
    @IBAction func clearAll(_ sender: UIButton) {
        result.text = "0"
        session.isDotPressed = false
        session.firstNumber = 0
        session.secondNumber = 0
    }
    
    @IBAction func unaryOperatorPressed(_ sender: UIButton) {
        if let text = result.text, let value = Double(text) {
        switch sender.tag {
        case 0:
            session.unaryOperator = .negative
            result.text = (session.calculator.calculateUnary(calcOperator: session.unaryOperator!, a: value))
            
        case 1:
            session.unaryOperator = .percentage
            result.text = (session.calculator.calculateUnary(calcOperator: session.unaryOperator!, a: value))
            
        default: break
        }
        }
        if let text = result.text, let value = Double(text) {
                session.firstNumber = value
            }
        
    }
    @IBAction func binaryOperationPressed(_ sender: UIButton) {
        if let text = result.text, let value = Double(text), session.firstNumber == 0 {
            session.firstNumber = value
            session.isFirstNumberSet = true
            }
        
        switch sender.tag {
        case 0:
            session.binaryOperator = .divide
        case 1:
            session.binaryOperator = .multiply
        case 2:
            session.binaryOperator = .subtract
        case 3:
            session.binaryOperator = .add
        case 4:
            if let operation = session.binaryOperator {
                if let text = result.text, let value = Double(text) {
                    session.secondNumber = value
                }
                
                result.text =  session.calculator.calculateBinary(calcOperator: operation, a: session.firstNumber, b: session.secondNumber)
                if let text = result.text, let value = Double(text) {
                        session.firstNumber = value
                    
                    session.isFirstNumberSet = true
                    }
                session.secondNumber = 0.0
                
            }
        default:
            break
        }
        }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

