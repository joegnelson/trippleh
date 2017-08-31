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

class FirstViewController: UITableViewController /**, UITableViewDataSource*/ {
    
    var arrayofCellData = [cellData]()
    
    //let data:[String] = ["Item 1", "Item 2", "Item 3", "Item 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            
        else if arrayofCellData[indexPath.row].cell == 2 {
            let cell = Bundle.main.loadNibNamed("TableViewCell2", owner: self, options: nil)?.first as! TableViewCell2
            cell.mainImageView2.image = arrayofCellData[indexPath.row].image
            cell.mainLabel2.text = arrayofCellData[indexPath.row].text
            
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
            return 320
        }
            
        else if arrayofCellData[indexPath.row].cell == 2 {
            return 79.5
        }
        //Default cell
        else{
            return 320
        }

    }
    
}

