//
//  SecondViewController.swift
//  FirstTabbedApp
//
//  Created by Nelson, Joe on 7/4/17.
//  Copyright © 2017 Nelson, Joe. All rights reserved.
//

import UIKit

var restrictionDatabase = [cellData]()

class SettingsViewController: UIViewController {
    //Images:
    @IBOutlet weak var noSugarImageSwitch: UIImageView!
    @IBOutlet weak var glutenFreeImageSwitch: UIImageView!
    @IBOutlet weak var dairyFreeImageSwitch: UIImageView!
    @IBOutlet weak var veganImageSwitch: UIImageView!
    @IBOutlet weak var vegetarianImageSwitch: UIImageView!
    @IBOutlet weak var nutFreeImageSwitch: UIImageView!
    //___________________________
    
    //Image Button
    @IBAction func veganImageButton(_ sender: UIButton) {
        if #imageLiteral(resourceName: "veganImage") == sender.image(for: .normal){
            sender.setImage(#imageLiteral(resourceName: "NoSugarImage"), for: .normal)
        }
        else {
            sender.setImage(#imageLiteral(resourceName: "veganImage"), for: .normal)
        }
        
    }
    
    //---------------------------
    
    //Restrtiction Database:
    let restriction: [String] = ["Sugar Free", "Gluten Free", "Dairy Free", "Vegan" , "Vegetarian", "Nut Free"]
    
    
    func addToRD(selection: String) {
        //Traversing through database and adding to categoryDatabasefor item in database
        // var count=0
        print("-----")
        print(selection)
        for item in database {
            // for restriction in item.restrictions
            if(item.restrictions.contains(selection) ){
                print(item.text);
                restrictionDatabase.append(item)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Image test: (tap)
        let SugarFreeTapGesture = UITapGestureRecognizer(target: self, action: #selector(SettingsViewController.SFImageTapped(recognizer:)))
        SugarFreeTapGesture.numberOfTapsRequired = 1
        //noSugar
        noSugarImageSwitch.isUserInteractionEnabled = true
        noSugarImageSwitch.addGestureRecognizer(SugarFreeTapGesture)
        
        let GlutenFreeTapGesture = UITapGestureRecognizer(target: self, action: #selector(SettingsViewController.GFImageTapped(recognizer:)))
        GlutenFreeTapGesture.numberOfTapsRequired = 1
        //glutenFree
        glutenFreeImageSwitch.isUserInteractionEnabled = true
        glutenFreeImageSwitch.addGestureRecognizer(GlutenFreeTapGesture)
        
        let DairyFreeTapGesture = UITapGestureRecognizer(target: self, action: #selector(SettingsViewController.DFImageTapped(recognizer:)))
        DairyFreeTapGesture.numberOfTapsRequired = 1
        //dairyFree
        dairyFreeImageSwitch.isUserInteractionEnabled = true
        dairyFreeImageSwitch.addGestureRecognizer(DairyFreeTapGesture)
        
        let VeganTapGesture = UITapGestureRecognizer(target: self, action: #selector(SettingsViewController.VplusImageTapped(recognizer:)))
        VeganTapGesture.numberOfTapsRequired = 1
        //vegan
        veganImageSwitch.isUserInteractionEnabled = true
        veganImageSwitch.addGestureRecognizer(VeganTapGesture)
        
        let NutFreeTapGesture = UITapGestureRecognizer(target: self, action: #selector(SettingsViewController.NFImageTapped(recognizer:)))
        NutFreeTapGesture.numberOfTapsRequired = 1
        //nutFree
        nutFreeImageSwitch.isUserInteractionEnabled = true
        nutFreeImageSwitch.addGestureRecognizer(NutFreeTapGesture)
        
        let VegetarianTapGesture = UITapGestureRecognizer(target: self, action: #selector(SettingsViewController.VImageTapped(recognizer:)))
        VegetarianTapGesture.numberOfTapsRequired = 1
        //vegetarian
        vegetarianImageSwitch.isUserInteractionEnabled = true
        vegetarianImageSwitch.addGestureRecognizer(VegetarianTapGesture)
        
        //Vegan Image **BUTTON**
        
    }
    //Image tap function
    func SFImageTapped(recognizer: UITapGestureRecognizer) {
        print("SF Tapped")
        addToRD(selection: "No Sugar Added")
    }
    func GFImageTapped(recognizer: UITapGestureRecognizer) {
        print("GF Tapped")
        addToRD(selection: "Gluten Free")
    }
    func DFImageTapped(recognizer: UITapGestureRecognizer) {
        print("DF Tapped")
        addToRD(selection: "Dairy Free")
    }
    func VplusImageTapped(recognizer: UITapGestureRecognizer) {
        print("V+ Tapped")
        addToRD(selection: "Vegan")
    }
    func VImageTapped(recognizer: UITapGestureRecognizer) {
        print("V Tapped")
        addToRD(selection: "Vegetarian")
    }
    func NFImageTapped(recognizer: UITapGestureRecognizer) {
        print("NF Tapped")
        addToRD(selection: "Nut Free")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

