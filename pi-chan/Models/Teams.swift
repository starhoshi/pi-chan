//
//  Teams.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/05.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import Himotoki

struct Teams {
  let prevPage: Int?
  let nextPage: Int?
  let totalCount: Int
  let teams: [Team]
}

extension Teams : Decodable {
  static func decode(e: Extractor) throws -> Teams {
    return try Teams(
      prevPage: e <|? "prev_page",
      nextPage: e <|? "next_page",
      totalCount: e <| "total_count",
      teams: e <|| "teams"
    )
  }
}