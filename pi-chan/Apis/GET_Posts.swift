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
  let esa: Esa
  
  init(esa: Esa) {
    self.esa = esa
  }
  
  var method: HTTPMethod {
    return .GET
  }
  
  var HTTPHeaderFields:[String:String] {
    return Esa.createHTTPHeaderFields(esa.token)
  }
  
  var path: String {
    return "\(esa.currentTeam)/posts"
  }
  
  func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
    return try? decodeValue(object)
  }
}
