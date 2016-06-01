//
//  postParameters.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/16.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation

struct PostsParameters {
  let number: Int?
  let name: String
  let bodyMd: String?
  let tags: [String]?
  let category: String?
  let wip: Bool
  let message: String?
  let originalRevision: OriginalRevision?
  
  func createParameters() -> [String : AnyObject]{
    var post:[String : AnyObject] = [
      "name":name,
      "wip":wip
    ]
    if let bodyMd = bodyMd{
      post["body_md"] = bodyMd
    }
    if let tags = tags{
      post["tags"] = tags
    }
    if let category = category{
      post["category"] = category
    }
    if let message = message{
      post["message"] = message
    }
    return ["post":post]
  }
}

struct OriginalRevision {
  let bodyMd:String
  let number:Int
  let user:String
}