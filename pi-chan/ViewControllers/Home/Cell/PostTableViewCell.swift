//
//  PostTableViewCell.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/06.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import Kingfisher

class PostTableViewCell: UITableViewCell {
  
  @IBOutlet weak var circleThumbnail: UIImageView!
  @IBOutlet weak var wip: UILabel!
  @IBOutlet weak var category: UILabel!
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var createdBy: UILabel!
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func setItems(post:Post){
    circleThumbnail.kf_setImageWithURL(post.createdBy.icon)
  }
  
}
