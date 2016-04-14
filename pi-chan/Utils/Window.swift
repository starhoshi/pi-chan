//
//  Window.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/14.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit

struct Window{
  static func openLogin(controller : UIViewController) {
    let loginStoryboard = UIStoryboard(name: "Login", bundle: nil)
    let login = loginStoryboard.instantiateViewControllerWithIdentifier("LoginNavigation") as! UINavigationController
    controller.presentViewController(login, animated:true, completion: nil)
  }
  static func openEditor(controller : UIViewController) {
    let editorStoryboard = UIStoryboard(name: "Editor", bundle: nil)
    let editor = editorStoryboard.instantiateViewControllerWithIdentifier("EditorNavigation") as! UINavigationController
    controller.presentViewController(editor, animated:true, completion: nil)
  }
}