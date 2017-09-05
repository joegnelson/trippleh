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
    //let headDetail: String!
    let restrictions: String!
    
}

var allRecipes :[Recipe]=[]


var arrayofCellData = [
    
    
    cellData( text :	"Vegan Beet Lasagna"	, image :#imageLiteral(resourceName:	"BeetLasagna"	), imageUrl:	""	, catDetail:	"Lunch/Dinner"/*, headDetail: "Meals"*/	, restrictions:	"No Sugar Added, Vegan, Vegetarian, Dairy Free" ),
    cellData( text :	"Vegan Brownies"	, image :#imageLiteral(resourceName:	"VeganBrownies"	), imageUrl:	""	, catDetail:	"Batters"	, restrictions:	""	),
    cellData( text :	"Vegan Pancakes"	, image :#imageLiteral(resourceName:	"VeganPancakes"	), imageUrl:	""	, catDetail:	"Breakfast"	, restrictions:	""	),
    cellData( text :	"Vegan French Toast"	, image :#imageLiteral(resourceName:	"VeganFrenchToast"	), imageUrl:	""	, catDetail:	"Breakfast"	, restrictions:	""	),
    cellData( text :	"Vegan Sloppy Joes"	, image : #imageLiteral(resourceName: "VeganSloppyJoes") , imageUrl:	""	, catDetail:	"Lunch/Dinner"	, restrictions:	""	),
    cellData( text :	"Vegan Pumpkin Pie"	, image :#imageLiteral(resourceName:	"VeganPumpkinPie"	), imageUrl:	""	, catDetail:	"Pie"	, restrictions:	""	),
    //cellData( text :	"Coconut Whipped Cream"	, image :#imageLiteral(resourceName:	"CoconutWhippedCream"	), imageUrl:	""	, catDetail:	"All Desserts"	, restrictions:	""	),
    cellData( text :	"Vegan Cream of Broccoli Soup"	, image :#imageLiteral(resourceName:	"VeganCreamOfBroccoliSoup"	), imageUrl:	""	, catDetail:	"Soup"	, restrictions:	""	),
    cellData( text :	"Vegan Pad Thai"	, image :#imageLiteral(resourceName:	"VeganPadThai"	), imageUrl:	"https://www.peta.org/wp-content/uploads/2014/03/vegan-pad-thai-e1429117378854-637x320.jpg?20151027083426"	, catDetail:	"Lunch/Dinner"	, restrictions:	""	),
    cellData( text :	"Green Gazpacho"	, image :#imageLiteral(resourceName: "GreenGazpacho"), imageUrl:	""	, catDetail:	"Soup"	, restrictions:	""	),
    cellData( text :	"Vegan Double Chocolate Muffins"	, image :#imageLiteral(resourceName: "VeganDoubleChocolateMuffins"), imageUrl:	""	, catDetail:	"Batters"	, restrictions:	""	),
    cellData( text :	"Vegan No Churn Chocolate Ice Cream"	, image : #imageLiteral(resourceName: "VeganNoChurnIceCream") , imageUrl:	"https://mbkr-minimalistbaker.netdna-ssl.com/wp-content/uploads/2014/08/SUPER-Creamy-NO-CHURN-Vegan-Chocolate-Ice-Cream-Just-5-ingredients-and-NATURALLY-sweetened-with-dates1-673x1024.jpg"	, catDetail:	"Ice Cream"	, restrictions:	""	),
    cellData( text :	"Dairy Free Spinach and Artichoke Dip"	, image : #imageLiteral(resourceName: "DairyFreeSpinachArtichokeDip") , imageUrl:	"https://downshiftology.com/wp-content/uploads/2016/02/spinach-artichoke-dip-dairy-free-and-paleo-1.jpg" 	, catDetail:	"Dip"	, restrictions:	""	),
    cellData( text :	"Kale Chips"	, image :#imageLiteral(resourceName: "KaleChips"), imageUrl:	""	, catDetail:	"Chips"	, restrictions:	""	),
    cellData( text :	"Energy Balls"	, image :#imageLiteral(resourceName: "EnergyBalls"), imageUrl:	""	, catDetail:	"Bars and Balls"	, restrictions:	""	),
    cellData( text :	"Raw Almond Ricotta"	, image :#imageLiteral(resourceName: "RawAlmondRicotta"), imageUrl:	""	, catDetail:	"Sides"	, restrictions:	""	),
    cellData( text :	"Dairy Free Spinach and Artichoke Dip"	, image :#imageLiteral(resourceName: "DairyFreeSpinachArtichokeDip"), imageUrl:	"https://downshiftology.com/wp-content/uploads/2016/02/spinach-artichoke-dip-dairy-free-and-paleo-1.jpg" 	, catDetail:	"Dips"	, restrictions:	""	),
    cellData( text :	"Vegan Chocolate Ice Cream"	, image :#imageLiteral(resourceName: "VeganChocolateIceCream"), imageUrl:	""	, catDetail:	"Ice Cream"	, restrictions:	""	),
    cellData( text :	"Gluten Free Gingerbread Men"	, image :#imageLiteral(resourceName: "GlutenFreeGingerBreadMen"), imageUrl:	""	, catDetail:	"Doughs"	, restrictions:	""	),

]

class Recipe: NSObject {
    var date:String
    var recipeId:String = ""
    var recipeName:String = ""
    var recipeCategory:String = ""
    //var recipeHeader:String = ""
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
            //,"recipeHeader":recipeHeader
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
