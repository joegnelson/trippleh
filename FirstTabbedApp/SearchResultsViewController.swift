//
//  FirstViewController.swift
//  FirstTabbedApp
//
//  Created by Nelson, Joe on 7/4/17.
//  Copyright © 2017 Nelson, Joe. All rights reserved.
//

import UIKit

var searchResultsSelectedCellData:cellData?


class SearchResultsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "\(headers[(searchViewIndexPath?.section)!]): \(categories[(searchViewIndexPath?.section)!][(searchViewIndexPath?.item)!])  "
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryDatabase.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
       // cell.mainImageView1.image = categoryDatabase[indexPath.row].image
        let imageUrl=URL(string: categoryDatabase[indexPath.row].imageUrl)!
        HomeViewController.downloadImage(cell:cell, url:imageUrl, completion:completionX)
        cell.mainLabel1.text = categoryDatabase[indexPath.row].title
        
        return cell
    }
    func completionX(cell:Any,image: UIImage?, error: Error?)->Void{
        guard  error == nil else { return }
        //print(response?.suggestedFilename ?? url.lastPathComponent)
        DispatchQueue.main.async() { () -> Void in
            if let cell2 = cell as? TableViewCell1{
                cell2.mainImageView1.image = image
            }
        }
        
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 250
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchResultsSelectedCellData = categoryDatabase[indexPath.row]
        performSegue(withIdentifier: "searchSegue", sender: self)
    }
    
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     }
}

