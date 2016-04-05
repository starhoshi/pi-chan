//
//  HomeViewController.swift
//  NoStoryboard
//
//  Created by Kensuke Hoshikawa on 2016/03/27.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import SVProgressHUD
import DGElasticPullToRefresh
import DZNEmptyDataSet

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
  
  var stbNextView: UIStoryboard!
  var nvcNextViewCtrl: UINavigationController!
  
  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    stbNextView = UIStoryboard(name: "Login", bundle: nil)
    nvcNextViewCtrl = stbNextView!.instantiateViewControllerWithIdentifier("LoginNavigation") as! UINavigationController
    initTableView()
    loadPostApi()
  }
  
  func initTableView(){
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.emptyDataSetSource = self
    self.tableView.emptyDataSetDelegate = self
    self.tableView.tableFooterView = UIView()
    tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
      self?.tableView.dg_stopLoading()
      }, loadingView: View.refreshLoading())
    tableView.dg_setPullToRefreshFillColor(UIColor.whiteColor())
    tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
  }
  
  override func viewDidAppear(animated: Bool) {
    log?.info("viewDidAppear")
  }
  
  func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
    return NSAttributedString(string: "取得結果0件\nもしくは取得失敗")
  }
  
  func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
    return NSAttributedString(string: "タップして再取得")
  }
  
  func emptyDataSetDidTapView(scrollView: UIScrollView!) {
    self.loadPostApi()
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {
    return 0
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
  
  func loadPostApi(){
    SVProgressHUD.showWithStatus("Loading...")
    Esa.sharedInstance.posts(){ result in
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
}
