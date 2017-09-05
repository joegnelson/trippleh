//
//  SearchViewController.swift
//  FirstTabbedApp
//
//  Created by Hailey Nelson on 9/3/17.
//  Copyright © 2017 Nelson, Joe. All rights reserved.
//

import UIKit

let catagories:[[String]] = [["All Meals", "Breakfast", "Lunch/Dinner"],
                             ["All Desserts", "Ice Cream", "Batters","Doughs"],
                             ["Chips", "Dips", "Granola", "Bars and Balls"]]

let headers:[String] = ["Meal", "Dessert", "Snacks"]

var searchViewIndexPath:IndexPath?
var lArrayofCellData = [cellData2]()

class SearchViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Search"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return catagories.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catagories[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = catagories[indexPath.section][indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchViewIndexPath = indexPath
        lArrayofCellData = [cellData2]()

        for item in arrayofCellData {
            if(item.catDetail==catagories[(searchViewIndexPath?.section)!][(searchViewIndexPath?.item)!]){
                lArrayofCellData.append(item)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
