//
//  SecondViewController.swift
//  FirstTabbedApp
//
//  Created by Nelson, Joe on 7/4/17.
//  Copyright © 2017 Nelson, Joe. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //Switches for Restictions
    
    //Outlet- talks to view by using outlet
    //Action- view pass on messages about view to ViewController by using action; updates a label
    @IBOutlet weak var sugFswitch: UISwitch!
    @IBOutlet weak var gluFswitch: UISwitch!
    @IBOutlet weak var veganSwitch: UISwitch!
    @IBOutlet weak var vegetSwitch: UISwitch!
    @IBOutlet weak var nutFswitch: UISwitch!
    @IBOutlet weak var dairyFswitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

