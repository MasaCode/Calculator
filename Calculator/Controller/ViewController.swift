//
//  ViewController.swift
//  Calculator
//
//  Created by Masashi Morita on 2019/10/15.
//  Copyright © 2019 Masashi Morita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    private var calculator = CalculatorLogic()
    
    private var isFinishedTypingNumber = true
    private var displayValue : Double {
        get{
            guard let value = Double(displayLabel.text!) else { fatalError("Invalid number is entered, \(displayLabel.text!)") }
            return value
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        guard let calcMethod = sender.currentTitle else { fatalError("Could not get calculation title") }
        guard let result = calculator.calculate(symbol: calcMethod) else{
            fatalError("The result of calculation is nil")
        }
        displayValue = result
    }

    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    if floor(displayValue) != displayValue {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}
