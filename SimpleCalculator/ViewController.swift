//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by 박종훈 on 2017. 1. 21..
//  Copyright © 2017년 박종훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UILabel!
    
    enum function: String {
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "×"
        case equel = "="
    }

    var storingOperand: function = .equel
    var storingValue = 0.0
    
    var isFirst: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textField.text = "0"
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let text = sender.currentTitle {
            switch text {
            case "+":
                storingValue = calculate(oldValue: storingValue, function: storingOperand, newValue: Double(textField.text!)!)
                textField.text = String(storingValue)
                storingOperand = .plus
                isFirst = false
            case "-":
                storingValue = calculate(oldValue: storingValue, function: storingOperand, newValue: Double(textField.text!)!)
                textField.text = String(storingValue)
                storingOperand = .minus
                isFirst = false
            case "×":
                storingValue = calculate(oldValue: storingValue, function: storingOperand, newValue: Double(textField.text!)!)
                textField.text = String(storingValue)
                storingOperand = .multiply
                isFirst = false
            case function.divide.rawValue:
                storingValue = calculate(oldValue: storingValue, function: storingOperand, newValue: Double(textField.text!)!)
                textField.text = String(storingValue)
                storingOperand = .divide
                isFirst = false
            case function.equel.rawValue:
                storingValue = calculate(oldValue: storingValue, function: storingOperand, newValue: Double(textField.text!)!)
                textField.text = String(storingValue)
                storingOperand = .equel
                isFirst = false
            case "C":
                textField.text = "0"
            case "AC":
                textField.text = "0"
                storingValue = 0.0
                storingOperand = .equel
                isFirst = true
            case "←":
                let index =  textField.text?.index((textField.text?.endIndex)!, offsetBy: -1)
                textField.text = textField.text?.substring(to: index!)
                if textField.text == "" {
                    textField.text = "0"
                }
            case "00", "0":
                if textField.text != "0" {
                    textField.text = textField.text! + text
                }
            case ".":
                if !(textField.text?.contains(text))! {
                    textField.text = textField.text! + text
                }
            default:
                if !isFirst {
                    textField.text = "0"
                }
                
                if textField.text == "0" {
                    textField.text = text
                } else {
                    textField.text = textField.text! + text
                }
                
            }
        }
    }
    
    func calculate(oldValue: Double, function: function, newValue: Double) -> Double{
        switch function {
        case .plus:
            return (oldValue + newValue)
        case .minus:
            return (oldValue - newValue)
        case .divide:
            return (oldValue / newValue)
        case .multiply:
            return (oldValue * newValue)
        case .equel:
            return newValue

        }
    }
    
}

