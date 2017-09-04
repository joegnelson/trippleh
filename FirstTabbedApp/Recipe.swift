//
//  Recipe.swift
//  FirstTabbedApp
//
//  Created by Nelson, Joe on 9/3/17.
//  Copyright © 2017 Nelson, Joe. All rights reserved.
//

import UIKit


struct cellData2 {
    let cell: Int!
    let text: String!
    let image: UIImage!
    let imageUrl: String!
    
}

var allRecipes :[Recipe]=[]


var arrayofCellData = [cellData2(cell : 1, text : "Vegan Beet Lasagna", image : #imageLiteral(resourceName: "BeetLasagna"), imageUrl: ""),
                       cellData2(cell : 1, text : "Vegan Brownies", image : #imageLiteral(resourceName: "VeganBrownies"), imageUrl: ""),
                       cellData2(cell : 1, text : "Vegan Eggplant Parmesean", image : #imageLiteral(resourceName: "VeganEggplantParm"), imageUrl: ""),
                       cellData2(cell : 1, text : "Vegan Pancakes", image : #imageLiteral(resourceName: "VeganPancakes"), imageUrl: ""),
                       cellData2(cell : 1, text : "Vegan French Toast", image : #imageLiteral(resourceName: "VeganFrenchToast"), imageUrl: ""),
                       cellData2(cell : 1, text : "Vegan Pumpkin Pie", image : #imageLiteral(resourceName: "VeganPumpkinPie"), imageUrl: ""),
                       cellData2(cell : 1, text : "Vegan Pad Thai", image : #imageLiteral(resourceName: "VeganPadThai"), imageUrl: ""),
                       cellData2(cell : 1, text : "Vegan Sloppy Joes", image : #imageLiteral(resourceName: "VeganSloppyJoes-test"), imageUrl: ""),
                       cellData2(cell : 1, text : "Vegan Cream of Broccoli Soup", image : #imageLiteral(resourceName: "VeganCreamOfBroccoliSoup"), imageUrl: "https://www.apple.com/euro/ios/ios8/a/generic/images/og.png"),
                       cellData2(cell : 1, text : "Vegan Coconut Whipped Cream", image : #imageLiteral(resourceName: "CoconutWhippedCream"), imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/HTTPS_Everywhere_icon.svg/1200px-HTTPS_Everywhere_icon.svg.png"),
                       //cellData(cell : 1, text : "Vegan Beet Lasagna", image : #imageLiteral(resourceName: "BeetLasagna"), imageUrl: ""),
                       //cellData(cell : 1, text : "Vegan Beet Lasagna", image : #imageLiteral(resourceName: "BeetLasagna"), imageUrl: ""),
                       //cellData(cell : 1, text : "Vegan Beet Lasagna", image : #imageLiteral(resourceName: "BeetLasagna"), imageUrl: ""),
]

class Recipe: NSObject {
    var date:String
    var recipeId:String = ""
    var recipeName:String = ""
    var recipeCategory:String = ""
    static let keyAllRecipes="recipes"

    override init() {
        date=NSDate().description
                
        
    }
    func dictionary()-> NSDictionary{
        return [
            "date":date
            ,"recipeId":recipeId
            ,"recipeName":recipeName
            ,"recipeCategory":recipeCategory
        ]
        
    }
    class func saveRecipes(){
        var aDictionaries:[NSDictionary] = []
        for i:Int in 0 ..< allRecipes.count {
            aDictionaries.append(allRecipes[i].dictionary())
        }
        
        UserDefaults.standard.setValue(aDictionaries, forKey: keyAllRecipes)
    }
    
    class func loadNotes(){
        let defaults = UserDefaults.standard;
        
        let saveData:[NSDictionary]? = defaults.object(forKey: keyAllRecipes) as? [NSDictionary]
        
        if let data:[NSDictionary] = saveData{
           // for (var i:Int = 0; i <data.count;i++)
            for i:Int in 0 ..< data.count{
                let r:Recipe=Recipe()
                r.setValuesForKeys(data[i] as! [String : Any])
                allRecipes.append(r)
            
            }
        }
        
        
    }
}
