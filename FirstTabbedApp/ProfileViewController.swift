//
//  ProfileViewController.swift
//  FirstTabbedApp
//
//  Created by Hailey Nelson on 8/31/18.
//  Copyright © 2018 Nelson, Joe. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var recipeBttn: UIButton!
    @IBOutlet weak var logLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let email = user?.email{
            logLabel.text = "rd.size:\(restrictionDatabase.capacity) | \(email)"
        }else{
            logLabel.text = "\(restrictionDatabase.capacity)"

        }
        // Do any additional setup after loading the view.
    }

    @IBAction func recipeTouchUpInside(_ sender: Any) {
        logLabel.text = "\(restrictionDatabase.capacity)"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
