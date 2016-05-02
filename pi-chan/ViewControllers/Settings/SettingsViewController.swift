//
//  SettingsViewController.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/03/27.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var closeButton: UIBarButtonItem!
  override func viewDidLoad() {
    super.viewDidLoad()
    initTableView()
    closeButton.setFAIcon(.FAClose, iconSize: 22)
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
    let memberCellNib:UINib = UINib(nibName: "SettingTableViewCell", bundle: nil)
    tableView.registerNib(memberCellNib, forCellReuseIdentifier: "SettingCell")
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return sectionList.count
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sectionList[section].cellContents.count
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return sectionList[section].title
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("SettingCell", forIndexPath: indexPath) as! SettingTableViewCell
    cell.settingViewController = self
    cell.setItems(sectionList[indexPath.section].cellContents[indexPath.row])
    return cell
  }

  func goSettingsToAcknowledgements() {
    performSegueWithIdentifier("SettingsToAcknowledgements", sender: nil)
  }
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    print(segue)
  }

  @IBAction func close(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
