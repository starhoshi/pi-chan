//
//  Constants.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/05/03.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation


struct Constants {
  struct ESA {
    struct URL {
      static let INDEX = NSURL(string:"https://esa.io")!
      static let TERMS = NSURL(string: "https://docs.esa.io/posts/5")!
    }
  }

  struct PICHAN {
    static let STORE_ID = "1107328970"
    static let SCHEME = "pi-chan://"

    struct URL {
      static let GITHUB = NSURL(string:"https://github.com/starhoshi/pi-chan")!
      static let ITUNES = NSURL(string: "https://itunes.apple.com/us/app/pichan-unofficial-esa.io-client/id1107328970?l=ja&ls=1&mt=8")!
      static let ITMS = NSURL(string:"itms-apps://itunes.apple.com/app/id1107328970")!
      static let ITMS_REVIEW = NSURL(string:"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=id1107328970")!
    }
  }

  struct STARHOSHI {
    struct URL {
      static let GITHUB = NSURL(string: "https://github.com/starhoshi")!
      static let TWITTER = NSURL(string: "https://twitter.com/star__hoshi")!
    }
  }
}
