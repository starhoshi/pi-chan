//
//  Share.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/05/03.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit

class Share {
  static func openBrowser(url:NSURL){
    if UIApplication.sharedApplication().canOpenURL(url){
      UIApplication.sharedApplication().openURL(url)
    }
  }

  static func openAppStore(url:NSURL){
    UIApplication.sharedApplication().openURL(url)
  }

}