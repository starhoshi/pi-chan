//
//  GET posts:{post_number}.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/05.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

struct GetPostRequest: EsaRequestType {
  typealias Response = Post
  let number: Int
  let esa: Esa
  
  init(esa: Esa, number: Int) {
    self.esa = esa
    self.number = number
  }
  
  var method: HTTPMethod {
    return .GET
  }
  
  var HTTPHeaderFields:[String:String] {
    return Esa.createHTTPHeaderFields(esa.token)
  }
  
  var path: String {
    return "teams/\(esa.currentTeam)/posts/\(number)"
  }
  
  func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
    return try? decodeValue(object)
  }
}

