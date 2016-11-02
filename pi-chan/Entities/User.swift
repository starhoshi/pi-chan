//
//  User.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/28.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Himotoki

struct User {
    let id: Int
    let name: String
    let screenName: String
    let createdAt: String
    let updatedAt: String
    let icon: URL
    let email: String
}

extension User: Decodable {
    static func decode(_ e: Extractor) throws -> User {
        return try User(
            id: e <| "id",
            name: e <| "name",
            screenName: e <| "screen_name",
            createdAt: e <| "created_at",
            updatedAt: e <| "updated_at",
            icon: e <| "icon",
            email: e <| "email"
        )
    }
}
