//
//  Authorization.sample.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/23.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import OAuthSwift

// AuthorizationSample -> Authorization
struct AuthorizationSample{
  func oauth2(controller:UIViewController){
    let oauthswift = OAuth2Swift(
      consumerKey:"Esa Client ID",
      consumerSecret:"Esa Client Secret",
      authorizeUrl:"https://api.esa.io/oauth/authorize",
      accessTokenUrl:"https://api.esa.io/oauth/token",
      responseType:"code"
    )
    oauthswift.authorize_url_handler = SafariURLHandler(viewController: controller)
    oauthswift.authorizeWithCallbackURL(
      NSURL(string: "your-scheme://oauth-callback")!,
      scope: "read+write", state:"a7e567e2fb858f0e12838798016ee9cf8ccc778",
      success: { credential, response, parameters in
        print("response",response)
        print(credential.oauth_token)
      },
      failure: { error in
        print(error)
        print(error.localizedDescription)
      }
    )
  }
}