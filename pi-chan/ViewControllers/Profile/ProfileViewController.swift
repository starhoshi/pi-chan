//
//  ProfileViewController.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/24.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

class ProfileViewController: UIViewController {
  
  @IBOutlet weak var settingButton: UIBarButtonItem!
  override func viewDidLoad() {
    super.viewDidLoad()
    settingButton.setFAIcon(.FAInfoCircle, iconSize: 22)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}
