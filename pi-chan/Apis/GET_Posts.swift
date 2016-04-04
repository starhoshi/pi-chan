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
  
  var method: HTTPMethod {
    return .GET
  }
  
  var path: String {
    return "\(Esa.sharedInstance.currentTeam)/posts"
  }
  
  func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
    return try? decodeValue(object)
  }
}
