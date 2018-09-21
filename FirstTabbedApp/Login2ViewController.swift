//
//  Login2ViewController.swift
//  FirstTabbedApp
//
//  Created by Hailey Nelson on 8/30/18.
//  Copyright © 2018 Nelson, Joe. All rights reserved.
//

import UIKit

struct User: Codable {
    var firstName: String
    var email: String
    //var description: String?
}

var user: User?

class Login2ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var _user: UITextField!
    @IBOutlet weak var _pass: UITextField!
    @IBOutlet weak var _btn: UIButton!
    @IBOutlet weak var _label: UILabel!
    
    //----------------------------------------------------------
    // ACTION
    //----------------------------------------------------------
    func flashBG(){
        UIView.animate(withDuration: 0.7, animations: {
            self._btn.backgroundColor = UIColor.green
            
        })
    }
    func flashBtn(){
        UIButton.animate(withDuration: 0.5, animations: {
            self._btn.backgroundColor = UIColor.green
        })
    }
    func flashBtn2(){
        UIView.animate(withDuration: 1.0, delay: 1.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            
            self._label.backgroundColor = UIColor.green

        }, completion: nil)
    }
    @IBAction func _btnAction(_ sender: Any) {
        self._label.backgroundColor = UIColor.white
        self._label.text = "LOADING...."
        print(_user.text!)
        print(_pass.text!)
        
        //CREATE REQUUEST
        let request2 = URLRequest(url: URL(string: "http://ccc-restrictless-login-t1.appspot.com/login?username=\(_user.text!)&pass=\(_pass.text!)")!)
        
        //CREATE TASK
        let task = URLSession.shared.dataTask(with: request2) { data, response, error in guard (data != nil), error == nil else {
            print("error = \(String(describing: error))")
            self.flashBtn2()
            return
            }
            let responseString = self.processLoginResponse(data: data, response: response)
            
            // ???
            DispatchQueue.main.async {
                if(responseString == nil){
                    print("LOGIN FAILED 2!")
                    self._label.text = "Try Again 2"
                    self.flashBtn2()
                } else{
                    print(responseString ?? "Logical Error")
                    self.performSegue(withIdentifier: "welcome", sender: self)
                    self._label.text = ""
                }
            }
        }
        //EXECUTE TASK
        task.resume()
        _label.text = ""
    }
    
    //----------------------------------------------------------
    // OVER RIDES
    //----------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //----------------------------------------------------------
    // HELPER FUNCTIONS
    //----------------------------------------------------------
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
        
        
        //let responseString = String(data: data!, encoding: .utf8)
        //let jsonData=responseString?.data(using: .utf8)!
        do {
            let decoder = JSONDecoder()
            user = try decoder.decode(User.self, from: data!)
            print("email:\(user?.email ?? "")") // Prints "Durian"
        } catch {
            //handle error
            print(error)
        }
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
