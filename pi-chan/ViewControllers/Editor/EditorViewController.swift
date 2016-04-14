//
//  EditorViewController.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/14.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

class EditorViewController: UIViewController {
  
  @IBOutlet weak var sendButton: UIBarButtonItem!
  @IBOutlet weak var cancelButton: UIBarButtonItem!
  override func viewDidLoad() {
    super.viewDidLoad()
    sendButton.setFAIcon(.FASend, iconSize: 22)
    cancelButton.setFAIcon(.FAClose, iconSize: 22)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func send(sender: AnyObject) {
  }
  
  @IBAction func close(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
