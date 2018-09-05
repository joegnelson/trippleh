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
    @IBAction func _btnAction(_ sender: Any) {
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
    
    func joeMethod(data: String, name: String){
        print(data)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self._user.delegate = self
        self._pass.delegate = self
        
        //LOADING SCREEN
        //showLoadingScreen()
        
        //URL stuff
        let request = URLRequest(url: URL(string: "http:/ccc-restrictless-login-t1.appspot.com/demo")!)
        let task = URLSession.shared.dataTask(with: request) { dataX, response, error in guard let data2 = dataX, error == nil else {
            print("error = \(String(describing: error))")
            return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print(response)
            }
            
            let responseString = String(data: data2, encoding: .utf8)
            self.joeMethod(data: responseString!, name: "joe")
            DispatchQueue.main.async {
                print(responseString!)
            }
        }
        
        task.resume()
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
