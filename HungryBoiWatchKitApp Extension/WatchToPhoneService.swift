
//
//  WatchConnectivityService.swift
//  Atrium

import Foundation
import WatchKit
import WatchConnectivity


protocol IncomingWatchInfoDelegate: class {
  func didReceiveUserInfo(key:String, info: Any)
}

final public class WatchToPhoneService: NSObject, WCSessionDelegate {
  
  weak var delegate: IncomingWatchInfoDelegate?
  static let sharedInstance = WatchToPhoneService()
  
  func requestRecipes() {
    WCSession.default().transferUserInfo(["GET_Recipes": ""])
  }
  
  /** Called when the session has completed activation. If session state is WCSessionActivationStateNotActivated there will be an error with more details. */
  @available(watchOS 2.2, *)
  public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    
  }
  
  public func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
    let key = userInfo.keys.first!
    let info = userInfo[key]!
    
    if key == "recipes" {
      let rootVC = WKExtension.shared().rootInterfaceController as? RecipesWatchController
      if delegate == nil && rootVC != nil {
        // The root vc was not present when watch app started
        // Now what we have the root, set it as the watch into delegate
        delegate = rootVC
      }
      
      delegate?.didReceiveUserInfo(key: key, info: info)
    }
  }
  
  
  func setupWatchConnectivity() {
    if WCSession.isSupported() {
      let session  = WCSession.default()
      session.delegate = self
      session.activate()
    }
  }
  
  public func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
    //
  }
  
  private lazy var notificationCenter: NotificationCenter = {
    return NotificationCenter.default
  }()
  
  //  func setupNotificationCenter() {
  //
  //  }
}




