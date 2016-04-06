//
//  PostTableViewCell.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/06.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
  
  @IBOutlet weak var circleThumbnail: UIImageView!
  @IBOutlet weak var wip: UILabel!
  @IBOutlet weak var category: UILabel!
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var createdBy: UILabel!
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
