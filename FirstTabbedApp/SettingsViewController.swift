//
//  SecondViewController.swift
//  FirstTabbedApp
//
//  Created by Nelson, Joe on 7/4/17.
//  Copyright © 2017 Nelson, Joe. All rights reserved.
//

import UIKit

var restrictionDatabase = database
var isSugarFree = false
var isGlutenFree = false
var isDairyFree = false
var isNutFree = false
var isVegetarian = false
var isVegan = false

class SettingsViewController: UIViewController {
    //Label
    @IBOutlet weak var numRecipes: UILabel!
    
    //Image Buttons:
    @IBAction func sugarFreeImageButton(_ sender: UIButton) {
        if #imageLiteral(resourceName: "SugarFreeOffNew") == sender.image (for: .normal){
            sender.setImage(#imageLiteral(resourceName: "sugarFreeOnNew"), for: .normal)
            isSugarFree = true
        }
        else {
            sender.setImage(#imageLiteral(resourceName: "SugarFreeOffNew"), for: .normal)
            isSugarFree = false
        }
        recalculateDB()
    }
    @IBAction func glutenFreeImageButton(_ sender: UIButton) {
        if #imageLiteral(resourceName: "GlutenFreeOffNew") == sender.image(for: .normal){
            sender.setImage(#imageLiteral(resourceName: "glutenFreeOnNew"), for: .normal)
            isGlutenFree = true
        }
        else {
            sender.setImage(#imageLiteral(resourceName: "GlutenFreeOffNew"), for: .normal)
            isGlutenFree = false
        }
        recalculateDB()
    }
    @IBAction func dairyFreeImageButton(_ sender: UIButton) {
        if #imageLiteral(resourceName: "DairyFreeOffNew") == sender.image(for: .normal){
            sender.setImage(#imageLiteral(resourceName: "dairyOnNew"), for: .normal)
            isDairyFree = true
        }
        else {
            sender.setImage(#imageLiteral(resourceName: "DairyFreeOffNew"), for: .normal)
            isDairyFree = false
        }
        recalculateDB()
    }
    @IBAction func nutFreeImageButton(_ sender: UIButton) {
        if #imageLiteral(resourceName: "NutFreeOffNew") == sender.image(for: .normal){
            sender.setImage(#imageLiteral(resourceName: "nutFreeOnNew"), for: .normal)
            isNutFree = true
        }
        else {
            sender.setImage(#imageLiteral(resourceName: "NutFreeOffNew"), for: .normal)
            isNutFree = false
        }
        recalculateDB()
    }
    @IBAction func vegetarianImageButton(_ sender: UIButton) {
        if #imageLiteral(resourceName: "VegetarianOffNew") == sender.image(for: .normal){
            sender.setImage(#imageLiteral(resourceName: "VegetarianOnNew"), for: .normal)
            isVegetarian = true
        }
        else {
            sender.setImage(#imageLiteral(resourceName: "VegetarianOffNew"), for: .normal)
            isVegetarian = false
        }
        recalculateDB()
    }
    @IBAction func veganImageButton(_ sender: UIButton) {
        if #imageLiteral(resourceName: "VeganNew") == sender.image(for: .normal){
            sender.setImage(#imageLiteral(resourceName: "VeganImageOnNew"), for: .normal)
            isVegan = true
        }
        else {
            sender.setImage(#imageLiteral(resourceName: "VeganNew"), for: .normal)
            isVegan = false
        }
        recalculateDB()
    }
    //---------------------------
    
    //Restrtiction Database:
    static func addAllToRDB() {
        for item in database {
                restrictionDatabase.append(item)
        }
    }
    static func addToRDB(selection: String) {
        //Traversing through database and adding to categoryDatabasefor item in database
        // var count=0
        for item in database {
            if(item.restrictions.contains(selection)){
                restrictionDatabase.append(item)
            }
        }
    }
    static func removeFromRDB(selection: String){
        var i = 0
        for item in restrictionDatabase {
            if(!item.restrictions.contains(selection)){
                restrictionDatabase.remove(at: i)
            }
            else{
                i = i + 1
            }
        }
    }
    func recalculateDB() {
        SettingsViewController.recalculateDBStatic()
        if restrictionDatabase.count==1 {
             numRecipes.text = String("There is \(restrictionDatabase.count) recipe available.")
        }
        else {
             numRecipes.text = String("There are \(restrictionDatabase.count) recipes available.")
        }

    }
    static func recalculateDBStatic() {
        var foundRestriction = false
        restrictionDatabase.removeAll()
        if (isSugarFree){
            if (!foundRestriction){
                addToRDB(selection: "Sugar Free")
            }
            foundRestriction = true
        }
        if (isGlutenFree){
            if (!foundRestriction){
                addToRDB(selection: "Gluten Free")
            }
            else{
                removeFromRDB(selection: "Gluten Free")
            }
            foundRestriction = true
        }
        if (isDairyFree){
            if (!foundRestriction){
                addToRDB(selection: "Dairy Free")
            }
            else{
                removeFromRDB(selection: "Dairy Free")
            }
            foundRestriction = true
        }
        if (isNutFree){
            if (!foundRestriction){
                addToRDB(selection: "Nut Free")
            }
            else{
                removeFromRDB(selection: "Nut Free")
            }
            foundRestriction = true
        }
        if (isVegetarian){
            if (!foundRestriction){
                addToRDB(selection: "Vegetarian")
            }
            else{
                removeFromRDB(selection: "Vegetarian")
            }
            foundRestriction = true
        }
        if (isVegan){
            if (!foundRestriction){
                addToRDB(selection: "Vegan")
            }
            else{
                removeFromRDB(selection: "Vegan")
            }
            foundRestriction = true
        }
        if(!foundRestriction){
            addAllToRDB();
        }
       
//        for item in restrictionDatabase {
//            print("Number of Recpes: ", item.title)
//        }
     }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        recalculateDB();
        // Do any additional setup after loading the view, typically from a nib.
        
        //Vegan Image **BUTTON**
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

