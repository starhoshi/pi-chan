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
import SCLAlertView
import SDCAlertView

class EditorViewController: UIViewController {
  var post: Post?
  var client:Esa!
  var postsParameters: PostsParameters!
  
  @IBOutlet weak var navigationBar: UINavigationBar!
  @IBOutlet weak var navigationTitle: UILabel!
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
    navigationTitle.text = (post == nil) ? "New Posts" : post?.name
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
    if (textField.text != nil && textField.text != "" && textField.text != "/" ){
      showAlert()
    } else {
      AlertController.alertWithTitle("入力エラー", message: "タイトルは必ず入力してください。", actionTitle: "OK")
    }
  }
  
  func showAlert(){
    let alertTitle = post == nil ? "Create post.":"Update post."
    let alert = SCLAlertView()
    let commitMessage = alert.addTextField("Enter your name")
    commitMessage.text = alertTitle
    alert.addButton("Save as WIP") {
      self.callPostApi(true, commitMessage: commitMessage.text)
    }
    alert.addButton("Ship It!") {
      self.callPostApi(false, commitMessage: commitMessage.text)
    }
    alert.showEdit(
      alertTitle,
      subTitle: "Write explaining this change.(Optional)",
      closeButtonTitle: "Cancel",
      colorStyle: 0x0a9b94
    )
  }
  
  func callPostApi(wip:Bool, commitMessage:String?){
    self.postsParameters = self.createPostsParameters(wip, commitMessage: commitMessage)
    SVProgressHUD.showWithStatus("Loading...")
    if let _ = post{
      patch()
    }else{
      newPost()
    }
  }
  
  func newPost(){
    client.newPost(postsParameters){ result in
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
    client.patchPost(postsParameters){ result in
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
  
  func createPostsParameters(wip:Bool, commitMessage:String?) -> PostsParameters{
    let category = Esa.parseCategory(textField.text!)
    return PostsParameters(
      number: post?.number,
      name: category.name,
      bodyMd: textView.text,
      tags: post?.tags,
      category: category.category,
      wip: wip,
      message: commitMessage,
      originalRevision: nil
    )
  }
  
  
  @IBAction func close(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
