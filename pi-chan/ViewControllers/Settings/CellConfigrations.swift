//
//  CellConfigrations.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/17.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

struct Section{
  let title:String
  let cellContents:[CellContent]
}

struct CellContent{
  let title:String
  let icon:FAType
  let cellType:UITableViewCellAccessoryType
  let tapped: () -> Void
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
  title:"AccessToken を削除",
  icon:.FAUnlockAlt,
  cellType: .DisclosureIndicator,
  tapped:{ _ in
    KeychainManager.clear()
  }
)

// esa.io

let esaInfoSection = Section(
  title: "esa.io",
  cellContents: [
    esaHomePageContent
  ]
)

let esaHomePageContent = CellContent(
  title:"esa.io を開く",
  icon:.FASafari,
  cellType: .DisclosureIndicator,
  tapped:{ _ in
    
  }
)

// esa.io

let applicationSection = Section(
  title: "ピーちゃん",
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
  tapped:{ _ in print("a")}
)

let shareContent = CellContent(
  title:"アプリをシェア",
  icon:.FAShareAlt,
  cellType: .DisclosureIndicator,
  tapped:{ _ in
    
  }
)

let licenseContent = CellContent(
  title:"License",
  icon:.FACreativeCommons,
  cellType: .DisclosureIndicator,
  tapped:{ _ in print("a")}
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
  tapped:{ _ in print("a")}
)

let githubContent = CellContent(
  title:"Github Reopsitory",
  icon:.FAGithub,
  cellType: .DisclosureIndicator,
  tapped:{ _ in print("a")}
)
