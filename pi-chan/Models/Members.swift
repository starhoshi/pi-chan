//
//  Members.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/17.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Himotoki

struct Members {
  let prevPage: Int?
  let nextPage: Int?
  let totalCount: Int
  let members: [Member]
}

extension Members : Decodable {
  static func decode(e: Extractor) throws -> Members {
    return try Members(
      prevPage: e <|? "prev_page",
      nextPage: e <|? "next_page",
      totalCount: e <| "total_count",
      members: e <|| "members"
    )
  }
}
