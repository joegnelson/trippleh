//
//  Recipe.swift
//  FirstTabbedApp
//
//  Created by Nelson, Joe on 9/3/17.
//  Copyright © 2017 Nelson, Joe. All rights reserved.
//

import UIKit


struct cellData2 {
    let text: String!
    let image: UIImage!
    let imageUrl: String!
    let catDetail: String!
    
}

var allRecipes :[Recipe]=[]


var arrayofCellData = [
    
    
    cellData2( text :	"Vegan Beet Lasagna"	, image :#imageLiteral(resourceName:	"BeetLasagna"	), imageUrl:	"https://www.apple.com/euro/ios/ios8/a/generic/images/og.png"	, catDetail:	"Lunch/Dinner"	),
    cellData2( text :	"Vegan Brownies"	, image :#imageLiteral(resourceName:	"VeganBrownies"	), imageUrl:	""	, catDetail:	"Batters"	),
    cellData2( text :	"Vegan Pancakes"	, image :#imageLiteral(resourceName: "VeganPancakes"), imageUrl:	""	, catDetail:	"Breakfast"	),
    cellData2( text :	"Vegan Pumpkin Pie"	, image :#imageLiteral(resourceName: "VeganPumpkinPie"), imageUrl:	""	, catDetail:	"Pie"	),
    cellData2( text :	"Vegan Cream Of Broccoli Soup"	, image :#imageLiteral(resourceName: "VeganCreamOfBroccoliSoup"), imageUrl:	""	, catDetail:	"Soup"	),
    cellData2( text :	"Kale Chips"	, image :#imageLiteral(resourceName: "KaleChips"), imageUrl:	""	, catDetail:	"Chips"	),
    cellData2( text :	"Energy Balls"	, image :#imageLiteral(resourceName: "EnergyBalls"), imageUrl:	""	, catDetail:	"Bars and Balls"	),
    cellData2( text :	"Raw Almond Ricotta"	, image :#imageLiteral(resourceName: "RawAlmondRicotta"), imageUrl:	""	, catDetail:	"Sides"	),
    cellData2( text :	"Dairy Free Spinach and Artichoke Dip"	, image :#imageLiteral(resourceName: "DairyFreeSpinachArtichokeDip"), imageUrl:	"https://downshiftology.com/wp-content/uploads/2016/02/spinach-artichoke-dip-dairy-free-and-paleo-1.jpg" 	, catDetail:	"Dips"	),
    cellData2( text :	"Vegan Chocolate Ice Cream"	, image :#imageLiteral(resourceName: "VeganChocolateIceCream"), imageUrl:	""	, catDetail:	"Ice Cream"	),
    cellData2( text :	"Gluten Free Gingerbread Men"	, image :#imageLiteral(resourceName: "GlutenFreeGingerBreadMen"), imageUrl:	""	, catDetail:	"Doughs"	),
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
