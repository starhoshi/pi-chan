//
//  User.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/28.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Himotoki

struct User{
  let id: Int
  let name: String
  let screenName: String
  let createdAt: String
  let updatedAt: String
  let icon: NSURL
  let email: String
}

extension User : Decodable {
  static func decode(e: Extractor) throws -> User {
    return try User(
      id: e <| "id",
      name: e <| "name",
      screenName: e <| "screen_name",
      createdAt: e <| "createdAt",
      updatedAt: e <| "updatedAt",
      icon: e <| "icon",
      email: e <| "email"
    )
  }
}