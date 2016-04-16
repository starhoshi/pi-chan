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
import Dollar

class Esa{
  let token: String
  var currentTeam: String
  
  init(token: String, currentTeam: String) {
    self.token = token
    self.currentTeam = currentTeam
  }
  
  func teams(handler:(Result<Teams, APIError>) -> Void = {r in}) -> NSURLSessionDataTask?{
    let request = GetTeamsRequest(esa: self)
    return Session.sendRequest(request, handler:handler)
  }
  
  func team(name:String,handler:(Result<Team, APIError>) -> Void = {r in}) -> NSURLSessionDataTask?{
    let request = GetTeamRequest(esa: self, name: name)
    return Session.sendRequest(request, handler:handler)
  }
  
  func posts(page:Int? = nil, perPage:Int = 20, q:String? = nil, handler:(Result<Posts, APIError>) -> Void = {r in}) -> NSURLSessionDataTask?{
    let request = GetPostsRequest(esa: self, page: page, perPage:perPage, q:q)
    return Session.sendRequest(request, handler:handler)
  }
  
  func post(number:Int,handler:(Result<Post, APIError>) -> Void = {r in}) -> NSURLSessionDataTask?{
    let request = GetPostRequest(esa: self, number: number)
    return Session.sendRequest(request, handler:handler)
  }
  
  func newPost(postsParameters:PostsParameters,handler:(Result<Post, APIError>) -> Void = {r in}) -> NSURLSessionDataTask?{
    let request = PostPostsRequest(esa: self, postsParameters: postsParameters)
    return Session.sendRequest(request, handler:handler)
  }
  
  func patchPost(postsParameters:PostsParameters,handler:(Result<Post, APIError>) -> Void = {r in}) -> NSURLSessionDataTask?{
    let request = PatchPostsRequest(esa: self, postsParameters: postsParameters)
    return Session.sendRequest(request, handler:handler)
  }
  
  static func createHTTPHeaderFields(token:String) -> [String:String] {
    return ["Authorization":"Bearer " + token]
  }
  
  static func parseCategory(fullName:String) -> (category:String, name:String){
    var categoryArray = $.remove(fullName.componentsSeparatedByString("/"),value:"")
    let name = categoryArray.last
    categoryArray.removeLast()
    let category = categoryArray.joinWithSeparator("/")
    return (category:category, name:name!)
  }
}


protocol EsaRequestType: RequestType {
}

extension EsaRequestType {
  var baseURL: NSURL {
    return NSURL(string: "https://api.esa.io/v1/teams")!
  }
}
