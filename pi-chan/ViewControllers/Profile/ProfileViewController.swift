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

class ProfileViewController: UIViewController {
  
  @IBOutlet weak var settingButton: UIBarButtonItem!
  @IBOutlet weak var userIcon: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    settingButton.setFAIcon(.FAGear, iconSize: 22)
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
  }

}
