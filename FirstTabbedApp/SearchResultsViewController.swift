//
//  FirstViewController.swift
//  FirstTabbedApp
//
//  Created by Nelson, Joe on 7/4/17.
//  Copyright © 2017 Nelson, Joe. All rights reserved.
//

import UIKit

struct cellData {
    let cell: Int!
    let text: String!
    let image: UIImage!
}

var myIndex = 0

class SearchResultsViewController: UITableViewController /**,UITableViewDataSource*/ {
    
    var arrayofCellData = [cellData]()
    
    //let data:[String] = ["Item 1", "Item 2", "Item 3", "Item 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Search Results"
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //Recipe cells
        arrayofCellData = [cellData(cell : 1, text : "Vegan Beet Lasagna", image : #imageLiteral(resourceName: "BeetLasagna")),
                           cellData(cell : 1, text : "Vegan Brownies", image : #imageLiteral(resourceName: "VeganBrownies")),
                           cellData(cell : 1, text : "Vegan Eggplant Parmesean", image : #imageLiteral(resourceName: "VeganEggplantParm"))]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayofCellData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /**let cell = UITableViewCell()
        cell.textLabel?.text = data[indexPath.count]
        return cell   */
        
        if arrayofCellData[indexPath.row].cell == 1 {
            
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            cell.mainImageView1.image = arrayofCellData[indexPath.row].image
            cell.mainLabel1.text = arrayofCellData[indexPath.row].text
            
            return cell
        
        }
        //Default cell
        else {
            
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            cell.mainImageView1.image = arrayofCellData[indexPath.row].image
            cell.mainLabel1.text = arrayofCellData[indexPath.row].text
            
            return cell

        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if arrayofCellData[indexPath.row].cell == 1 {
            return 250
        }
            
        //Default cell
        else{
            return 250
        }

    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "searchSegue", sender: self)
    }
    
}

