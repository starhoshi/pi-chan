//
//  TeamsViewController.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/03/27.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import SVProgressHUD
import DGElasticPullToRefresh
import DZNEmptyDataSet
import Cent

class MembersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  var members:[Member] = []
  override func viewDidLoad() {
    super.viewDidLoad()
    initTableView()
    loadMembersApi()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(true)
    if let indexPathForSelectedRow = tableView.indexPathForSelectedRow {
      tableView.deselectRowAtIndexPath(indexPathForSelectedRow, animated: true)
    }
  }

  override func viewDidAppear(animated: Bool) {
    if Global.fromLogin {
      loadMembersApi()
      Global.fromLogin = false
    }
  }

  func initTableView(){
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.emptyDataSetSource = self
    self.tableView.emptyDataSetDelegate = self
    let memberCellNib:UINib = UINib(nibName: "MemberTableViewCell", bundle: nil)
    tableView.registerNib(memberCellNib, forCellReuseIdentifier: "MemberCell")
    tableView.estimatedRowHeight = 80
    tableView.tableFooterView = UIView()
    tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
      self!.tableView.dg_stopLoading()
      self!.loadMembersApi()
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
    loadMembersApi()
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {
    return members.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell:MemberTableViewCell = tableView.dequeueReusableCellWithIdentifier("MemberCell")! as! MemberTableViewCell
    cell.setItems(members[indexPath.row])
    return cell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    performSegueWithIdentifier("MembersToPosts", sender: "@" + members[indexPath.row].screenName)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let postsViewController:PostsViewController = segue.destinationViewController as! PostsViewController
    postsViewController.searchText = sender as? String
  }
  
  func loadMembersApi(){
    SVProgressHUD.showWithStatus("Loading...")
    Esa(token: KeychainManager.getToken()!, currentTeam: KeychainManager.getTeamName()!).members(){ result in
      SVProgressHUD.dismiss()
      switch result {
      case .Success(let members):
        self.members = members.members
        self.tableView.reloadData()
      case .Failure(let error):
        ErrorHandler.errorAlert(error, controller: self)
      }
    }
  }
}
