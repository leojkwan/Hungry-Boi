import WatchKit
import Foundation



class RecipesWatchController: WKInterfaceController {

  @IBOutlet var recipeTableView: WKInterfaceTable!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
      
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
       WatchToPhoneService.sharedInstance.requestRecipes()
      
    }
  
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

extension RecipesWatchController: IncomingWatchInfoDelegate {
  func didReceiveUserInfo(key: String, info: Any) {
    print("show in table view")
    if let recipes = info as? [WatchRecipe] {
      // rowType == cellReuseId
    recipeTableView.setNumberOfRows(recipes.count, withRowType: "RecipeRowType")
      
      for (index, recipe) in recipes.enumerated() {
        
        let controller = recipeTableView.rowController(at: index) as! RecipeRowController
        controller.titleLabel.setText(recipe.keys.first!)
      }
      
    }
    
  }
}
