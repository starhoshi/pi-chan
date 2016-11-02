//
//  team.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/03/27.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import Himotoki

struct Team {
  let description: String?
  let icon: NSURL
  let name: String
  let privacy: Privacy
  let url: NSURL
}

extension Team : Decodable {
  static func decode(_ e: Extractor) throws -> Team {
    let privacyString = try e.value("privacy") as String
    let privacy: Privacy = Privacy.init(rawValue: privacyString)!
    
    return try Team(
      description: e <|? "description",
      icon: e <| "icon",
      name: e <| "name",
      privacy: privacy,
      url: e <| "url"
    )
  }
}

enum Privacy: String{
  case Closed = "closed"
  case Open = "open"
}
