//
//  PreviewViewController.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/12.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import SVProgressHUD
import SafariServices

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
  }
  
  func loadApi(){
    SVProgressHUD.showWithStatus("Loading...")
    Esa(token: KeychainManager.getToken()!, currentTeam: KeychainManager.getTeamName()!).post(postNumber){ result in
      switch result {
      case .Success(let post):
        SVProgressHUD.showSuccessWithStatus("Success!")
        self.post = post
        self.navigationItem.title = post.name
        let js = "insert('\(post.bodyMd.replaceNewLine())');"
        log?.debug("\(js)")
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
  
  func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
    if navigationType == .Other{
      return true
    }else{
      let safari = SFSafariViewController(URL: request.URL!, entersReaderIfAvailable: true)
      presentViewController(safari, animated: true, completion: nil)
      return false
    }
    
  }
  
  @IBAction func openEditor(sender: AnyObject) {
    Window.openEditor(self, post: post)
  }
}
