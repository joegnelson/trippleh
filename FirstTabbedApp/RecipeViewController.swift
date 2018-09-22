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
        recipeTitle.text = data.title
        recipeDescrip.text=data.category
        recipeRestrictions.text=data.restrictions
        self.navigationItem.title=data.title
        
        let url  = URL(string:data.imageUrl)
        
        HomeViewController.downloadImage(cell:recipeImage, url:url!, completion:completionX)


    }
    func completionX(imageView:Any,image: UIImage?, error: Error?)->Void{
        guard  error == nil else { return }
        DispatchQueue.main.async() { () -> Void in
            if let view = imageView as? UIImageView{
                view.image = image
            }
        }
    }


}
