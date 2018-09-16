//Home View Controller 
//Same as when in 


import UIKit

var homeViewIndex:Int=0

class HomeViewController: UITableViewController /**, UITableViewDataSource*/ {
    
    override func viewDidAppear(_ animated: Bool) {
        print("COunt: \(restrictionDatabase.count)")
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(restrictionDatabase.count)
    }
    
    //only runs on initial load
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("DB count = \(database.count)")
        return restrictionDatabase.count
    }
    
    //only loads what you can see on one screen
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            print("icu")
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            cell.mainImageView1.image = restrictionDatabase[indexPath.row].image
            cell.mainLabel1.text = restrictionDatabase[indexPath.row].text
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

