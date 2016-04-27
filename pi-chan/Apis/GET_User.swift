//
//  GET_User.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/28.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import APIKit
import Himotoki

struct GetUserRequest: EsaRequestType {
  typealias Response = User
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
    return "/user"
  }

  func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
    return try? decodeValue(object)
  }
}