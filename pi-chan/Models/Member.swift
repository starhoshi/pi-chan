//
//  Member.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/17.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//


import Himotoki

struct Member {
  let name: String
  let screenName: String
  let icon: NSURL
  let email: String?
}

extension Member : Decodable {
  static func decode(e: Extractor) throws -> Member {
    
    return try Member(
      name: e <| "name",
      screenName: e <| "screen_name",
      icon: e <| "icon",
      email: e <|? "email"
    )
  }
}
