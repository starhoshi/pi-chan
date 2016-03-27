//
//  HomeViewController.swift
//  NoStoryboard
//
//  Created by Kensuke Hoshikawa on 2016/03/27.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  var stbNextView: UIStoryboard!
  var nvcNextViewCtrl: UINavigationController!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    stbNextView = UIStoryboard(name: "Login", bundle: nil)
    nvcNextViewCtrl = stbNextView!.instantiateViewControllerWithIdentifier("LoginNavigation") as! UINavigationController
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewDidAppear(animated: Bool) {
    log?.info("viewDidAppear")
  }
  
  @IBAction func nextView(sender: AnyObject) {
    self.presentViewController(nvcNextViewCtrl, animated:true, completion: nil)
  }
}
