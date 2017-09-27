/*
 * Name: Abhinav Sharma
 * Date: September 26, 2017
 * StudentID: 300975677
 * Description: Intermediate User Interaction Demo
 * Version: 0.4 - Added Partial Functionality
 */
import UIKit

class ViewController: UIViewController {

   //OUTLET ========
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //VARIABLES ======
    var reset = false
    var firstNumber = ""
    var secondNumber = ""
    var op = ""
    var hasOp = false
    var revAddition = ""

    
    //Function Controlling all the number and operation buttons
    @IBAction func controlButton(_ sender: UIButton) {
        
        //If Result Label has a 0 and User wants to enter the no. then Number should appear
        if resultLabel.text=="0" || (hasOp && secondNumber == ""){
        
        resultLabel.text = ""
        
        }
      
        let text = sender.titleLabel?.text
        
        resultLabel.text = resultLabel.text! + text!

    //Switch case to decide whether user has entered a number, operation or equals.
    if let inputText = text{
    switch inputText{
    case "+","÷","X","-":
        
        //If user presses a operation button then 0 should appear
        if firstNumber == "" {
            resultLabel.text = "0"
        }
            //If First number, operation and second number are taken as input then "Calculate" function should be performed.
        else{
            if firstNumber != "" && hasOp && secondNumber != "" {
                resultLabel.text = String (calculate())
                firstNumber = resultLabel.text!
                secondNumber = ""
                
            }
        revAddition = firstNumber
        hasOp = true
        op = inputText
        resultLabel.text = firstNumber
        }
    case "=":
        //If user presses a operation button then 0 should appear
        if firstNumber == ""  {
            resultLabel.text = "0"
        }
            //If User entered only First number and operation button then First Number should appear
        else if secondNumber == "" && firstNumber != "" && hasOp == false{
                resultLabel.text = firstNumber
        }
            //If user enter First Number and press operation button , then Calculation should be performed only on First Number
        else{
            if secondNumber == "" && firstNumber != "" && hasOp == true {
                secondNumber = revAddition
            }
            resultLabel.text = String (calculate())
            firstNumber = resultLabel.text!
            secondNumber = ""
        }
    /*case "%":
 
        if firstNumber == ""  {
            resultLabel.text = "0"
        }
        else {
        let number = Double(resultLabel.text!)
        let numberDivideby100 = number!/100
        resultLabel.text = String(numberDivideby100)
        }*/
    default:
        //Storing Second Number
        if hasOp{
            secondNumber = secondNumber + inputText
            
        }
            
            //Storing First Number
        else{
            firstNumber = firstNumber  + inputText
        }
       }

        
    }

}
    //Clear everything when operation is performed
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
    
    //Function to calculate the two numbers
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




