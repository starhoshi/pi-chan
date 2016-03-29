//
//  Team.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/03/30.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import APIKit

protocol GitHubRequestType: RequestType {
  
}

extension GitHubRequestType {
  var baseURL: NSURL {
    return NSURL(string: "https://api.github.com")!
  }
}

struct GetRateLimitRequest: GitHubRequestType {
  typealias Response = RateLimit
  
  var method: HTTPMethod {
    return .GET
  }
  
  var path: String {
    return "/rate_limit"
  }
  
  func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
    guard let dictionary = object as? [String: AnyObject] else {
      return nil
    }
    
    guard let rateLimit = RateLimit(dictionary: dictionary) else {
      return nil
    }
    
    return rateLimit
  }
}

struct RateLimit {
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