//
//  Team.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/03/30.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

struct GetTeamsRequest: EsaRequestType {
  typealias Response = Teams
  let token: String
  
  init(token: String) {
    self.token = token
  }
  
  var method: HTTPMethod {
    return .GET
  }
  
  var HTTPHeaderFields:[String:String] {
    return Esa.createHTTPHeaderFields(token)
  }
  
  var path: String {
    return "\(Esa.version)/teams/"
  }
  
  func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
    return try? decodeValue(object)
  }
}

