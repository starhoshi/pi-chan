//
//  esa.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/03/27.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import APIKit
import Result

class Esa{
  var token:String!
  var currentTeam:String!
  
  class var sharedInstance: Esa {
    struct Static {
      static let instance: Esa = Esa()
    }
    return Static.instance
  }
  
  func teams(handler:(Result<Teams, APIError>) -> Void = {r in}) -> NSURLSessionDataTask?{
    let request = GetTeamsRequest()
    return Session.sendRequest(request)
  }
  
  func team(name:String,handler:(Result<Teams, APIError>) -> Void = {r in}) -> NSURLSessionDataTask?{
    let request = GetTeamRequest(name: name)
    return Session.sendRequest(request)
  }
  
}

protocol EsaRequestType: RequestType {
  
}

extension EsaRequestType {
  var baseURL: NSURL {
    return NSURL(string: "https://api.esa.io/v1")!
  }
  var HTTPHeaderFields:[String:String] {
    return ["Authorization":"Bearer " + Esa.sharedInstance.token]
  }
}
