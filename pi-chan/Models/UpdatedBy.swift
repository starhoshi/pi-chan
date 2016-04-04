//
//  UpdatedBy.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/05.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import Himotoki

struct UpdatedBy {
  let name: String
  let screenName: String
  let icon: NSURL
}

extension UpdatedBy : Decodable {
  static func decode(e: Extractor) throws -> UpdatedBy {
    return try UpdatedBy(
      name: e <| "name",
      screenName: e <| "screen_name",
      icon: e <| "icon"
    )
  }
}
