//
//  ViewController.swift
//  Calculator
//
//  Created by Student on 2017-09-16.
//  Copyright © 2017 Centennial College. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var firstNumber = ""
    var secondNumber = ""
    var op = ""
    var hasOp = false

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func controlButton(_ sender: UIButton) {
          
        if resultLabel.text=="0" || hasOp{
        
        resultLabel.text = ""
        
        }
        
        let text = sender.titleLabel?.text
        
        resultLabel.text = resultLabel.text! + text!

    
    if let inputText = text{
    switch inputText{
    case "+","÷","X","-":
        if firstNumber == "" {
            resultLabel.text = "0"
        }
        hasOp = true
        op = inputText
        resultLabel.text = firstNumber
        
    case "=":
           
       resultLabel.text = String (calculate())
      
    case "%":
        let number = Double(resultLabel.text!)
        let numberDivideby100 = number!/100
        resultLabel.text = String(numberDivideby100)
    default:
        if hasOp{
            secondNumber = secondNumber + inputText
        }else{
            firstNumber = firstNumber  + inputText
        }
       }

        
    }

}

    @IBAction func clear(_ sender: UIButton) {
        
        if sender.isTouchInside {
            resultLabel.text = "0"
        }
    }
    
    func calculate() -> Double {
        
      
        let firstNumberfinal = Double(firstNumber)!
        let secondNumberfinal = Double(secondNumber)!
        
        
        switch op {
        case "+":
            return firstNumberfinal + secondNumberfinal
            
        case "-":
            return firstNumberfinal-secondNumberfinal
            
        case "X":
            return firstNumberfinal*secondNumberfinal
            
        case "÷":
            return firstNumberfinal/secondNumberfinal
        
        default:
            return 0
        }
        
        
    
    
}
}




