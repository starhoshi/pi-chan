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

class EditorViewController: UIViewController {
  var post: Post?
  
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
  }
  
  @IBAction func close(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
