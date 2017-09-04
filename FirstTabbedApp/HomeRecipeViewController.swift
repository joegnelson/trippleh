//
//  HomeRecipeViewController.swift
//  FirstTabbedApp
//
//  Created by Hailey Nelson on 9/3/17.
//  Copyright © 2017 Nelson, Joe. All rights reserved.
//

import UIKit

class HomeRecipeViewController:UIViewController {
    @IBOutlet weak var recipeImage: UIImageView!

    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeDescrip: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeImage.image = arrayofCellData[homeViewIndex].image
        recipeTitle.text = arrayofCellData[homeViewIndex].text
        self.navigationItem.title=arrayofCellData[homeViewIndex].text
    }

}
