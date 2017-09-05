//
//  FirstViewController.swift
//  FirstTabbedApp
//
//  Created by Nelson, Joe on 7/4/17.
//  Copyright © 2017 Nelson, Joe. All rights reserved.
//

import UIKit

var searchResultsViewIndex = 0


class SearchResultsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "\(headers[(searchViewIndexPath?.section)!]): \(catagories[(searchViewIndexPath?.section)!][(searchViewIndexPath?.item)!])  "
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lArrayofCellData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
        cell.mainImageView1.image = lArrayofCellData[indexPath.row].image
        cell.mainLabel1.text = lArrayofCellData[indexPath.row].text
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 250
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchResultsViewIndex = indexPath.row
        performSegue(withIdentifier: "searchSegue", sender: self)
    }
    
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     }
}

