//Home View Controller 
//Same as when in 


import UIKit

var homeViewIndex:Int=0
let imageCache = NSCache<NSString, UIImage>()
class HomeViewController: UITableViewController /**, UITableViewDataSource*/ {
    
    //-----------------------------------------------------------------
    // OVERRIDE
    //-----------------------------------------------------------------
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
 //           cell.mainImageView1.image = restrictionDatabase[indexPath.row].image
//            cell.mainLabel1.text = restrictionDatabase[indexPath.row].text
//            return cell
        let imageUrl=URL(string: database[indexPath.row].imageUrl)!
        
        HomeViewController.downloadImage(cell:cell, url:imageUrl, completion:completionX)
 /*
        HomeViewController.downloadImage(cell:cell,imageUrl){
            (cell,data, error)  in
            guard let data = data, error == nil else { return }
            //print(response?.suggestedFilename ?? url.lastPathComponent)
            DispatchQueue.main.async() { () -> Void in
                cell.mainImageView1.image = data
            }
        }
 */
        
        
        //cell.mainImageView1.image=database[indexPath.row].imageUrl
        return cell
    }
    func completionX(cell:TableViewCell1,image: UIImage?, error: Error?)->Void{
        guard let data = image, error == nil else { return }
        //print(response?.suggestedFilename ?? url.lastPathComponent)
        DispatchQueue.main.async() { () -> Void in
            cell.mainImageView1.image = data
        }

    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 250
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        homeViewIndex = indexPath.row
        performSegue(withIdentifier: "homeSegue", sender: self)
    }
    
    
    //-----------------------------------------------------------------
    // HELPER FUCTIONS
    //-----------------------------------------------------------------
    static func downloadImage(cell:TableViewCell1,url: URL, completion: @escaping (_ cell:TableViewCell1, _ image: UIImage?, _ error: Error? ) -> Void) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            print("found image in cache")
            completion(cell,cachedImage, nil)
        } else {
            print("go get image, not in cache")
            getDataFromUrl(url: url) { data, response, error in
                if let error = error {
                    completion(cell, nil, error)
                    
                } else if let data = data, let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    completion(cell, image, nil)
                } else {
                    completion(cell, nil, nil)
                }
            }
        }
    }
    
    
    
    static func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }

}

