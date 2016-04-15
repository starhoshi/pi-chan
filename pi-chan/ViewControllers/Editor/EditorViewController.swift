//
//  EditorViewController.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/14.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import Font_Awesome_Swift
import UITextView_Placeholder
import SVProgressHUD

class EditorViewController: UIViewController {
  var post: Post?
  var client:Esa!
  
  @IBOutlet weak var navigationBar: UINavigationBar!
  @IBOutlet weak var cancelButton: UIButton!
  @IBOutlet weak var sendButton: UIButton!
  @IBOutlet weak var textView: UITextView!
  @IBOutlet weak var textField: UITextField!
  override func viewDidLoad() {
    super.viewDidLoad()
    sendButton.setFAIcon(.FASend, iconSize: 22, forState: .Normal)
    cancelButton.setFAIcon(.FAClose, iconSize: 22, forState: .Normal)
    setStatusBarBackground()
    setTextViewStyle()
    textView.text = post?.bodyMd
    textField.text = post?.fullName
    client = Esa(token: KeychainManager.getToken()!, currentTeam: KeychainManager.getTeamName()!)
  }
  
  func setTextViewStyle(){
    textView.placeholder = "# Input with Markdown"
    textView.layer.borderWidth = 1
    textView.layer.borderColor = UIColor.grayUITextFieldBorderColor().CGColor
    textView.layer.cornerRadius = 6
  }
  
  func setStatusBarBackground(){
    let statusBarBackground = UIView(frame: CGRectMake(0 , 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(UIApplication.sharedApplication().statusBarFrame)))
    statusBarBackground.backgroundColor = UIColor.esaGreen()
    self.view.addSubview(statusBarBackground)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @IBAction func post(sender: AnyObject) {
    SVProgressHUD.showWithStatus("Loading...")
    if let _ = post{
      patch()
    }else{
      newPost()
    }
  }
  
  func newPost(){
    client.newPost(post!){ result in
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
  
  func patch(){
    client.patchPost(post!){ result in
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
  
  @IBAction func close(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
