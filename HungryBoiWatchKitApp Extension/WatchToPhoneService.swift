import Foundation
import WatchKit
import WatchConnectivity


protocol IncomingWatchInfoDelegate: class {
  func didReceiveRecipes(key: String, recipes: [WatchRecipe])
}

final public class WatchToPhoneService: NSObject, WCSessionDelegate {
  
  weak var delegate: IncomingWatchInfoDelegate?
  
  static let sharedInstance = WatchToPhoneService()
  
  override private init() { }
  
  func setupWatchConnectivity() {
      let session  = WCSession.default()
      session.delegate = self
      session.activate()
  }
  
  
  
  func requestRecipes() {
    
    WCSession.default().sendMessage(["recipes": ""], replyHandler: { [weak self] (reply) in
      print(reply)
      
      guard let strongSelf = self else {
        return
      }
      
      let key = reply.keys.first!
      let info = reply[key]!
      
      if key == "recipes" {
        let rootVC = WKExtension.shared().rootInterfaceController as? RecipesWatchController
        
        if strongSelf.delegate == nil && rootVC != nil {
          // The root vc was not present when watch app started
          // Now what we have the root, set it as the watch into delegate
          strongSelf.delegate = rootVC
        }
        
        if let watchRecipes = info as? [WatchRecipe] {
          strongSelf.delegate?.didReceiveRecipes(key: key, recipes: watchRecipes)
        }
      }
    }) { (error) in
      print(error)
    }
  }
  
  private func handleIncomingPhoneRecipes(reply: [String: AnyObject]) {
    
  }
  
  @available(watchOS 2.2, *)
  public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
  }
  
  public func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
    let key = message.keys.first!
    let info = message[key]!
    
    if key == "recipes" {
      let rootVC = WKExtension.shared().rootInterfaceController as? RecipesWatchController
      
      if delegate == nil && rootVC != nil {
        // The root vc was not present when watch app started
        // Now what we have the root, set it as the watch into delegate
        delegate = rootVC
      }
      
      if let watchRecipes = info as? [WatchRecipe] {
        delegate?.didReceiveRecipes(key: key, recipes: watchRecipes)
      }
    }
  }
}
