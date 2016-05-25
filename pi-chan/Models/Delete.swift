//
//  Delete.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/05/26.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Himotoki

struct Delete {
}
extension Delete : Decodable {
  static func decode(e: Extractor) throws -> Delete {
    return Delete()
  }
}