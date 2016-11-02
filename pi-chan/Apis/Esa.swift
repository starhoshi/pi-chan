//
//  esa.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/03/27.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import APIKit
import Result
import Dollar
import OAuthSwift

class Esa {
    static let version = "v1"
    let token: String
    var currentTeam: String

    init(token: String, currentTeam: String) {
        self.token = token
        let request = PostRevokeRequest(esa: self)
        Session.send(request) {
            self.currentTeam = currentTeam
        }

        // FIXME: change success, failure to handler
        static func authorization(controller: UIViewController, success: (_ credential: OAuthSwiftCredential) -> Void, failure: (_ error: NSError) -> Void) {
            Authorization.oauth2(controller, success: success, failure: failure)
        }

        func revoke(handler: @escaping (Result<Revoke, SessionTaskError>) -> Void = { r in }) -> SessionTask? {
            let request = PostRevokeRequest(esa: self)
            return Session.send(request, handler: handler)
        }

        static func teams(token: String, handler: (Result<Teams, SessionTaskError>) -> Void = { r in }) -> SessionTask? {
            let request = GetTeamsRequest(token: token)
            return Session.send(request, handler: handler)
        }

        func team(name: String, handler: (Result<Team, SessionTaskError>) -> Void = { r in }) -> SessionTask? {
            let request = GetTeamRequest(esa: self, name: name)
            return Session.sendRequest(request, handler: handler)
        }

        func user(handler: (Result<User, SessionTaskError>) -> Void = { r in }) -> SessionTask? {
            let request = GetUserRequest(esa: self)
            return Session.sendRequest(request, handler: handler)
        }

        func posts(page: Int? = nil, perPage: Int = 20, q: String? = nil, handler: (Result<Posts, SessionTaskError>) -> Void = { r in }) -> SessionTask? {
            let request = GetPostsRequest(esa: self, page: page, perPage: perPage, q: q)
            return Session.sendRequest(request, handler: handler)
        }

        func post(number: Int, handler: (Result<Post, SessionTaskError>) -> Void = { r in }) -> SessionTask? {
            let request = GetPostRequest(esa: self, number: number)
            return Session.sendRequest(request, handler: handler)
        }

        func newPost(postsParameters: PostsParameters, handler: (Result<Post, SessionTaskError>) -> Void = { r in }) -> SessionTask? {
            let request = PostPostsRequest(esa: self, postsParameters: postsParameters)
            return Session.sendRequest(request, handler: handler)
        }

        func patchPost(postsParameters: PostsParameters, handler: (Result<Post, SessionTaskError>) -> Void = { r in }) -> SessionTask? {
            let request = PatchPostsRequest(esa: self, postsParameters: postsParameters)
            return Session.sendRequest(request, handler: handler)
        }

        func deletePost(postNumber: Int, handler: (Result<Delete, SessionTaskError>) -> Void = { r in }) -> SessionTask? {
            let request = DeletePostsRequest(esa: self, postNumber: postNumber)
            return Session.sendRequest(request, handler: handler)
        }

        func members(page: Int? = nil, perPage: Int = 20, handler: (Result<Members, SessionTaskError>) -> Void = { r in }) -> SessionTask? {
            let request = GetMembersRequest(esa: self, page: page, perPage: perPage)
            return Session.sendRequest(request, handler: handler)
        }

        static func createHTTPHeaderFields(token: String) -> [String: String] {
            return ["Authorization": "Bearer " + token]
        }

        static func parseCategory(fullName: String) -> (category: String, name: String) {
//        var categoryArray = $.remove(fullName.componentsSeparatedByString("/"), value: "")
//        let name = categoryArray.last
//        categoryArray.removeLast()
//        let category = categoryArray.joinWithSeparator("/")
            return (category: "", name: "")
        }
    }

    protocol EsaRequestType: Request {
    }

    extension EsaRequestType {
        var baseURL: NSURL {
            return NSURL(string: "https://api.esa.io")!
        }
    }
