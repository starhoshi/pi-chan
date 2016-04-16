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

class LoginViewController: UIViewController {
  
  @IBOutlet weak var tokenField: UITextField!
  @IBOutlet weak var teamField: UITextField!
  @IBOutlet weak var keyIconLabel: UILabel!
  @IBOutlet weak var teamIconLabel: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    tokenField.text = KeychainManager.getToken()
    teamField.text = KeychainManager.getTeamName()
    keyIconLabel.FAIcon = .FAKey
    teamIconLabel.FAIcon = .FASmileO
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @IBAction func login(sender: AnyObject) {
    SVProgressHUD.showWithStatus("Loading...")
    
    Esa(token: tokenField.text!, currentTeam: teamField.text!).teams(){ result in
      switch result {
      case .Success(let teams):
        SVProgressHUD.showSuccessWithStatus("Success!")
        log?.info("\(teams)")
        KeychainManager.setToken(self.tokenField.text!)
        KeychainManager.setTeamName(self.teamField.text!)
      case .Failure(let error):
        SVProgressHUD.showErrorWithStatus("Error!")
        log?.error("\(error)")
      }
    }
  }
  
  @IBAction func close(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
