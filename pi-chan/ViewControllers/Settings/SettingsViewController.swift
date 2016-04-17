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
  override func viewDidLoad() {
    super.viewDidLoad()
    initTableView()
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
    let memberCellNib:UINib = UINib(nibName: "MemberTableViewCell", bundle: nil)
    tableView.registerNib(memberCellNib, forCellReuseIdentifier: "MemberCell")
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
    //    let setting = list[indexPath.section][indexPath.row]
    //    if setting[3] as! String == "SettingBaseCell" {
    //    let cell = tableView.dequeueReusableCellWithIdentifier("SettingBaseCell", forIndexPath: indexPath) as! SettingBaseTableViewCell
    //      cell.setSetting(setting, settingsTableViewController: settingsTableViewController!)
    //      return cell
    //    }else{
    //      let cell = tableView.dequeueReusableCellWithIdentifier("SettingSleepCell", forIndexPath: indexPath) as! SettingSleepTableViewCell
    //      cell.setSetting(setting)
    return UITableViewCell()
    //    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

struct Section{
  let title:String
  let cellContents:[CellContent]
}

struct CellContent{
  let title:String
  let icon:FAType
  let cellType:UITableViewCellAccessoryType
  let cell:String
}

// sectionList

let sectionList = [
  tokenClearSection,
  esaInfoSection,
  applicationSection,
  developerSection
]

// settings

let tokenClearSection = Section(
  title: "Access Token 削除",
  cellContents: [
    tokenClearContent
  ]
)

let tokenClearContent = CellContent(
  title:"AccessToken を削除する",
  icon:.FAUnlockAlt,
  cellType: .DisclosureIndicator,
  cell:"a"
)

// esa.io

let esaInfoSection = Section(
  title: "esa.io",
  cellContents: [
    esaHomePageContent,
    esaTeamPageContent
  ]
)

let esaHomePageContent = CellContent(
  title:"esa.io",
  icon:.FASafari,
  cellType: .DisclosureIndicator,
  cell:"a"
)

let esaTeamPageContent = CellContent(
  title:"あなたのチームを開く",
  icon:.FASmileO,
  cellType: .DisclosureIndicator,
  cell:"a"
)

// esa.io

let applicationSection = Section(
  title: "アプリ情報",
  cellContents: [
    versionContent,
    shareContent,
    licenseContent
  ]
)

let versionContent = CellContent(
  title:"ver \(NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as! String)",
  icon:.FAServer,
  cellType: .None,
  cell:"a"
)

let shareContent = CellContent(
  title:"アプリをシェア",
  icon:.FAShareAlt,
  cellType: .DisclosureIndicator,
  cell:"a"
)

let licenseContent = CellContent(
  title:"License",
  icon:.FACreativeCommons,
  cellType: .DisclosureIndicator,
  cell:"a"
)

// developer

let developerSection = Section(
  title: "開発者情報",
  cellContents: [
    twitterContent,
    githubContent
  ]
)

let twitterContent = CellContent(
  title:"Twitter: @star__hoshi",
  icon:.FATwitter,
  cellType: .DisclosureIndicator,
  cell:"a"
)

let githubContent = CellContent(
  title:"Github Reopsitory",
  icon:.FAGithub,
  cellType: .DisclosureIndicator,
  cell:"a"
)
