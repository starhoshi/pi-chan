//
//  Team.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/03.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

struct GetTeamRequest: EsaRequestType {
  typealias Response = Team
  let name: String
  let token: String
  
  init(token: String, name: String) {
    self.name = name
    self.token = token
  }
  
  var method: HTTPMethod {
    return .GET
  }
  
  var HTTPHeaderFields:[String:String] {
    return Esa.createHTTPHeaderFields(token)
  }
  
  var path: String {
    return "/teams/" + self.name
  }
  
  func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
    return try? decodeValue(object)
  }
}
