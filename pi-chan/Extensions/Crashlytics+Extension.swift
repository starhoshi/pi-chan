//
//  Crashlytics+Extension.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/05/04.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import Crashlytics
import APIKit

// ErrorType の中身をそのまま投げてしまうと、ユーザ情報が見えてしまうため dimain, code のみ送信
extension Crashlytics{
  func sendError(error:ErrorType){
    let nserror = error as NSError
    let customNSError = NSError(domain: nserror.domain, code: nserror.code, userInfo: nil)
    Crashlytics.sharedInstance().recordError(customNSError)
  }
  func sendError(domain:String, code:Int){
    let customNSError = NSError(domain: domain, code: 1000000, userInfo: nil)
    Crashlytics.sharedInstance().recordError(customNSError)
  }
}


struct NSERROR_CODE {
  static let INVALID_BASE_URL = 100000
}