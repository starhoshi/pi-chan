//
//  Decodable+Extension.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/03.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import Himotoki

extension URL: Decodable {
    public static func decode(_ e: Extractor) throws -> URL {
        guard let url = try URL(string: String.decode(e)) else {
            throw typeMismatch("NSURL", actual: e.rawValue, keyPath: nil)
        }
        return url
    }
}
