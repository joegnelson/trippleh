//
//  Recipe.swift
//  FirstTabbedApp
//
//  Created by Nelson, Joe on 9/3/17.
//  Copyright © 2017 Nelson, Joe. All rights reserved.
//

import UIKit


struct cellData {
    let cell: Int!
    let text: String!
    let imageUrl: String!
    let image: UIImage!
}

var allRecipes :[Recipe]=[]

var arrayofCellData = [cellData(cell : 1, text : "Vegan Beet Lasagna",imageUrl:"https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/HTTPS_Everywhere_icon.svg/1200px-HTTPS_Everywhere_icon.svg.png", image : #imageLiteral(resourceName: "BeetLasagna")),
                       cellData(cell : 1, text : "Vegan Brownies",imageUrl:"https://www.apple.com/euro/ios/ios8/a/generic/images/og.png", image : #imageLiteral(resourceName: "VeganBrownies")),
                       cellData(cell : 1, text : "Vegan Eggplant Parmesean",imageUrl:"http://www.seriouseats.com/images/2015/07/20150728-homemade-whopper-food-lab-35.jpg", image : #imageLiteral(resourceName: "VeganEggplantParm"))]

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
