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
  esaInfoSection,
  applicationSection,
  developerSection
]

// esa.io

let esaInfoSection = Section(
  title: "esa.io",
  cellContents: [
    esaHomePageContent
  ]
)

let esaHomePageContent = CellContent(
  title:"Open esa.io",
  icon:.FASafari,
  cellType: .DisclosureIndicator,
  tapped:{ _ in
    Share.openBrowser(Constants.ESA.URL)
  }
)

// esa.io

let applicationSection = Section(
  title: "ピーちゃん",
  cellContents: [
    repositoryContent,
    reviewContent,
    shareContent,
    licenseContent,
    versionContent
  ]
)

let repositoryContent = CellContent(
  title:"Github Repository",
  icon:.FAGithub,
  cellType: .DisclosureIndicator,
  tapped:{ _ in
    Share.openAppStore(Constants.PICHAN.URL.GITHUB)
  }
)

let reviewContent = CellContent(
  title:"Review",
  icon:.FAStar,
  cellType: .DisclosureIndicator,
  tapped:{ _ in
    Share.openAppStore(Constants.PICHAN.URL.ITMS_REVIEW)
  }
)

let shareContent = CellContent(
  title:"Share",
  icon:.FAShareAlt,
  cellType: .DisclosureIndicator,
  tapped:{ _ in
    // look SettingTableViewCell
  }
)

let licenseContent = CellContent(
  title:"License",
  icon:.FACreativeCommons,
  cellType: .DisclosureIndicator,
  tapped:{ _ in
    // look SettingTableViewCell
  }
)

let versionContent = CellContent(
  title:"ver \(NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as! String)",
  icon:.FAServer,
  cellType: .None,
  tapped:{ _ in }
)

// developer

let developerSection = Section(
  title: "Developer",
  cellContents: [
    twitterContent,
    githubContent
  ]
)

let twitterContent = CellContent(
  title:"Twitter: @star__hoshi",
  icon:.FATwitter,
  cellType: .DisclosureIndicator,
  tapped:{ _ in
    Share.openBrowser(Constants.STARHOSHI.URL.TWITTER)
  }
)

let githubContent = CellContent(
  title:"Github: starhoshi",
  icon:.FAGithubAlt,
  cellType: .DisclosureIndicator,
  tapped:{ _ in
    Share.openBrowser(Constants.STARHOSHI.URL.GITHUB)
  }
)
