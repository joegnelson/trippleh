//
//  Recipe.swift
//  FirstTabbedApp
//
//  Created by Nelson, Joe on 9/3/17.
//  Copyright © 2017 Nelson, Joe. All rights reserved.
//

import UIKit


struct cellData {
    let text: String!
    let image: UIImage!
    let imageUrl: String!
    let catDetail: String!
    
}

var allRecipes :[Recipe]=[]


var arrayofCellData = [
    
    
    cellData( text :	"Vegan Beet Lasagna"	, image :#imageLiteral(resourceName:	"BeetLasagna"	), imageUrl:	"https://www.apple.com/euro/ios/ios8/a/generic/images/og.png"	, catDetail:	"Lunch/Dinner"	),
    cellData( text :	"Vegan Brownies"	, image :#imageLiteral(resourceName:	"VeganBrownies"	), imageUrl:	""	, catDetail:	"Batters"	),
    cellData( text :	"joe Brownies2"	, image :#imageLiteral(resourceName:	"VeganBrownies"	), imageUrl:	""	, catDetail:	"Batters"	),
    
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
