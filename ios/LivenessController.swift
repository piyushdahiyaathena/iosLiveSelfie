//
//  LivenessController.swift
//  TestProj2
//
//  Created by HIT08 on 23/10/23.
//

import Foundation
import UIKit
import Liveness

class LivenessController: UIViewController, KLivenessCallbacks {
  
  func showLoader(cb: (() -> Void)?) {
    print("show loader")
    cb?()
  }
  
  func hideLoader(cb: (() -> Void)?) {
    print("hide loader")
    cb?()
  }
  
  func onReceiveKLiveResult(status: Liveness.KLiveStatus, result: Liveness.KLiveResult?) {
    print("onReceiveKLiveResult "+" status: "+String(status.getMessage()))
    if let temp=result?.livenessScore {
      print("onReceiveKLiveResult "+" result: "+String(temp))
    }
  }
  
  func faceStatus(faceStatus: Liveness.FaceStatus, faceTypeStatus: Liveness.FaceTypeStatus?) {
    print("faceStatus: "+String(faceStatus.rawValue))
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let karzaToken="eyJhbGciOiJkaXIiLCJjcmVhdGVkX2F0IjoiMjAyMy0xMC0yMSIsImVuYyI6IkEyNTZHQ00ifQ..4AanpHdMxLHFNqbl.9G0SPKtz2OkKd7txW76Itp0p97AAlJP_4QPp08z7QHX-jh-1x6Uavam9B7ycmgrEufEEMWLhXis9Am9ZaG8nCii0wo1O6-dOzd6HvdQgcdRFh1PR3GiGY8s1dtW-56gbpTBoqy9acEuH04i6fHmktbUCFxUj1zrTFpgBKy8v2CsJ_gRxL9ptj-yIUxkCskdxF4CV37GjyNdnzhnFdQgXSVOQ4GvvZ_DYdKQEPR5fkwewJ7vpXFEdpX-YpGJKotHJO1dFeXuCXJgmmcDaHaH2WbgVyzg2yZ0YXDwjEJo.LV4TW_hVSeSgIJJIv0QkwQ"
    let kvc = KLivenessViewController(delegate: self, karzaToken: karzaToken, environment: KEnvironment.DEV,details: nil, cameraFacing: .front)
    self.addChild(kvc)
    self.view.addSubview(kvc.view)
    self.view.sendSubviewToBack(kvc.view)
    kvc.view.translatesAutoresizingMaskIntoConstraints=false
    kvc.view.clipsToBounds=true
    NSLayoutConstraint.activate([
      kvc.view.topAnchor.constraint(equalTo: self.view.topAnchor),
      kvc.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
      kvc.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      kvc.view.trailingAnchor.constraint (equalTo: self.view.trailingAnchor),
    ])
    kvc.didMove(toParent: self)
  
  }
}
