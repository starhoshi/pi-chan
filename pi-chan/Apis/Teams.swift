//
//  Team.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/03/30.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

struct GetTeamsRequest: EsaRequestType {
  typealias Response = Teams
  
  var method: HTTPMethod {
    return .GET
  }
  
  var path: String {
    return "/teams"
  }
  
  func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
    return try? decodeValue(object)
  }
}

/**
 *  Teams Model
 */
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
