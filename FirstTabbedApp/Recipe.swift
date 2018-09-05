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
    let restrictions: String!
    let ingredients: String!
    let directions: String!
}

var allRecipes : [Recipe]=[]


var database = [
    
    cellData( text :    "Gluten Free Banana Peach Walnut Pancakes"    , image :#imageLiteral(resourceName:    "GlutenFreeBananaPeachWalnutPancakes"    ), imageUrl:    ""    , catDetail:    "Breakfast"    , restrictions:    "Gluten Free, Dairy Free, Vegetarian"    , ingredients:     "1 mashed banana\n2 eggs\n1 teaspoon baking powder\n1/2 teaspoon cinnamon\n1/2 Chopped walnuts\nA pinch of salt"    , directions:     ""    ),
    cellData( text :    "Vegan Pretzels "    , image :#imageLiteral(resourceName:    "VeganPretzels"    ), imageUrl:    ""    , catDetail:    "Doughs"    , restrictions:    "Dairy Free, Nut Free, Vegetarian, Vegan"    , ingredients:     "4 teaspoons active dry yeast\n1 teaspoon white sugar\n1 1/4 cups warm water (110 degrees F)\n5 cups all purpose flour\n1 1/2 teaspoon salt\n1 tablespoon vegetable oil\n1/2 cup baking soda\n4 cups hot water\nCoarse sea salt (for finising)"    , directions:     ""    ),
    cellData( text :    "Vegan Roasted Brussel Sprouts"    , image :#imageLiteral(resourceName:    "VeganRoastedBrusselSprouts"    ), imageUrl:    ""    , catDetail:    "Sides"    , restrictions:    "Sugar Free, Gluten Free, Dairy Free, Nut Free, Vegetarian, Vegan"    , ingredients:     ""    , directions:     ""    ),
    cellData( text :    "Cookie Dough Macarons"    , image :#imageLiteral(resourceName:    "CookieDoughMacarons"    ), imageUrl:    ""    , catDetail:    "Batters"    , restrictions:    "Dairy Free, Vegetarian"    , ingredients:     ""    , directions:     ""    ),
    cellData( text :    "Dairy Free Pumpkin Ravioli"    , image :#imageLiteral(resourceName:    "DFPumpkinRavioli"    ), imageUrl:    ""    , catDetail:    "Lunch/Dinner"    , restrictions:    "Dairy Free, Vegetarian, Nut Free"    , ingredients:     ""    , directions:     ""    ),
    cellData( text :    "Vegan Pretzel Monkey Bread Bites"    , image :#imageLiteral(resourceName:    "VeganPretzelMonkeyBites"    ), imageUrl:    ""    , catDetail:    "Doughs"    , restrictions:    "Dairy Free, Nut Free, Vegetarian, Vegan"    , ingredients:     "4 teaspoons active dry yeast\n1 teaspoon white sugar\n1 1/4 cups warm water (110 degrees F)\n5 cups all purpose flour\n1 1/2 teaspoon salt\n1 tablespoon vegetable oil\n3 tablespoons sugar\n2 tablespoons cinnamon"    , directions:     ""    ),
    cellData( text :    "Vegan Kale Pesto"    , image :#imageLiteral(resourceName:    "VeganKalePesto"    ), imageUrl:    ""    , catDetail:    "Dips"    , restrictions:    "Sugar Free, Gluten Free, Dairy Free, Vegetarian, Vegan"    , ingredients:     ""    , directions:     ""    ),
    cellData( text :    "Vegan Peach Hand Pies"    , image :#imageLiteral(resourceName:    "PeachHandPies"    ), imageUrl:    ""    , catDetail:    "Pie"    , restrictions:    "Dairy Free, Nut Free, Vegetarian, Vegan"    , ingredients:     ""    , directions:     ""    ),
    cellData( text :    "Vegan Sweet Potato Pasta"    , image :#imageLiteral(resourceName:    "SweetPotatoPasta"    ), imageUrl:    ""    , catDetail:    "Lunch/Dinner"    , restrictions:    "Sugar Free, Gluten Free, Dairy Free, Nut Free, Vegetarian, Vegan"    , ingredients:     "1 sweet potato\n1 tablespoon oil (cooking oil)\nSalt and pepper to taste"    , directions:     ""    ), 

 
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
    /**
    class func saveRecipes(){
        var aDictionaries:[NSDictionary] = []
        for i:Int in 0 ..< allRecipes.count {
            aDictionaries.append(allRecipes[i].dictionary())
        }
 
        UserDefaults.standard.setValue(aDictionaries, forKey: keyAllRecipes)
    }
    */
    class func loadNotes(){
        let defaults = UserDefaults.standard;
        
        let saveData:[NSDictionary]? = defaults.object(forKey: keyAllRecipes) as? [NSDictionary]
        
        if let data:[NSDictionary] = saveData{
            for i:Int in 0 ..< data.count{
                let r:Recipe=Recipe()
                r.setValuesForKeys(data[i] as! [String : Any])
                allRecipes.append(r)
            
            }
        }
    }
}

//--------------------------------------------------
//FULL RECIPES
//--------------------------------------------------
/**
 cellData( text :    "Sugar Free Vanilla Ice Cream"    , image :#imageLiteral(resourceName:    "SugarFreeVanillaIceCream"    ), imageUrl:    ""    , catDetail:    "Ice Cream"    , restrictions:    ""    , ingredients:     "1 cup whole milk\n3/4 cup sugar substitute (ex. splenda)\n1 pinch kosher salt\n2 cups heavy cream\n1-2 teaspoons vanilla extract"    ),
 cellData( text :    "Vegan Pad Thai"    , image :#imageLiteral(resourceName:    "VeganPadThai"    ), imageUrl:    "https://www.peta.org/wp-content/uploads/2014/03/vegan-pad-thai-e1429117378854-637x320.jpg?20151027083426"    , catDetail:    "Lunch/Dinner"    , restrictions:    ""    , ingredients:     "1 cup water, plus more for soaking the noodles\nOne 10oz. package rice noodles or ramen style noodles\n2 tablespoons olive oil\n2 cloves garlic\n6 oz. extra-firm tofu, drained and cut into chunks\n4 tablespoons soy sauce\n 2 tablespoons peanutbutter\nJuice of 2 limes\n3 tablespoons sugar\nSriracha, to taste\nSliced green onions, for garnish\nChopped peanuts, for garnish (optional)"),
 cellData( text :    "Vegan Brownies"    , image :#imageLiteral(resourceName:    "VeganBrownies"    ), imageUrl:    ""    , catDetail:    "Batters"    , restrictions:    ""    , ingredients: "2 cups unbleached all-purpose flour\n2 cups white sugar\n3/4 cup unsweetened cocoa powder\n1 teaspoon baking powder\n1 teaspoon salt\n1 cup water\n1 cup vegetable oil\n1 teaspoon vanilla extract"),
 cellData( text :    "Green Gazpacho"    , image :#imageLiteral(resourceName: "GreenGazpacho"), imageUrl:    ""    , catDetail:    "Soup"    , restrictions:    ""    , ingredients: "1 english cucumber\n1 yellow bell pepper\n3 yellow tomatoes\n1/4 small, sweet white onion\n1 ripe avocado\n1 cup vegetable stock\n1 teaspoon fresh lime juice\n3/4 cup fresh cilatro\n1 clove garlic\n1 thai chili\n1 teaspoon salt"),
 cellData( text :    "Vegan French Toast"    , image :#imageLiteral(resourceName:    "VeganFrenchToast"    ), imageUrl:    ""    , catDetail:    "Breakfast"    , restrictions:    ""    , ingredients: "1 1/4 cups unseetened almond milk\n1/2 cup soy yogurt\n2 tablespoons cornstarch\n2 tablespoons vegan sugar\n1 teaspoon ground cinnamon\n1 teaspoon pure vanilla extract\n4 tablespoons melted coconut oil\nSlightly stale vegan bread of your choice, thicker slices are better \nWarm pure maple sytup, for serving"),
 cellData( text :    "Vegan Pumpkin Pie"    , image :#imageLiteral(resourceName:    "VeganPumpkinPie"    ), imageUrl:    ""    , catDetail:    "Pie"    , restrictions:    ""    , ingredients: "1 1/2 cups all-purpose flour, plus more for rolling\n1 tablespoon vegan grandulated sugar\n1t tablespoon white vinegar\nfine salt\n1/2 cup refined virgin or extra-virgin coconut oil\n4 to 6 tablespoons ice water\n\nFilling:\nOne 15-ounce can pure pumpkin puree\n8 ounces silken tofu\n2/3 cup vegan grandulated sugar\n2 table spoons cornstarch\n1 teaspoon groun cinnamon\n1/2 teaspoon grated nutmeg\n1/2 teaspoon pure vanilla extract"),
 cellData( text :    "Raw Almond Ricotta"    , image :#imageLiteral(resourceName: "RawAlmondRicotta"), imageUrl:    ""    , catDetail:    "Sides"    , restrictions:    ""    , ingredients: "1/3 cup filtered water, plus more (if needed)\n1 1/2 cups blanched slivered almonds, soaked\n2 tablespoons fresh lemon juice, to tase\n1 tablespoon nutritional yeast, to taste\n1/2 teaspoon sea salt, to taste"),
 cellData( text :    "Dairy Free Spinach and Artichoke Dip"    , image : #imageLiteral(resourceName: "DairyFreeSpinachArtichokeDip") , imageUrl:    "https://downshiftology.com/wp-content/uploads/2016/02/spinach-artichoke-dip-dairy-free-and-paleo-1.jpg"     , catDetail:    "Dip"    , restrictions:    ""    , ingredients: "1 cup raw cashews, soaked\n1 1/4 cups of vegan mayonnaise\n 1/4 cup water\n16 ounces frozen spinach, thawed and drained\nOne 13.5 ounce can artichoke hearts, drained and chopped\n1/3 cup onions, finely chopped\n4 garlic clovves, minced\n1/2 teaspoon salt\n1/2 teaspoon pepper"),
 cellData( text :    "Kale Chips"    , image :#imageLiteral(resourceName: "KaleChips"), imageUrl:    ""    , catDetail:    "Chips"    , restrictions:    ""    , ingredients: "1 head kale, washed ad thouroughly dried\n2 tablespoons olive oil\nSea salt, for sprinkling"),
 cellData( text :    "Chocolate Energy Balls"    , image : #imageLiteral(resourceName: "ChocolateEnergyBalls") , imageUrl:    ""    , catDetail:    "Bars and Balls"    , restrictions:    ""    , ingredients: "3/4 cup rolled oats\n1/2 cup peanut butter\n cup honey\n1/3 cup cocoa powder\n1/3 cup shredded coconut\n1/4 cup wheat germ\n2 teaaspoons vanilla extract\n1 pinch cinnamon "),
 cellData( text :    "Gluten Free Gingerbread Men"    , image :#imageLiteral(resourceName: "GlutenFreeGingerBreadMen"), imageUrl:    ""    , catDetail:    "Doughs"    , restrictions:    ""    , ingredients: "2 cups white rice flour\n1 cup tapioca flour (tapioca starch)\n1/2 cup buckwheat flour\n1 teaspoon baking soda\n1/2 teaspoon xantan gum\n2 teaspoons ground ginger\n1/2 teaspoon ground ginger\n1/2 teaspoon pumpkin spice\n1/2 teaspoon table salt\n1/2 cup (1 stick) unsalted butter, softened\n 2/3 cup dark brown sugar, packed\n 1 large egg, lightly beathen\n1/2 cup blackstrap molasses\n1 1/2 teaspoons gluten-free vanilla extract\nRoyal icing, for decorating\nCadies, nuts and sprinkles, for decorating"),
 cellData( text :    "Vegan No Churn Chocolate Ice Cream"    , image : #imageLiteral(resourceName: "VeganNoChurnIceCream") , imageUrl:    "https://mbkr-minimalistbaker.netdna-ssl.com/wp-content/uploads/2014/08/SUPER-Creamy-NO-CHURN-Vegan-Chocolate-Ice-Cream-Just-5-ingredients-and-NATURALLY-sweetened-with-dates1-673x1024.jpg"    , catDetail:    "Ice Cream"    , restrictions:    ""    , ingredients: "2 14-ounce cans coconut cream OR ful- fat coconut milk, chilled overnight in the fridge (I like Trader Joe's coconut cream, or Thai Kitchen coconut milk)\n2/3 cup unsweetened cocoa or cacao powder powder\n14-16 ounces pitted dates (if not sticky and moist, soak in warm water for 10 minutes then drain)\n1 tsp pure vanilla extract\n1/2 cup unsweetened almond milk"),
 //--------------------------------------------------
 //ALL RECIPES
 //--------------------------------------------------
 /**
 
 cellData( text :    "Vegan Chocolate Ice Craem"    , image : #imageLiteral(resourceName: "VeganChocolateIceCream") , imageUrl:    ""    , catDetail:    "Ice Cream"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Vegan Sloppy Joes"    , image :#imageLiteral(resourceName:    "VeganSloppyJoes"    ), imageUrl:    ""    , catDetail:    "Lunch/Dinner"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Coconut Whipped Cream"    , image :#imageLiteral(resourceName:    "CoconutWhippedCream"    ), imageUrl:    ""    , catDetail:    "All Desserts"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Vegan Cream Of Broccoli Soup"    , image :#imageLiteral(resourceName:    "VeganCreamOfBroccoliSoup"    ), imageUrl:    ""    , catDetail:    "Soup"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Vegetable Patties"    , image :#imageLiteral(resourceName:    "VegetablePatties"    ), imageUrl:    ""    , catDetail:    "Lunch/Dinner"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Thai Red Curry"    , image :#imageLiteral(resourceName:    "ThaiRedCurry"    ), imageUrl:    ""    , catDetail:    "Lunch/Dinner"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Gluten Free Corn Bread"    , image :#imageLiteral(resourceName:    "GlutenFreeCornBread"    ), imageUrl:    ""    , catDetail:    "Sides"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Spanish Rice"    , image :#imageLiteral(resourceName:    "SpanishRice"    ), imageUrl:    ""    , catDetail:    "Sides"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Sugar and Dairy Free Croissants"    , image :#imageLiteral(resourceName:    "SugarAndDairyFreeCroissants"    ), imageUrl:    ""    , catDetail:    "Doughs"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Granola Bars"    , image :#imageLiteral(resourceName:    "GranolaBars"    ), imageUrl:    ""    , catDetail:    "Bars and Balls"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Vegan Vanilla Cupcakes"    , image :#imageLiteral(resourceName:    "VeganVanillaCupcakes"    ), imageUrl:    ""    , catDetail:    "Batters"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Vegan Double Chocolate Muffins"    , image :#imageLiteral(resourceName:    "VeganDoubleChocolateMuffins"    ), imageUrl:    ""    , catDetail:    "Batters"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Gluten Free Macaroni and Cheese"    , image :#imageLiteral(resourceName:    "GlutenFreeMacaroniAndCheese"    ), imageUrl:    ""    , catDetail:    "Sides"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Vegan Marbled Ice Cream"    , image :#imageLiteral(resourceName:    "VeganMarbledIceCream"    ), imageUrl:    ""    , catDetail:    "Ice Cream"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Vegan Mint Chcolate Chip Ice Cream"    , image : #imageLiteral(resourceName: "VeganMintChocolateChipIceCream") , imageUrl:    ""    , catDetail:    "Ice Cream"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Vegan Avocado Ice Cream"    , image :#imageLiteral(resourceName:    "VeganAvocadoIceCream"    ), imageUrl:    ""    , catDetail:    "Ice Cream"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Gluten Free Bread"    , image :#imageLiteral(resourceName:    "GlutenFreeBread"    ), imageUrl:    ""    , catDetail:    "Doughs"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Gluten Free Sandwich Bread"    , image :#imageLiteral(resourceName:    "GlutenFreeSandwichBread"    ), imageUrl:    ""    , catDetail:    "Doughs"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Gluten Free English Muffin Bread"    , image :#imageLiteral(resourceName:    "GlutenFreeEnglishMuffinBread"    ), imageUrl:    ""    , catDetail:    "Doughs"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Gluten Free Japanese Milk Bread"    , image :#imageLiteral(resourceName:    "GlutenFreeJapaneseMilkBread"    ), imageUrl:    ""    , catDetail:    "Doughs"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Gluten Free Pasta"    , image :#imageLiteral(resourceName:    "GlutenFreePasta"    ), imageUrl:    ""    , catDetail:    "Doughs"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Lemon Kale Chips"    , image :#imageLiteral(resourceName:    "LemonKaleChips"    ), imageUrl:    ""    , catDetail:    "Chips"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Sweet Potato Chips"    , image :#imageLiteral(resourceName:    "SweetPotatoChips"    ), imageUrl:    ""    , catDetail:    "Chips"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Vegan Chinese Kung Pao Chicken"    , image :#imageLiteral(resourceName:    "VeganChineseKungPaoChicken"    ), imageUrl:    ""    , catDetail:    "Lunch/Dinner"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Vegan Fried Chicken"    , image :#imageLiteral(resourceName:    "VeganFriedChicken"    ), imageUrl:    ""    , catDetail:    "Lunch/Dinner"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Chickpea Macaroni Salad"    , image :#imageLiteral(resourceName:    "ChickpeaMacaroniSalad"    ), imageUrl:    ""    , catDetail:    "Sides"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Sesame Noodle Salad"    , image :#imageLiteral(resourceName:    "SesameNoodleSalad"    ), imageUrl:    ""    , catDetail:    "Sides"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Sweetened Coconut Whipped Cream"    , image :#imageLiteral(resourceName:    "SweetenedCoconutWhippedCream"    ), imageUrl:    ""    , catDetail:    "Ice Cream"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Dairy Free Alfredo Sauce"    , image :#imageLiteral(resourceName:    "DairyFreeAlfredoSauce"    ), imageUrl:    ""    , catDetail:    "Lunch/Dinner"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Vegan Chicken Nuggets"    , image :#imageLiteral(resourceName:    "VeganChickenNuggets"    ), imageUrl:    ""    , catDetail:    "Lunch/Dinner"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Double Chocolate Zucchini Muffins"    , image : #imageLiteral(resourceName: "DoubleChocolateChipZucchiniMuffins") , imageUrl:    ""    , catDetail:    "Batters"    , restrictions:    ""    , ingredients:     ""    ),
 cellData( text :    "Sugar Free Peanut Butter Fudge"    , image :#imageLiteral(resourceName:    "SugarFreePeanutButterFudge"    ), imageUrl:    ""    , catDetail:    "Doughs"    , restrictions:    ""    , ingredients:     ""    ),
 */
 */
