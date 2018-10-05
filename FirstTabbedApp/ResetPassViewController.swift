//
//  ResetPassViewController.swift
//  FirstTabbedApp
//
//  Created by Hailey Nelson on 10/1/18.
//  Copyright © 2018 Nelson, Joe. All rights reserved.
//

import UIKit

var fourDigitCode: String!

class ResetPassViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var digit1: UITextField!
    @IBOutlet weak var digit2: UITextField!
    @IBOutlet weak var digit3: UITextField!
    @IBOutlet weak var digit4: UITextField!
    @IBOutlet weak var _email: UITextField!
    @IBOutlet weak var _pass: UITextField!
    @IBOutlet weak var _label: UILabel!
    
    var failCount=0
    
    //Hide keyboard- touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Hide keyboard- enter
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        _email.resignFirstResponder()
        _pass.resignFirstResponder()
        digit1.resignFirstResponder()
        digit2.resignFirstResponder()
        digit3.resignFirstResponder()
        digit4.resignFirstResponder()
        return(true)
    }
    
    @IBAction func codeValueChanged(_ sender: Any) {
        let textField:UITextField = sender as! UITextField
        print(textField.text ?? "NOTHING")
    }
    
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
        //digit1.delegate = self
        //digit2.delegate = self

//        digit1.addTarget(self, action: Selector(("textFieldDidChange:")), for: UIControlEvents.editingChanged)
//        digit2.addTarget(self, action: Selector(("textFieldDidChange:")), for: UIControlEvents.editingChanged)

        //Segue
        //performSegue(withIdentifier: "resetPass", sender: self)
    }
    
    @IBAction func codeDidTouchDown(_ sender: Any) {
        let textField:UITextField = sender as! UITextField
        textField.text=""
    }
    @IBAction func editingChanged(_ sender: Any) {
        let textField:UITextField = sender as! UITextField
            switch textField{
            case digit1:
                digit2.text = ""
                digit2.becomeFirstResponder()
            case digit2:
                digit3.text = ""
                digit3.becomeFirstResponder()
            case digit3:
                digit4.text = ""
                digit4.becomeFirstResponder()
            default:
                break
            }
//        }else{
//        }
    }
    
}
