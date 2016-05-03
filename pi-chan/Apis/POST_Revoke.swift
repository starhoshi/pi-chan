//
//  POST_Revoke.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/05/01.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import APIKit
import Himotoki

struct PostRevokeRequest: EsaRequestType {
  typealias Response = Revoke
  let esa: Esa

  init(esa: Esa) {
    self.esa = esa
  }

  var method: HTTPMethod {
    return .POST
  }

  var parameters: [String : AnyObject] {
    return ["token":esa.token]
  }

  var HTTPHeaderFields:[String:String] {
    return Esa.createHTTPHeaderFields(esa.token)
  }

  var path: String {
    return "oauth/revoke"
  }

  func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
    return try? decodeValue(object)
  }
}
