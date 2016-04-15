//
//  sharingUrl.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/15.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Himotoki

struct SharingUrls{
  let html: NSURL?
  let slides: NSURL?
}

extension SharingUrls : Decodable {
  static func decode(e: Extractor) throws -> SharingUrls {
    return try SharingUrls(
      html: e <|? "html",
      slides: e <|? "slides"
    )
  }
}
