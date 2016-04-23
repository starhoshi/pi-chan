//
//  Window.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/14.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import OAuthSwift

struct Window{
  static func openLogin(controller : UIViewController) {
    let oauthswift = OAuth2Swift(
      consumerKey:"f455cc2f4167190974cf9747bba8d826cf85f7889e1d8208b5cd7fac41444797",
      consumerSecret:"51fccf218905fe80be511953eaadc71b7b19218dcca6f9beb62b2067de8e82f8",
      authorizeUrl:"https://api.esa.io/oauth/authorize",
      accessTokenUrl:"https://api.esa.io/oauth/token",
      responseType:"code"
    )
    oauthswift.authorize_url_handler = SafariURLHandler(viewController: controller)
    oauthswift.authorizeWithCallbackURL(
      NSURL(string: "pi-chan://oauth-callback")!,
      scope: "read+write", state:"a7e567e2fb858f0e12838798016ee9cf8ccc778",
      success: { credential, response, parameters in
        print(credential.oauth_token)
      },
      failure: { error in
        print(error)
        print(error.localizedDescription)
      }
    )
    //    let loginStoryboard = UIStoryboard(name: "Login", bundle: nil)
    //    let login = loginStoryboard.instantiateViewControllerWithIdentifier("LoginNavigation") as! UINavigationController
    //    controller.presentViewController(login, animated:true, completion: nil)
  }
  static func openEditor(controller : UIViewController, post: Post?) {
    let editorStoryboard = UIStoryboard(name: "Editor", bundle: nil)
    let editorController = editorStoryboard.instantiateViewControllerWithIdentifier("EditorViewController") as! EditorViewController
    editorController.post = post
    controller.presentViewController(editorController, animated:true, completion: nil)
  }
}