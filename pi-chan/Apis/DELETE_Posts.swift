//
//  DELETE_Posts.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/05/25.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import APIKit
import Himotoki

struct DeletePostsRequest: EsaRequestType {
  typealias Response = Delete
  let esa: Esa
  let postNumber: Int
  
  init(esa: Esa, postNumber: Int) {
    self.esa = esa
    self.postNumber = postNumber
  }
  
  var method: HTTPMethod {
    return .DELETE
  }
  
  var HTTPHeaderFields:[String:String] {
    return Esa.createHTTPHeaderFields(esa.token)
  }
  
  var path: String {
    return "\(Esa.version)/teams/\(esa.currentTeam)/posts/\(postNumber)"
  }
  
  func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
    return try? decodeValue(object)
  }
}
