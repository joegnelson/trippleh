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
    
    var failCount=0
    
    @IBAction func resetButtonAct(_ sender: Any) {
        
        fourDigitCode = digit1.text! + digit2.text! + digit3.text! + digit4.text!
        
        print(fourDigitCode!)
        
        if (digit1.text!.isEmpty || digit2.text!.isEmpty || digit3.text!.isEmpty || digit4.text!.isEmpty) {
            _label.text = "Check email for security code."
        }
//        else {
//            //Segue
//            performSegue(withIdentifier: "resetPasswordComplete", sender: self)
//        }
        
        
        
        //CREATE REQUUEST
        let request2 = URLRequest(url: URL(string: "\(baseDomain)/resetpassword?email=\(_email.text!)&pass=\(_pass.text!)&code=\(fourDigitCode!)")!)
        
        //CREATE TASK
        let task = URLSession.shared.dataTask(with: request2) { data, response, error in guard (data != nil), error == nil else {
            print("error = \(String(describing: error))")
            return
            }
            
            DispatchQueue.main.async {
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                    self.failCount=self.failCount+1;
                    self._label.text = "Invalid Code OR Email. \(self.failCount)"
                    return
                }
                //Segue
                self.performSegue(withIdentifier: "resetPasswordComplete", sender: self)
                self._label.text = ""
                self.failCount=0
            }
        }
        //EXECUTE TASK
        task.resume()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Segue
        //performSegue(withIdentifier: "resetPass", sender: self)
    }
    
}
