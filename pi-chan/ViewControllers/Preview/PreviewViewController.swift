//
//  PreviewViewController.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/12.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import SVProgressHUD

class PreviewViewController: UIViewController, UIWebViewDelegate {
  var postNumber:Int!
  let localHtml = NSBundle.mainBundle().pathForResource("md", ofType: "html")!
  var post:Post?
  
  @IBOutlet weak var webView: UIWebView!
  @IBOutlet weak var rightBarButton: UIBarButtonItem!
  override func viewDidLoad() {
    super.viewDidLoad()
    rightBarButton.setFAIcon(.FAEdit, iconSize: 22)
    
    let req = NSURLRequest(URL: NSURL(string: localHtml)!)
    webView.delegate = self;
    webView.loadRequest(req)
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
        self.post = post
        log?.info("\(post)")
        self.navigationItem.title = post.name
        let md = post.bodyMd.stringByReplacingOccurrencesOfString("\r\n", withString: "\\n")
        let js = "insert('\(md)');"
        self.webView.stringByEvaluatingJavaScriptFromString(js)
      case .Failure(let error):
        SVProgressHUD.showErrorWithStatus("Error!")
        log?.error("\(error)")
      }
    }
  }
  
  func webViewDidFinishLoad(webView: UIWebView) {
    loadApi()
  }
  @IBAction func openEditor(sender: AnyObject) {
    let editor = Editor()
    editor.newPost = false
    editor.md = post?.bodyMd
    editor.postNumber = post?.number
    editor.fullName = post?.fullName
    Window.openEditor(self, editor: editor)
  }
}
