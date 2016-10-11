import WatchKit
import WatchConnectivity
import Foundation



class RecipesWatchController: WKInterfaceController {
  
  @IBOutlet var recipeTableView: WKInterfaceTable!
  
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    setTitle("Hungry Boi")
  }
  
  override func willActivate() {
    super.willActivate()
  }
  
  override func didAppear() {
    
    if WCSession.default().isReachable {
      WatchToPhoneService.sharedInstance.requestRecipes()
    }
  }
  
}

extension RecipesWatchController: IncomingWatchInfoDelegate {
  func didReceiveRecipes(key: String, recipes: [WatchRecipe]) {
    
      recipeTableView.setNumberOfRows(recipes.count, withRowType: "RecipeRowType")
      
      for (index, recipe) in recipes.enumerated() {
        let controller = recipeTableView.rowController(at: index) as! RecipeRowController
        
        if let recipeName = recipe["name"] as? String {
          controller.titleLabel.setText(recipeName)
        }
      }
    
  }
}
