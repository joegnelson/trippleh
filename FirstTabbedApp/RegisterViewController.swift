//
//  RegisterViewController.swift
//  FirstTabbedApp
//
//  Created by Hailey Nelson on 9/22/18.
//  Copyright © 2018 Nelson, Joe. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
   
    @IBOutlet weak var _user: UITextField!
    @IBOutlet weak var _email: UITextField!
    @IBOutlet weak var _pass: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var _label: UILabel!
    
    //----------------------------------------------------------
    // ACTION
    //----------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self._label.text = ""
        self._user.delegate = self
        self._email.delegate = self
        self._pass.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Hide keyboard- enter
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        _user.resignFirstResponder()
        _pass.resignFirstResponder()
        return(true)
    }
    //Hide keyboard- touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func registerBtn(_ sender: Any) {
        self._label.text = "LOADING...."
        //VALIDATE INPUTS
       if (_user.text?.isEmpty)! || (_pass.text?.isEmpty)! || (_email.text?.isEmpty)!  {
            self._label.text = "UserName, Password, Email required"
            return
        }
        //CREATE REQUUEST
        let request = URL(string: "http://ccc-restrictless-login-t1.appspot.com/register?username=\(_user.text!)&pass=\(_pass.text!)&email=\(_email.text!)")!
        HomeViewController.query(obj: self,url: request,completion: completionX)
    }
    func completionX(obj:Any,data: Data?, error: Error?,_ statusCode:Int)->Void{
        if let data = data{
            let responseString = String(data: data, encoding: .utf8)
            print(responseString ?? "responseString=nil")
        }
            DispatchQueue.main.async() { () -> Void in
                if let obj = obj as? RegisterViewController{
                    do {
                        if(statusCode == 200){
                            let responseString = String(data: data!, encoding: .utf8)
                            print(responseString ?? "resonseString=nil")
//                            let jsonData=responseString?.data(using: .utf8)!
//                            print(jsonData ?? "jsonData=nil")

                            //let responseString = String(data: data!, encoding: .utf8)
                            let decoder = JSONDecoder()
                            
                            user = try decoder.decode(User.self, from: data!)
 //                           print("email:\(user?.email ?? "")")
                            obj._label.text="Registration Success"
                            self.performSegue(withIdentifier: "register", sender: self)
                        }else if(statusCode == 403){
                            obj._label.text="This UserName or Email is already registered"

                        }else if(statusCode == 403){
                            obj._label.text="This Email is already registered"
                        }else{
                            obj._label.text="Unknow Error"
                        }
                        
                    } catch {
                        //handle error
                        print(error)
                    }
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

