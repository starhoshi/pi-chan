//
//  esa.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/03/27.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation

class Esa{
  class var sharedInstance: Esa {
    struct Static {
      static let instance: Esa = Esa()
    }
    return Static.instance
  }
  
  var token:String!
  var currentTeam:String!
  
  //  func config(token: String, currentTeam: String) {
  //    self.token = token
  //    self.currentTeam = currentTeam
  //  }
  
  // MARK: - GET
  
  // チャットルームリスト取得
  //  func getRooms(success: SuccessHandler, error: FailureHandler) {
  //    self.getRequest("rooms", params: nil, success: success, error: error)
  //  }
  
  
}
