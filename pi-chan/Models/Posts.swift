//
//  Posts.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/05.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import Himotoki

struct Posts {
  let prevPage: Int?
  let nextPage: Int?
  let totalCount: Int
  let posts: [Post]
}

extension Posts : Decodable {
  static func decode(e: Extractor) throws -> Posts {
    return try Posts(
      prevPage: e <|? "prev_page",
      nextPage: e <|? "next_page",
      totalCount: e <| "total_count",
      posts: e <|| "posts"
    )
  }
}
