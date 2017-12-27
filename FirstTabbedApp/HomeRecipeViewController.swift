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
        let data:cellData=arrayofCellData[homeViewIndex];
        recipeImage.image = data.image
        recipeTitle.text = data.text
        recipeDescrip.text = data.catDetail
        recipeRestrictions.text = data.restrictions
        recipeIngredients.text = data.ingredients
        self.navigationItem.title=data.text
        
        recipeIngredients.numberOfLines = 0;
        
        let url:String  = data.imageUrl
        if(!url.isEmpty){
            if let checkedUrl = URL(string: url) {
                self.recipeImage.contentMode = .scaleAspectFit
                downloadImage(url: checkedUrl)
            }
        }
    }

    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    func downloadImage(url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in
                self.recipeImage.image = UIImage(data: data)
            }
        }
    }
}
