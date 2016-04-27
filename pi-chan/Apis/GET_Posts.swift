//
//  posts.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/04.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

struct GetPostsRequest: EsaRequestType {
  typealias Response = Posts
  let esa: Esa
  let page: Int
  let perPage: Int
  let q: String?
  
  init(esa: Esa, page:Int?, perPage:Int, q:String?) {
    self.esa = esa
    self.page = page == nil ? 1 : page!
    self.perPage = perPage
    self.q = q
  }
  
  var parameters: [String : AnyObject]{
    var params:[String : AnyObject] = ["page":page, "per_page":perPage]
    if let q = q{
      params["q"] = q
    }
    return params
  }
  
  var method: HTTPMethod {
    return .GET
  }
  
  var HTTPHeaderFields:[String:String] {
    return Esa.createHTTPHeaderFields(esa.token)
  }
  
  var path: String {
    return "teams/\(esa.currentTeam)/posts"
  }
  
  func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
    return try? decodeValue(object)
  }
}
