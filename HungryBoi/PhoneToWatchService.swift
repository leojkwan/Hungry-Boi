import Foundation
import WatchConnectivity
import WatchKit
import CoreData


public final class PhoneToWatchService: NSObject, WCSessionDelegate {
  
  let persistentContainer: NSPersistentContainer
  private lazy var notificationCenter: NotificationCenter = {
    return NotificationCenter.default
  }()
  

  init(persistentContainer: NSPersistentContainer) {
    self.persistentContainer = persistentContainer
  }
  
  public func sendRecipesToWatch(recipes: [Recipe]) {
    let watchRecipes = generateWatchRecipes(recipes: recipes)
    if WCSession.isSupported() {
      WCSession.default().sendMessage(["recipes": watchRecipes], replyHandler: nil, errorHandler: nil)
    }
  }
  
  private func generateWatchRecipes(recipes: [Recipe])-> [WatchRecipe] {
    return recipes.map({ (recipe) -> WatchRecipe in
      return ["name": recipe.name as AnyObject]
    })
  }
  
  public func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
    if message.keys.first == "recipes" {
      Recipe.fetchAll(from: persistentContainer) { [weak self] (recipes) in
        guard let strongSelf = self else {
          return
        }
        let watchRecipes = strongSelf.generateWatchRecipes(recipes: recipes)
        replyHandler(["recipes": watchRecipes])
      }
    }
  }

  func setupWatchConnectivity() {
    if WCSession.isSupported() {
      let session  = WCSession.default()
      session.delegate = self
      session.activate()
    }
  }
}


extension PhoneToWatchService {
  /** Called when all delegate callbacks for the previously selected watch has occurred. The session can be re-activated for the now selected watch using activateSession. */
  @available(iOS 9.3, *)
  public func sessionDidDeactivate(_ session: WCSession) {
    //
  }
  
  /** Called when the session can no longer be used to modify or add any new transfers and, all interactive messages will be cancelled, but delegate callbacks for background transfers can still occur. This will happen when the selected watch is being changed. */
  @available(iOS 9.3, *)
  public func sessionDidBecomeInactive(_ session: WCSession) {
    //
  }
  
  /** Called when the session has completed activation. If session state is WCSessionActivationStateNotActivated there will be an error with more details. */
  @objc(session:activationDidCompleteWithState:error:) @available(iOS 9.3, *)
  public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    //
  }
}
