//
//  AppDelegate.swift
//  TestProj2
//
//  Created by HIT08 on 20/10/23.
//

import Foundation
import UIKit
import Liveness

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, KLivenessCallbacks {
  func showLoader(cb: (() -> Void)?) {
    print("showLoader")
    cb?()
  }
  
  func hideLoader(cb: (() -> Void)?) {
    print("hideLoader")
    cb?()
  }
  
  func onReceiveKLiveResult(status: Liveness.KLiveStatus, result: Liveness.KLiveResult?) {
    print("onRecieveKLiveResult")
  }
  
  func faceStatus(faceStatus: Liveness.FaceStatus, faceTypeStatus: Liveness.FaceTypeStatus?) {
    print("faceStatus")
  }
  
  var window: UIWindow?
  var bridge: RCTBridge!
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let jsCodeLocation: URL
    
    print("AppDelegate fun-applications")
    
    jsCodeLocation = RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index.js")
    let rootView = RCTRootView(bundleURL: jsCodeLocation, moduleName: "TestProj2", initialProperties: nil, launchOptions: launchOptions)
    
    self.window = UIWindow(frame: UIScreen.main.bounds)
    let reactNativeViewController = UIViewController()
    reactNativeViewController.view = rootView
    let reactNavigationController = UINavigationController(rootViewController: reactNativeViewController)
    self.window?.rootViewController = reactNavigationController
    self.window?.makeKeyAndVisible()
    
    return true
  }
//  func goToReactNative() {
//    window?.rootViewController?.dismiss(animated: true)
//  }
  func goNativeStoryboard() {
    DispatchQueue.main.async {
      print("AppDelegate  fun-goNativeStoryboard")
      
      let vc = UIStoryboard(name: "MainStoryBoard", bundle: nil).instantiateViewController(withIdentifier: "myVCID")
      
      let childViewController = LivenessController()
      vc.addChild(childViewController)
      vc.view.addSubview(childViewController.view)
      childViewController.didMove(toParent: vc)
      
      (self.window?.rootViewController as? UINavigationController)?.pushViewController(vc, animated: true)
      
      
      
//      if let vc = vc {
//        print("goNativeStoryboard  if condition running")
//        (self.window?.rootViewController as? UINavigationController)?.pushViewController(vc, animated: true)
//      }
    }
  }
}

