//View Contoller from recipe list
//Recipe display

import UIKit

class RecipeViewController: UIViewController {
    
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeDescrip: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTitle.text = "First"
        recipeImage.image = #imageLiteral(resourceName: "VeganBeetLasagna.png")
        recipeDescrip.text = "Yummy vegan shit"
        
        self.navigationItem.title = recipeTitle.text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
