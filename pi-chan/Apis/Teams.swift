//
//  Team.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/03/30.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import APIKit

struct GetTeamsLimitRequest: EsaRequestType {
  typealias Response = Teams
  
  var method: HTTPMethod {
    return .GET
  }
  
  var path: String {
    return "/teams"
  }
  
  func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
    guard let dictionary = object as? [String: AnyObject] else {
      return nil
    }
    
    guard let rateLimit = Teams(dictionary: dictionary) else {
      return nil
    }
    
    return rateLimit
  }
}

struct Teams {
  let count: Int
  let resetDate: NSDate
  
  init?(dictionary: [String: AnyObject]) {
    guard let count = dictionary["rate"]?["limit"] as? Int else {
      return nil
    }
    
    guard let resetDateString = dictionary["rate"]?["reset"] as? NSTimeInterval else {
      return nil
    }
    
    self.count = count
    self.resetDate = NSDate(timeIntervalSince1970: resetDateString)
  }
}