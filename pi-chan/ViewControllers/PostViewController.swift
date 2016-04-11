//
//  Post.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/11.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import SVProgressHUD
import PagingMenuController

class PostViewController: UIViewController, PagingMenuControllerDelegate {
  var postNumber:Int!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadApi()
    
    let previewViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PreviewViewController") as! PreviewViewController
    previewViewController.title = "Preview"
    let editViewController = self.storyboard?.instantiateViewControllerWithIdentifier("EditViewController") as! EditViewController
    editViewController.title = "Editor"
    
    let viewControllers = [previewViewController, editViewController]
    
    let options = PagingMenuOptions()
    options.menuHeight = 30
    options.menuPosition = .Top
    options.animationDuration = 0.1
    options.menuDisplayMode = .SegmentedControl
    
    let pagingMenuController = PagingMenuController(viewControllers: viewControllers, options: options)
    self.addChildViewController(pagingMenuController)
    self.view.addSubview(pagingMenuController.view)
    pagingMenuController.didMoveToParentViewController(self)
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