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
    return ""
  }
  
  func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
    return try? decodeValue(object)
  }
}

