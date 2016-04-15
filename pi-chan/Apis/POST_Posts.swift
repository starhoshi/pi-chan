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
  let post: Post
  
  init(esa: Esa, post: Post) {
    self.esa = esa
    self.post = post
  }
  
  var method: HTTPMethod {
    return .POST
  }
  
  var parameters: [String : AnyObject] {
    let post = [
      "name":self.post.name,
      "body_md":self.post.bodyMd,
      "tags":self.post.tags!,
      "category":self.post.category!,
      "wip":self.post.wip,
      "message":"message"
    ]
    
    return ["post":post]
  }
  
  var HTTPHeaderFields:[String:String] {
    return Esa.createHTTPHeaderFields(esa.token)
  }
  
  var path: String {
    return "\(esa.currentTeam)/posts"
  }
  
  func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
    return try? decodeValue(object)
  }
}
