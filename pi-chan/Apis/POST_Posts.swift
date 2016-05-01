//
//  POST_Posts.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/15.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import APIKit
import Himotoki

struct PostPostsRequest: EsaRequestType {
  typealias Response = Post
  let esa: Esa
  let postsParameters: PostsParameters
  
  init(esa: Esa, postsParameters: PostsParameters) {
    self.esa = esa
    self.postsParameters = postsParameters
  }
  
  var method: HTTPMethod {
    return .POST
  }
  
  var parameters: [String : AnyObject] {
    return postsParameters.createParameters()
  }
  
  var HTTPHeaderFields:[String:String] {
    return Esa.createHTTPHeaderFields(esa.token)
  }
  
  var path: String {
    return "\(Esa.version)/teams/\(esa.currentTeam)/posts"
  }
  
  func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
    return try? decodeValue(object)
  }
}
