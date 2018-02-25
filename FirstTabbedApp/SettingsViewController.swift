//
//  SecondViewController.swift
//  FirstTabbedApp
//
//  Created by Nelson, Joe on 7/4/17.
//  Copyright © 2017 Nelson, Joe. All rights reserved.
//

import UIKit

var restrictionDatabase = [cellData]()
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
        if #imageLiteral(resourceName: "NoSugarImage") == sender.image(for: .normal){
            sender.setImage(#imageLiteral(resourceName: "second"), for: .normal)
            isSugarFree = true
            print("Sugar Free: " , isSugarFree)
        }
        else {
            sender.setImage(#imageLiteral(resourceName: "NoSugarImage"), for: .normal)
            isSugarFree = false
            print("Sugar Free: " , isSugarFree)
        }
        recalculateDB()
    }
    @IBAction func glutenFreeImageButton(_ sender: UIButton) {
        if #imageLiteral(resourceName: "glutenFreeImage") == sender.image(for: .normal){
            sender.setImage(#imageLiteral(resourceName: "second"), for: .normal)
            isGlutenFree = true
            print("Gluten Free: " , isGlutenFree)
        }
        else {
            sender.setImage(#imageLiteral(resourceName: "glutenFreeImage"), for: .normal)
            isGlutenFree = false
            print("Gluten Free: " , isGlutenFree)
        }
        recalculateDB()
    }
    @IBAction func dairyFreeImageButton(_ sender: UIButton) {
        if #imageLiteral(resourceName: "dairyFreeImage") == sender.image(for: .normal){
            sender.setImage(#imageLiteral(resourceName: "second"), for: .normal)
            isDairyFree = true
            print("Dairy Free: " , isDairyFree)
        }
        else {
            sender.setImage(#imageLiteral(resourceName: "dairyFreeImage"), for: .normal)
            isDairyFree = false
            print("Dairy Free: " , isDairyFree)
        }
        recalculateDB()
    }
    @IBAction func nutFreeImageButton(_ sender: UIButton) {
        if #imageLiteral(resourceName: "nutFreeImage") == sender.image(for: .normal){
            sender.setImage(#imageLiteral(resourceName: "second"), for: .normal)
            isNutFree = true
            print("Nut Free: " , isNutFree)
        }
        else {
            sender.setImage(#imageLiteral(resourceName: "nutFreeImage"), for: .normal)
            isNutFree = false
            print("Nut Free: " , isNutFree)
        }
        recalculateDB()
    }
    @IBAction func vegetarianImageButton(_ sender: UIButton) {
        if #imageLiteral(resourceName: "vegetarianImage") == sender.image(for: .normal){
            sender.setImage(#imageLiteral(resourceName: "second"), for: .normal)
            isVegetarian = true
            print("Vegetarian: " , isVegetarian)
        }
        else {
            sender.setImage(#imageLiteral(resourceName: "vegetarianImage"), for: .normal)
            isVegetarian = false
            print("Vegetarian: " , isVegetarian)
        }
        recalculateDB()
    }
    @IBAction func veganImageButton(_ sender: UIButton) {
        if #imageLiteral(resourceName: "veganImage") == sender.image(for: .normal){
            sender.setImage(#imageLiteral(resourceName: "second"), for: .normal)
            isVegan = true
            print("Vegan: " , isVegan)
        }
        else {
            sender.setImage(#imageLiteral(resourceName: "veganImage"), for: .normal)
            isVegan = false
            print("Vegan: " , isVegan)
        }
        recalculateDB()
    }
    //---------------------------
    
    //Restrtiction Database:
    func addToRDB(selection: String) {
        //Traversing through database and adding to categoryDatabasefor item in database
        // var count=0
        print("-----")
        print(selection)
        for item in database {
            if(item.restrictions.contains(selection)){
                restrictionDatabase.append(item)
            }
        }
    }
    func removeFromRDB(selection: String){
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
        var foundRestriction = false
        restrictionDatabase.removeAll()
        if (isSugarFree){
            if (!foundRestriction){
                addToRDB(selection: "Sugar Free")
            }
            else{
                removeFromRDB(selection: "Sugar Free")
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
        numRecipes.text = String(restrictionDatabase.count)
        for item in restrictionDatabase {
            print(item.text)
        }
     }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Vegan Image **BUTTON**
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

