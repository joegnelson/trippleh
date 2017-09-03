//
//  RecipeViewController.swift
//  FirstTabbedApp
//
//  Created by Nelson, Joe on 9/1/17.
//  Copyright © 2017 Nelson, Joe. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {
    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var RecipeName: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeImage.image = arrayofCellData[rowIndex].image
        RecipeName.text = arrayofCellData[rowIndex].text
        self.navigationItem.title=arrayofCellData[rowIndex].text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

