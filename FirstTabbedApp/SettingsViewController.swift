//
//  SecondViewController.swift
//  FirstTabbedApp
//
//  Created by Nelson, Joe on 7/4/17.
//  Copyright © 2017 Nelson, Joe. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    //Outlet- talks to view by using outlet
    //Action- view pass on messages about view to ViewController by using action; updates a label
    
    //Switches:
    @IBAction func noSugarSwitch(_ sender: UISwitch) {
        if (sender.isOn == false){
            noSugarFilter = false
        }
        else {
            noSugarFilter = true
        }
    }
    @IBAction func noGlutenSwitch(_ sender: UISwitch) {
    }
    @IBAction func veganSwitch(_ sender: UISwitch) {
    }
    @IBAction func vegetarianSwitch(_ sender: UISwitch) {
    }
    @IBAction func noNutSwitch(_ sender: UISwitch) {
    }
    @IBAction func noDairySwitch(_ sender: UISwitch) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

