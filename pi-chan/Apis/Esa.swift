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
  static let sharedInstance = Esa()
  private init() {
  }
  
  var token:String = ""
  var currentTeam:String = ""
  
  func teams(handler:(Result<Teams, APIError>) -> Void = {r in}) -> NSURLSessionDataTask?{
    let request = GetTeamsRequest()
    return Session.sendRequest(request, handler:handler)
  }
  
  func team(name:String,handler:(Result<Team, APIError>) -> Void = {r in}) -> NSURLSessionDataTask?{
    let request = GetTeamRequest(name: name)
    return Session.sendRequest(request, handler:handler)
  }
  
  func posts(handler:(Result<Posts, APIError>) -> Void = {r in}) -> NSURLSessionDataTask?{
    let request = GetPostsRequest()
    return Session.sendRequest(request, handler:handler)
  }
  
  func post(number:Int,handler:(Result<Post, APIError>) -> Void = {r in}) -> NSURLSessionDataTask?{
    let request = GetPostRequest(number: number)
    return Session.sendRequest(request, handler:handler)
  }
}


protocol EsaRequestType: RequestType {
}

extension EsaRequestType {
  var baseURL: NSURL {
    return NSURL(string: "https://api.esa.io/v1/teams")!
  }
  var HTTPHeaderFields:[String:String] {
    return ["Authorization":"Bearer " + Esa.sharedInstance.token]
  }
}
