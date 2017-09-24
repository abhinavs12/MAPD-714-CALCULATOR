/*
 * Name: Abhinav Sharma
 * Date: September 24, 2017
 * StudentID: 300975677
 * Description: Intermediate User Interaction Demo
 * Version: 0.3 - Added Basic Functionality
 */
import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var reset = false
    var firstNumber = ""
    var secondNumber = ""
    var op = ""
    var hasOp = false

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func controlButton(_ sender: UIButton) {
          
        if resultLabel.text=="0" || (hasOp && secondNumber == ""){
        
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
        else{
        hasOp = true
        op = inputText
        resultLabel.text = firstNumber
        }
    case "=":
        if firstNumber == ""  {
            resultLabel.text = "0"
        }
        else if secondNumber == "" && firstNumber != ""{
                resultLabel.text = firstNumber
        }
        else{
       resultLabel.text = String (calculate())
             hasOp = false
            firstNumber = resultLabel.text!
            secondNumber = ""
        }
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
        
        if sender.isTouchInside && reset {
            firstNumber = ""
            secondNumber = ""
            hasOp = false
            resultLabel.text = "0"
            reset = false
        }
        else if sender.isTouchInside && hasOp{
            secondNumber = ""
            resultLabel.text = "0"
        }
        else if sender.isTouchInside{
                firstNumber = ""
                resultLabel.text = "0"
        }
    }
    
    func calculate() -> Double {
        
      
        let firstNumberfinal = Double(firstNumber)!
        let secondNumberfinal = Double(secondNumber)!
        
        
        switch op {
        case "+":
            reset = true
            return firstNumberfinal + secondNumberfinal
            
        case "-":
            reset = true
            return firstNumberfinal-secondNumberfinal
            
        case "X":
            reset = true
            return firstNumberfinal*secondNumberfinal
            
        case "÷":
            reset = true
            return firstNumberfinal/secondNumberfinal
        
        default:
            return 0
        }
        
        
    
    
}
}




