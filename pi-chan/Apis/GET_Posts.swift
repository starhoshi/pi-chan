//
//  posts.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/04.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

struct GetPostsRequest: EsaRequestType {
  typealias Response = Posts
  let token: String
  let currentTeam: String
  
  init(token: String, currentTeam:String) {
    self.token = token
    self.currentTeam = currentTeam
  }
  
  var method: HTTPMethod {
    return .GET
  }
  
  var HTTPHeaderFields:[String:String] {
    return Esa.createHTTPHeaderFields(token)
  }
  
  var path: String {
    return "\(self.currentTeam)/posts"
  }
  
  func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
    return try? decodeValue(object)
  }
}
