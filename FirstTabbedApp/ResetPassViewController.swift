//
//  ResetPassViewController.swift
//  FirstTabbedApp
//
//  Created by Hailey Nelson on 10/1/18.
//  Copyright © 2018 Nelson, Joe. All rights reserved.
//

import UIKit

var fourDigitCode: String!

class ResetPassViewController: UIViewController {

    @IBOutlet weak var digit1: UITextField!
    @IBOutlet weak var digit2: UITextField!
    @IBOutlet weak var digit3: UITextField!
    @IBOutlet weak var digit4: UITextField!
    @IBOutlet weak var _email: UITextField!
    @IBOutlet weak var _pass: UITextField!
    @IBOutlet weak var _label: UILabel!
    
    
    @IBAction func resetButtonAct(_ sender: Any) {
        
        fourDigitCode = digit1.text! + digit2.text! + digit3.text! + digit4.text!
        
        print(fourDigitCode!)
        
        if (digit1.text!.isEmpty || digit2.text!.isEmpty || digit3.text!.isEmpty || digit4.text!.isEmpty) {
            _label.text = "Check email for security code."
        }
        else {
            //Segue
            performSegue(withIdentifier: "resetPasswordComplete", sender: self)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Segue
        //performSegue(withIdentifier: "resetPass", sender: self)
    }
    
}
