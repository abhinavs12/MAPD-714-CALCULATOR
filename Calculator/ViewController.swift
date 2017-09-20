//
//  ViewController.swift
//  Calculator
//
//  Created by Student on 2017-09-16.
//  Copyright © 2017 Centennial College. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func controlButton(_ sender: UIButton) {
        
        result.tx=sender.titleLabel!.text! + "button"
        
        
        
    }
    
    @IBOutlet weak var result: UIView!

}

