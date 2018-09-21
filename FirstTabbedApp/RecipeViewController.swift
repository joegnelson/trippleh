//View Contoller from recipe list
//Recipe display

import UIKit

class RecipeViewController: UIViewController {
    
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeDescrip: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeRestrictions: UILabel!
    @IBOutlet weak var recipeIngred: UILabel!
    @IBOutlet weak var recipeDirect: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let data:cellData=searchResultsSelectedCellData!
       // recipeImage.image = data.image
        recipeTitle.text = data.text
        recipeDescrip.text=data.category
        recipeRestrictions.text=data.restrictions
        self.navigationItem.title=data.text
        
        let url:String  = data.imageUrl
        if(!url.isEmpty){
            if let checkedUrl = URL(string: url) {
                self.recipeImage.contentMode = .scaleAspectFit
                downloadImage(url: checkedUrl)
            }
        }
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    func downloadImage(url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in
                self.recipeImage.image = UIImage(data: data)
            }
        }
    }
    
}
