//
//  HomeViewController.swift
//  NoStoryboard
//
//  Created by Kensuke Hoshikawa on 2016/03/27.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import SVProgressHUD

class HomeViewController: UIViewController {
  
  var stbNextView: UIStoryboard!
  var nvcNextViewCtrl: UINavigationController!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    stbNextView = UIStoryboard(name: "Login", bundle: nil)
    nvcNextViewCtrl = stbNextView!.instantiateViewControllerWithIdentifier("LoginNavigation") as! UINavigationController
    loadPostApi()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewDidAppear(animated: Bool) {
    log?.info("viewDidAppear")
  }
  
  func loadPostApi(){
    SVProgressHUD.showWithStatus("Loading...")
    Esa.sharedInstance.posts(){ result in
      switch result {
      case .Success(let posts):
        SVProgressHUD.showSuccessWithStatus("Success!")
        log?.info("\(posts)")
      case .Failure(let error):
        SVProgressHUD.showErrorWithStatus("Error!")
        log?.error("\(error)")
      }
    }
  }
}
