//
//  ProfileViewController.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/24.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import Font_Awesome_Swift
import SVProgressHUD
import SDCAlertView
import CRToast

class ProfileViewController: UIViewController {
  
  @IBOutlet weak var settingButton: UIBarButtonItem!
  @IBOutlet weak var userIcon: UIImageView!
  @IBOutlet weak var screenName: UILabel!
  @IBOutlet weak var mail: UILabel!
  @IBOutlet weak var name: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    settingButton.setFAIcon(.FAInfoCircle, iconSize: 22)
    loadUserApi()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  func loadUserApi(){
    SVProgressHUD.showWithStatus("Loading...")
    Esa(token: KeychainManager.getToken()!, currentTeam: KeychainManager.getTeamName()!).user(){ result in
      switch result {
      case .Success(let user):
        SVProgressHUD.showSuccessWithStatus("Success!")
        self.setUserData(user)
      case .Failure(let error):
        SVProgressHUD.showErrorWithStatus("Error!")
        log?.error("\(error)")
        Window.openLogin(self)
      }
    }
  }

  func setUserData(user:User){
    userIcon.kf_setImageWithURL(user.icon)
    userIcon.toCircle()
    screenName.text = user.screenName
    name.text = user.name
    mail.text = user.email
  }

  @IBAction func clickRevoke(sender: AnyObject) {
    let alert = AlertController(title: "ログアウト", message: "ログアウトしますか？", preferredStyle: .Alert)
    alert.addAction(AlertAction(title: "ログアウト", style: .Preferred){
      _ in self.loadRevokeApi()
      })
    alert.addAction(AlertAction(title: "キャンセル", style: .Default))
    alert.present()
  }

  func loadRevokeApi(){
    SVProgressHUD.showWithStatus("Loading...")
    log?.debug("\(KeychainManager.getToken())")
    Esa(token: KeychainManager.getToken()!, currentTeam: KeychainManager.getTeamName()!).revoke(){ result in
      switch result {
      case .Success(let success):
        SVProgressHUD.showSuccessWithStatus("Success!")
        log?.info("\(success)")
        CRToast.showSuccessNotificationFromBottom()
        Window.openLogin(self)
      case .Failure(let error):
        SVProgressHUD.showErrorWithStatus("Error!")
        log?.error("\(error)")
      }
    }
  }

}
