//
//  ErrorHandler.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/05/04.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import APIKit
import Crashlytics
import JLToast

class ErrorHandler {
  struct STATUS {
    static let UNAUTHORIAZED = 401
    static let NOT_FOUND = 404
  }
  
  static func errorAlert(error: APIError, controller: UIViewController) {
    log?.error(error)
    
    switch error {
    case .InvalidBaseURL:
      showErrorToast()
      
    case .ConfigurationError(let error):
      showErrorToast()
      Crashlytics.sharedInstance().sendError(error)
      
    case .ConnectionError:
      showErrorToast()
      
    case .ResponseBodyDeserializationError(let error):
      showErrorToast()
      Crashlytics.sharedInstance().sendError(error)
      
    case .RequestBodySerializationError(let error):
      showErrorToast()
      Crashlytics.sharedInstance().sendError(error)
      
    case .InvalidResponseStructure:
      showErrorToast()
      Crashlytics.sharedInstance().sendError("InvalidResponseStructure", code: 10000000)
      
    case .NotHTTPURLResponse:
      showErrorToast()
      Crashlytics.sharedInstance().sendError("NotHTTPURLResponse", code: 10001000)
      
    case .UnacceptableStatusCode(let statusCode, _):
      if statusCode == STATUS.UNAUTHORIAZED {
        Window.openLogin(controller)
        showNeedLoginToast()
      } else if statusCode == STATUS.NOT_FOUND{
        showNotFoundToast()
      } else {
        showErrorToast()
      }
    }
  }
  
  private static func showErrorToast(){
    JLToast.showPichanToast("エラーが発生しました。(\\( ⁰⊖⁰)/)\n\nしばらく経ってから再度お試しください。")
  }
  private static func showNotFoundToast(){
    JLToast.showPichanToast("該当の URL が見つかりませんでした。(\\( ⁰⊖⁰)/)")
  }
  private static func showNeedLoginToast(){
    JLToast.showPichanToast("esa.io での認証が必要です (\\( ⁰⊖⁰)/)\nログインをお願いします。")
  }
  
}