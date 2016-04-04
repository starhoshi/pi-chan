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
  
  var method: HTTPMethod {
    return .GET
  }
  
  var path: String {
    return "/teams"
  }
  
  func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
    return try? decodeValue(object)
  }
}

