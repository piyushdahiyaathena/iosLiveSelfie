//
//  ConnectingFile.swift
//  TestProj2
//
//  Created by HIT08 on 20/10/23.
//

import Foundation

@objc(Connect)
class Connect: NSObject {
  @objc static func requiresMainQueueSetup() -> Bool { return true }
  @objc func goToNative() -> Void {
    DispatchQueue.main.async {
      if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
        appDelegate.goNativeStoryboard()
      }
    }
  }
}
