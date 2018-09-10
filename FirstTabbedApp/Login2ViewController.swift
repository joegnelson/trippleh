//
//  Login2ViewController.swift
//  FirstTabbedApp
//
//  Created by Hailey Nelson on 8/30/18.
//  Copyright © 2018 Nelson, Joe. All rights reserved.
//

import UIKit

var gloUser = ""
var gloPass = ""

let usersAndPass = ["hailey": "hailey1", "joe": "joe1", "mari": "mari1"]

class Login2ViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var _user: UITextField!
    @IBOutlet weak var _pass: UITextField!
    @IBOutlet weak var _btn: UIButton!
    @IBOutlet weak var _label: UILabel!
    

    
    //Button Action
    @IBAction func _btnAction2(_ sender: Any) {
        if (_user.text! != "" && _pass.text != ""){
            let dictionaryPass = usersAndPass[_user.text!]
            
            if dictionaryPass != nil {
                print("Dictionary Password: \(dictionaryPass!)")
                
                if(_pass.text == dictionaryPass){
                    print("Same, same")
                    
                    gloUser = _user.text!
                    gloPass = _pass.text!
                    
                    //Segue
                    performSegue(withIdentifier: "welcome", sender: self)
                }
                else{
                    _label.text = "Try Again"
                    print("Correct Username")
                    print("Wrong Password. Try Again.")
                }
            }
            else{
                _label.text = "Try Again"
                print("Wrong Username. Try Again.")
            }
            
            print(gloUser)
            print(gloPass)
        }
    }
    
    @IBAction func _btnAction(_ sender: Any) {
        //Create request
        print(_user.text!)
        print(_pass.text!)
        let request2 = URLRequest(url: URL(string: "http://ccc-restrictless-login-t1.appspot.com/login?username=\(_user.text!)&pass=\(_pass.text!)")!)
        //Create task
        let task = URLSession.shared.dataTask(with: request2) { data, response, error in guard (data != nil), error == nil else {
            print("error = \(String(describing: error))")
            return
            }
            let responseString = self.processLoginResponse(data: data, response: response)
            
            // ???
            DispatchQueue.main.async {
                if(responseString == nil){
                    print("LOGIN FAILED 2!")
                    self._label.text = "Try Again 2"
                } else{
                    print(responseString ?? "Logical Error")
                }
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self._user.delegate = self
        self._pass.delegate = self
        
        //LOADING SCREEN
        //showLoadingScreen()
        
        //URL stuff
        //Create login request
        let request = URLRequest(url: URL(string: "http://ccc-restrictless-login-t1.appspot.com/login?username=hailey1&pass=hailey1")!)
        //Create login API task
        let task = URLSession.shared.dataTask(with: request) { data, response, error in guard let data2 = data, error == nil else {
                print("error = \(String(describing: error))")
                return
            }
            let responseString = self.processLoginResponse(data: data, response: response)
            
            // ???
            DispatchQueue.main.async {
                if(responseString == nil){
                    print("LOGIN FAILED!")
                } else{
                    print(responseString ?? "Logical Error")
                }
            }
        }
        //Execute login API request
        task.resume()
    }
    func processLoginResponse(data: Data?, response: URLResponse?)-> String?{
        //var loginSuccess = false;
        //Check response code from login request AND set login success flag accordingly
        if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
            print("statusCode should be 200, but is \(httpStatus.statusCode)")
            
            print(response ?? "response is nil")
            return nil
        }
        
        //Get response
        let responseString = String(data: data!, encoding: .utf8)
        return responseString!
    }
    
    //Splash Screen
    /**
     func showLoadingScreen (){
     loadingView.bounds.size.width = view.bounds.width - 25
     loadingView.bounds.size.height = view.bounds.height - 40
     loadingView.center = view.center
     view.addSubview(loadingView)
     } */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Hide keyboard- touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Hide keyboard- enter
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        _user.resignFirstResponder()
        _pass.resignFirstResponder()
        return(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
