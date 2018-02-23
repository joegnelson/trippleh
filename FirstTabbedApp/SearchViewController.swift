//
//  SearchViewController.swift
//  FirstTabbedApp
//
//  Created by Hailey Nelson on 9/3/17.
//  Copyright © 2017 Nelson, Joe. All rights reserved.


import UIKit

let categories:[[String]] = [[/*"All Meals",*/ "Breakfast", "Lunch/Dinner", "Soup", "Sides"],
                             [/*"All Desserts",*/ "Ice Cream", "Batters","Doughs", "Pie"],
                             ["Chips", "Dips", "Bars and Balls"]]

let headers:[String] = ["Meal", "Dessert", "Snacks"]

var searchViewIndexPath:IndexPath?
var categoryDatabase = [cellData]()

class SearchViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Search"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.section][indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchViewIndexPath = indexPath
        categoryDatabase = [cellData]()
        
        //Traversing through database and adding to categoryDatabase
        for item in restrictionDatabase {
            if(item.catDetail==categories[(searchViewIndexPath?.section)!][(searchViewIndexPath?.item)!]){
                categoryDatabase.append(item)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
