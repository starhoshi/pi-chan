//
//  esa.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/03/27.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import APIKit

class Esa{
  var token:String!
  var currentTeam:String!
  
  class var sharedInstance: Esa {
    struct Static {
      static let instance: Esa = Esa()
    }
    return Static.instance
  }
  
  func teams() -> NSURLSessionTask?{
    let request = GetTeamsLimitRequest()
    return Session.sendRequest(request)
  }
  
}

protocol EsaRequestType: RequestType {
  
}

extension EsaRequestType {
  var baseURL: NSURL {
    return NSURL(string: "https://api.esa.io/v1")!
  }
}
