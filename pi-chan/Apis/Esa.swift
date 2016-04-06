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
  let token: String
  var currentTeam: String
  
  init(token: String, currentTeam: String) {
    self.token = token
    self.currentTeam = currentTeam
  }
  
  func teams(handler:(Result<Teams, APIError>) -> Void = {r in}) -> NSURLSessionDataTask?{
    let request = GetTeamsRequest(token: token)
    return Session.sendRequest(request, handler:handler)
  }
  
  func team(name:String,handler:(Result<Team, APIError>) -> Void = {r in}) -> NSURLSessionDataTask?{
    let request = GetTeamRequest(token: token, name: name)
    return Session.sendRequest(request, handler:handler)
  }
  
  func posts(handler:(Result<Posts, APIError>) -> Void = {r in}) -> NSURLSessionDataTask?{
    let request = GetPostsRequest(token: token, currentTeam: currentTeam)
    return Session.sendRequest(request, handler:handler)
  }
  
  func post(number:Int,handler:(Result<Post, APIError>) -> Void = {r in}) -> NSURLSessionDataTask?{
    let request = GetPostRequest(token: token, number: number)
    return Session.sendRequest(request, handler:handler)
  }
  
  static func createHTTPHeaderFields(token:String) -> [String:String] {
    return ["Authorization":"Bearer " + token]
  }
}


protocol EsaRequestType: RequestType {
}

extension EsaRequestType {
  var baseURL: NSURL {
    return NSURL(string: "https://api.esa.io/v1/teams")!
  }
}
