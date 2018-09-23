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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        RegisterViewController.query(obj: self,url: request,completion: completionX)
    }
    func completionX(obj:Any,data: Data?, error: Error?)->Void{
        guard let data = data, error == nil else { return }
        let responseString = String(data: data, encoding: .utf8)
        print(responseString ?? "responseString=nil")
        DispatchQueue.main.async() { () -> Void in
            if let obj = obj as? RegisterViewController{
                do {
                    let decoder = JSONDecoder()
                    user = try decoder.decode(User.self, from: data)
                    print("email:\(user?.email ?? "")")
                    obj._label.text="Registration Success"
                } catch {
                    //handle error
                    print(error)
                }

            }
        }
        
    }

    static func query(obj:Any,url: URL, completion: @escaping (_ obj:Any, _ data: Data?, _ error: Error? ) -> Void) {
        HomeViewController.getDataFromUrl(url: url) { data, response, error in
            if let error = error {
                completion(obj, nil, error)
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print(response ?? "response is nil")
                return
            }

            
            if let data = data {
                completion(obj, data, nil)
            } else {
                completion(obj, nil, nil)
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

}
