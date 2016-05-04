//
//  GET_Members.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/17.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import APIKit
import Himotoki

struct GetMembersRequest: EsaRequestType {
  typealias Response = Members
  let esa: Esa
  let page: Int
  let perPage: Int
  
  init(esa: Esa, page:Int?, perPage:Int) {
    self.esa = esa
    self.page = page == nil ? 1 : page!
    self.perPage = perPage
  }

  var parameters: [String : AnyObject]{
    return ["page":page, "per_page":perPage]
  }
  
  var method: HTTPMethod {
    return .GET
  }
  
  var HTTPHeaderFields:[String:String] {
    return Esa.createHTTPHeaderFields(esa.token)
  }
  
  var path: String {
    return "\(Esa.version)/teams/\(esa.currentTeam)/members"
  }
  
  func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
    return try? decodeValue(object)
  }
}
