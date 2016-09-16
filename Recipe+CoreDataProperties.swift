//
//  Recipe+CoreDataProperties.swift
//  HungryBoi
//
//  Created by Leo Kwan on 9/16/16.
//  Copyright © 2016 Leo Kwan. All rights reserved.
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe");
    }

    @NSManaged public var name: String?
  
  class func fetch(from container:NSPersistentContainer, completion:@escaping ([Recipe]) -> Void)  {
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
