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

class TeamsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
  
  var members:[Member] = []
  @IBOutlet weak var tableView: UITableView!
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
    let cell:PostTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("PostCell")! as! PostTableViewCell
    //    cell.setItems(members[indexPath.row])
    return cell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    performSegueWithIdentifier("HomeToPreview", sender: members[indexPath.row].screenName)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let previewViewController:PreviewViewController = segue.destinationViewController as! PreviewViewController
    previewViewController.postNumber = sender as! Int
  }
  
  func loadMembersApi(){
    SVProgressHUD.showWithStatus("Loading...")
    Esa(token: KeychainManager.getToken()!, currentTeam: KeychainManager.getTeamName()!).members(){ result in
      switch result {
      case .Success(let members):
        SVProgressHUD.showSuccessWithStatus("Success!")
        self.members = members.members
        self.tableView.reloadData()
      case .Failure(let error):
        SVProgressHUD.showErrorWithStatus("Error!")
        log?.error("\(error)")
        Window.openLogin(self)
      }
    }
  }
}
