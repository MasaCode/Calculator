//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Masashi Morita on 2019/10/19.
//  Copyright © 2019 Masashi Morita. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number : Double?
    private var intermediateCalculation : (n1 : Double, method: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n / 100.0
            case "+":
                intermediateCalculation = (n1: n, method: symbol)
            case "=":
                return perform2NumCalculation(n2: n)
            default:
                return nil
            }
        }
        return nil
    }
    
    private func perform2NumCalculation(n2 : Double) -> Double {
        if let n1 = intermediateCalculation?.n1, let method = intermediateCalculation?.method {
            
        }
        return n2
    }
}
