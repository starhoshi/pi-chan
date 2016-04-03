//
//  Team.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/03.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

struct GetTeamRequest: EsaRequestType {
  typealias Response = Team
  let name: String
  
  init(name: String) {
    self.name = name
  }
  
  var method: HTTPMethod {
    return .GET
  }
  
  var path: String {
    return "/teams/" + self.name
  }
  
  func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
    return try? decodeValue(object)
  }
}

/**
 *  Team Model
 */
struct Team {
  let description: String
  let icon: NSURL
  let name: String
  let privacy: Privacy
  let url: NSURL
}

extension Team : Decodable {
  static func decode(e: Extractor) throws -> Team {
    let privacyString = try e.value("privacy") as String
    let privacy: Privacy = Privacy.init(rawValue: privacyString)!
    
    return try Team(
      description: e <| "description",
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