//Home View Controller 
//Same as when in 


import UIKit


class HomeViewController: UITableViewController /**, UITableViewDataSource*/ {
    
    var arrayofCellData = [cellData]()
    
    //let data:[String] = ["Item 1", "Item 2", "Item 3", "Item 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Recipe cells
        arrayofCellData = [cellData(cell : 1, text : "Vegan Beet Lasagna", image : #imageLiteral(resourceName: "BeetLasagna")),
                           cellData(cell : 1, text : "Vegan Brownies", image : #imageLiteral(resourceName: "VeganBrownies")),
                           cellData(cell : 1, text : "Vegan Eggplant Parmesean", image : #imageLiteral(resourceName: "VeganEggplantParm"))]
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayofCellData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            cell.mainImageView1.image = arrayofCellData[indexPath.row].image
            cell.mainLabel1.text = arrayofCellData[indexPath.row].text
            
            return cell
            
            
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 250
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "homeSegue", sender: self)
    }
    
}

