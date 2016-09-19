import Foundation
import CoreData




public final class WatchDataManager {

  public var persistentContainer: NSPersistentContainer
  
  public init(persistentContainer: NSPersistentContainer) {
    self.persistentContainer = persistentContainer
  }
  
  
  
  public func generateWatchRecipes(completion:@escaping (([WatchRecipe])-> Void)) {
    
    Recipe.fetch(from: persistentContainer) { (recipes) in
      let watchRecipes = recipes.map({ (recipe) -> WatchRecipe in
        return [recipe.name: recipe.name as AnyObject]
      })
      
      completion(watchRecipes)
    }
  }
}
