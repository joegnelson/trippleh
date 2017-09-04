//Home View Controller 
//Same as when in 


import UIKit


var homeViewIndex:Int=0



class HomeViewController: UITableViewController /**, UITableViewDataSource*/ {
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        homeViewIndex = indexPath.row
        performSegue(withIdentifier: "homeSegue", sender: self)
    }
    
}

