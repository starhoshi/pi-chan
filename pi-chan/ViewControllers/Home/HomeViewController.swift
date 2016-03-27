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
    
    // Do any additional setup after loading the view.
    
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
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
  
  
}
