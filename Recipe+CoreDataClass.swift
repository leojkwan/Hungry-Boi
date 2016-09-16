import Foundation
import CoreData


public class Recipe: NSManagedObject {
  convenience init(name:String, context: NSManagedObjectContext) {
    
      let entity = NSEntityDescription.entity(forEntityName: "Recipe", in: context)!
    
//    let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Recipe
      self.init(entity: entity, insertInto: context)
      self.name = name

  }
}
