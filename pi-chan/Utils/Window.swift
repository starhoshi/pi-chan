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
    let loginStoryboard = UIStoryboard(name: "Authorization", bundle: nil)
    let login = loginStoryboard.instantiateViewControllerWithIdentifier("AuthorizationNavigation") as! UINavigationController
    controller.presentViewController(login, animated:true, completion: nil)
  }
  static func openEditor(controller : UIViewController, post: Post?) {
    let editorStoryboard = UIStoryboard(name: "Editor", bundle: nil)
    let editorController = editorStoryboard.instantiateViewControllerWithIdentifier("EditorViewController") as! EditorViewController
    editorController.post = post
    controller.presentViewController(editorController, animated:true, completion: nil)
  }
}