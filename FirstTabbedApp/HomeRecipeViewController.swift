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
        let url:String  = arrayofCellData[homeViewIndex].imageUrl
 //       let filePath = Bundle.main.path(forResource: url, ofType: "jpg")
        if(!url.isEmpty){
            
            
            if let checkedUrl = URL(string: url) {
                self.recipeImage.contentMode = .scaleAspectFit
                downloadImage(url: checkedUrl)
            }
            
            
//            let image = UIImage(contentsOfFile: url)
//            if(image != nil)
//            {
//                recipeImage.image=image
//            }
            
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
