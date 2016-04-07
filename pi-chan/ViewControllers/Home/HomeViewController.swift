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
  var posts:[Post] = []
  
  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    stbNextView = UIStoryboard(name: "Login", bundle: nil)
    nvcNextViewCtrl = stbNextView!.instantiateViewControllerWithIdentifier("LoginNavigation") as! UINavigationController
    initTableView()
    loadPostApi()
  }
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(true)
    if let indexPathForSelectedRow = tableView.indexPathForSelectedRow {
      tableView.deselectRowAtIndexPath(indexPathForSelectedRow, animated: true)
    }
  }
  
  func initTableView(){
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.emptyDataSetSource = self
    self.tableView.emptyDataSetDelegate = self
    let postCellNib:UINib = UINib(nibName: "PostTableViewCell", bundle: nil)
    tableView.registerNib(postCellNib, forCellReuseIdentifier: "PostCell")
    tableView.estimatedRowHeight = 123
    tableView.rowHeight = UITableViewAutomaticDimension
    self.tableView.tableFooterView = UIView()
    tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
      self!.tableView.dg_stopLoading()
      self!.loadPostApi()
      }, loadingView: View.refreshLoading())
    tableView.dg_setPullToRefreshFillColor(UIColor.esaGreen())
    tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
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
    return posts.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell:PostTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("PostCell")! as! PostTableViewCell
    cell.setItems(posts[indexPath.row])
    return cell
  }
  
  func loadPostApi(){
    SVProgressHUD.showWithStatus("Loading...")
    Esa(token: KeychainManager.getToken()!, currentTeam: KeychainManager.getTeamName()!).posts(){ result in
      switch result {
      case .Success(let posts):
        SVProgressHUD.showSuccessWithStatus("Success!")
        log?.info("\(posts)")
        self.posts = posts.posts
        self.tableView.reloadData()
      case .Failure(let error):
        SVProgressHUD.showErrorWithStatus("Error!")
        log?.error("\(error)")
      }
    }
  }
}
