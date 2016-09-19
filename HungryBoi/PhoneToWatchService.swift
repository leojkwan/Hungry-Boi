import Foundation
import WatchConnectivity
import WatchKit
import HungryBoiCommon
import CoreData


public final class PhoneToWatchService: NSObject, WCSessionDelegate {
  
  let persistentContainer: NSPersistentContainer
  private lazy var notificationCenter: NotificationCenter = {
    return NotificationCenter.default
  }()
  
  
  private var watchDataManager: WatchDataManager?
  
  init(persistentContainer: NSPersistentContainer) {
    self.persistentContainer = persistentContainer
  }
  
  
  public func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
    print("Phone->Watch Receiving Context: \(applicationContext)")
  }
  
  public func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
    
    if userInfo.keys.first == "GET_Recipes" {
      
      if watchDataManager == nil {
        // First time
        setupCoreDataWatchManager(persistentContainer: persistentContainer)
      }
      
      watchDataManager!.generateWatchRecipes { (watchRecipes) in
        self.sendRecipesToWatch(recipes: watchRecipes)
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
  
  
  // Called when app is started up
  func setupCoreDataWatchManager(persistentContainer:NSPersistentContainer) {
    watchDataManager = WatchDataManager(persistentContainer: persistentContainer)
  }
  
  
  public func sendRecipesToWatch(recipes: [WatchRecipe]) {
    if WCSession.isSupported() {
      WCSession.default().transferUserInfo(["recipes": recipes])
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
