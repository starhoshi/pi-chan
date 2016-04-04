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
  
  var method: HTTPMethod {
    return .GET
  }
  
  var path: String {
    return "post"
  }
  
  func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
    return try? decodeValue(object)
  }
}

