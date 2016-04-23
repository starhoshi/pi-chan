//
//  LoginViewController.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/03/28.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import APIKit
import SVProgressHUD
import Font_Awesome_Swift
import SDCAlertView

class AuthorizationViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @IBAction func login(sender: AnyObject) {
    SVProgressHUD.showWithStatus("Loading...")
    Esa.authorization(self)
  }
  
  @IBAction func close(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
