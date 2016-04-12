//
//  PreviewViewController.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/12.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import SVProgressHUD

class PreviewViewController: UIViewController {
  var postNumber:Int!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadApi()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func loadApi(){
    SVProgressHUD.showWithStatus("Loading...")
    Esa(token: KeychainManager.getToken()!, currentTeam: KeychainManager.getTeamName()!).post(postNumber){ result in
      switch result {
      case .Success(let post):
        SVProgressHUD.showSuccessWithStatus("Success!")
        log?.info("\(post)")
        self.navigationItem.title = post.name
      case .Failure(let error):
        SVProgressHUD.showErrorWithStatus("Error!")
        log?.error("\(error)")
      }
    }
  }
  
  
  
  
}
