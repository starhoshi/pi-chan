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
  
  init(name: String) {
    self.name = name
  }
  
  var method: HTTPMethod {
    return .GET
  }
  
  var path: String {
    return "/teams/" + self.name
  }
  
  func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
    return try? decodeValue(object)
  }
}
