//
//  Revoke.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/05/01.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Himotoki

struct Revoke{
}

extension Revoke: Decodable {
  static func decode(e: Extractor) throws -> Revoke {
    return Revoke()
  }
}
