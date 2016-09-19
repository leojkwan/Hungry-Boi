import Foundation
import CoreData


public class Recipe: NSManagedObject {
  
  public convenience init(name:String, context: NSManagedObjectContext) {
    
      let entity = NSEntityDescription.entity(forEntityName: "Recipe", in: context)!
      self.init(entity: entity, insertInto: context)
      self.name = name

  }
}
