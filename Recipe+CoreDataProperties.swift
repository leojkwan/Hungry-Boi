import Foundation
import CoreData

public extension Recipe {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
    return NSFetchRequest<Recipe>(entityName: "Recipe");
  }
  
  @NSManaged public var name: String
  
  public class func fetchAll(from container:NSPersistentContainer, completion:@escaping ([Recipe]) -> Void)  {
    let request: NSFetchRequest<Recipe> = Recipe.fetchRequest()
    request.returnsObjectsAsFaults = false
    request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
    
    let asyncRequest = NSAsynchronousFetchRequest<Recipe>(fetchRequest: request) { result in
      
      guard let recipes = result.finalResult else {
        completion([])
        return
      }
      
      completion(recipes)
    }
    
    try! container.viewContext.execute(asyncRequest)
  }
  
}
