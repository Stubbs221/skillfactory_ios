//
//  CalculatorLogic.swift
//  17.7 Calculator
//
//  Created by user205749 on 2/20/22.
//

import Foundation

protocol SessionProtocol {
    
    var firstNumber: Double { get set }
    var secondNumber: Double { get set }
    var binaryOperator: BinaryOperation? { get set }
    var unaryOperator: UnaryOperation? { get set }
    var isDotPressed: Bool { get set }
    var isFirstNumberSet: Bool { get set }
    var calculator: CalculatorProtocol { get set }
    
    
}

protocol CalculatorProtocol {
    func calculateBinary(calcOperator: BinaryOperation,a firstNum: Double,b secondNum: Double) -> String
    func calculateUnary(calcOperator: UnaryOperation, a number: Double) -> String
}



enum BinaryOperation{
    case add, subtract, multiply, divide
}

enum UnaryOperation{
    case percentage, negative
}

class CurrentSession: SessionProtocol {
    
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var binaryOperator: BinaryOperation?
    var unaryOperator: UnaryOperation?
    var isDotPressed: Bool = false
    var isFirstNumberSet: Bool = false
    var calculator: CalculatorProtocol = Calculator()
    
}

struct Calculator: CalculatorProtocol{
    func calculateUnary(calcOperator: UnaryOperation, a number: Double) -> String {
        var result: Double = 0.0
        switch calcOperator {
        case .percentage:
            result = number / 100
        case .negative:
            result = -number
        }
        print(result)
        if abs(result.truncatingRemainder(dividingBy: Double(Int(result))))  > 0.0 || abs(result) < 1 {
            return String(result)
        } else {
            return String(Int(result))
        }
    }
    
    func calculateBinary(calcOperator: BinaryOperation, a firstNum: Double, b secondNum: Double) -> String {
        var result: Double = 0.0
        switch calcOperator {
        case .divide:
            result = firstNum / secondNum
        case .multiply:
            result = firstNum * secondNum
        case .subtract:
            result = firstNum - secondNum
        case .add:
            result = firstNum + secondNum
        default:
            break
        }
        
        if abs(result.truncatingRemainder(dividingBy: Double(Int(result))))  > 0.0 || abs(result) < 1 {
            return String(result)
        } else {
            return String(Int(result))
        }
        
    }
        
                
            
}
