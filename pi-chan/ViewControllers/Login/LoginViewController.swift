//
//  LoginViewController.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/03/28.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import APIKit

class LoginViewController: UIViewController {
  
  @IBOutlet weak var tokenField: UITextField!
  @IBOutlet weak var teamField: UITextField!
  override func viewDidLoad() {
    super.viewDidLoad()
    tokenField.text = KeychainManager.getToken()
    teamField.text = KeychainManager.getTeamName()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func login(sender: AnyObject) {
    KeychainManager.setToken(tokenField.text!)
    KeychainManager.setTeamName(teamField.text!)
    
    let request = GetRateLimitRequest()
    
    Session.sendRequest(request) { result in
      switch result {
      case .Success(let rateLimit):
        print("count: \(rateLimit.count)")
        print("resetDate: \(rateLimit.resetDate)")
        
      case .Failure(let error):
        print("error: \(error)")
      }
    }
    
  }
  @IBAction func close(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
