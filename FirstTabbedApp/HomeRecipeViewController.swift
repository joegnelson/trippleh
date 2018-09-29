//
//  HomeRecipeViewController.swift
//  FirstTabbedApp
//
//  Created by Hailey Nelson on 9/3/17.
//  Copyright © 2017 Nelson, Joe. All rights reserved.
//

import UIKit

class HomeRecipeViewController:UIViewController {
    //UI Labels and Images
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeDescrip: UILabel!
    @IBOutlet weak var recipeRestrictions: UILabel!
    @IBOutlet weak var recipeIngredients: UILabel!
    @IBOutlet weak var recipeDirections: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let data:cellData = restrictionDatabase[homeViewIndex];
//        recipeImage.image = data.image
        recipeTitle.text = data.title
        recipeDescrip.text = data.category
        recipeRestrictions.text = data.restrictions
        recipeIngredients.text = data.ingredients
        recipeDirections.text = data.directions
        print(data.directions)
        self.navigationItem.title=data.title
        
        recipeIngredients.numberOfLines = 0;
        
       // let url:String  = data.imageUrl
        let url = URL(string:data.imageUrl)
        HomeViewController.downloadImage(cell:recipeImage, url:url!, completion:completionX)
    }
    
    
     func completionX(imageView:Any,image: UIImage?, error: Error?)->Void{
        guard  error == nil else { return }
        DispatchQueue.main.async() { () -> Void in
            if let view = imageView as? UIImageView{
                view.image = image
            }
        }
    }


}
