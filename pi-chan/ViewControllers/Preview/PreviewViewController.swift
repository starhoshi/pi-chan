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
import Cent

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

  override func viewDidAppear(animated: Bool) {
    if Global.fromLogin || Global.posted {
      loadApi()
      Global.fromLogin = false
      Global.posted = false
    }
  }

  func loadApi(){
    SVProgressHUD.showWithStatus("Loading...")
    Esa(token: KeychainManager.getToken()!, currentTeam: KeychainManager.getTeamName()!).post(postNumber){ result in
      SVProgressHUD.dismiss()
      switch result {
      case .Success(let post):
        self.post = post
        self.navigationItem.title = post.name
        let md = post.bodyMd.replaceNewLine()
        let js = "insert('\(md.stringByReplacingOccurrencesOfString("'",withString: "\\'"))');"
        log?.debug("\(js)")
        self.webView.stringByEvaluatingJavaScriptFromString(js)
      case .Failure(let error):
        ErrorHandler.errorAlert(error, controller: self)
      }
    }
  }
  
  func webViewDidFinishLoad(webView: UIWebView) {
    loadApi()
  }
  
  func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
    if request.URL!.absoluteString =~ "file:///posts" {
      goPreviewToPreview(request.URL!)
      return false
    }
    if navigationType == .Other{
      return true
    }else{
      let safari = SFSafariViewController(URL: request.URL!, entersReaderIfAvailable: true)
      presentViewController(safari, animated: true, completion: nil)
      return false
    }
  }
  
  func goPreviewToPreview(url:NSURL){
    let nextPostNumber = Int(url.absoluteString.stringByReplacingOccurrencesOfString("file:///posts/",withString: ""))!
    performSegueWithIdentifier("PreviewToPreview", sender: nextPostNumber)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let previewViewController:PreviewViewController = segue.destinationViewController as! PreviewViewController
    previewViewController.postNumber = sender as! Int
  }
  
  @IBAction func openEditor(sender: AnyObject) {
    Window.openEditor(self, post: post)
  }
}
