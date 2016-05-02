//
//  SettingTableViewCell.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/17.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

class SettingTableViewCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var icon: UIImageView!
  var settingViewController: SettingsViewController?
  var cellContent:CellContent!

  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    if selected {
      if cellContent.title == "Share" {
        settingViewController?.showShareActivityView()
      } else if cellContent.title == "License" {
        settingViewController?.goSettingsToAcknowledgements()
      }else{
        cellContent.tapped()
      }
    }
  }
  
  func setItems(cellContent:CellContent){
    self.cellContent = cellContent
    titleLabel.text = cellContent.title
    icon.setFAIconWithName(cellContent.icon, textColor: UIColor.esaGreen())
    self.accessoryType = cellContent.cellType
    self.selectionStyle = cellContent.cellType == .None ? .None : .Default
  }
}
