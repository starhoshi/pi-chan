//
//  PostTableViewCell.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/06.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import Kingfisher
import Font_Awesome_Swift

class PostTableViewCell: UITableViewCell {
  
  @IBOutlet weak var circleThumbnail: UIImageView!
  @IBOutlet weak var wip: UILabel!
  @IBOutlet weak var category: UILabel!
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var createdBy: UILabel!
  @IBOutlet weak var starIcon: UILabel!
  @IBOutlet weak var eyeIcon: UILabel!
  @IBOutlet weak var commentsIcon: UILabel!
  @IBOutlet weak var checkIcon: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    starIcon.setFAIcon(.FAStar, iconSize: 16)
    eyeIcon.setFAIcon(.FAEye, iconSize: 16)
    commentsIcon.setFAIcon(.FAComments, iconSize: 16)
    checkIcon.setFAIcon(.FACheckSquareO, iconSize: 16)
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func setItems(post:Post){
    circleThumbnail.kf_setImageWithURL(post.createdBy.icon)
    circleThumbnail.layer.cornerRadius = circleThumbnail.frame.size.width / 2;
    circleThumbnail.clipsToBounds = true;
    wip.hidden = !post.wip
    category.text = post.category
    title.text = post.name
    createdBy.text = post.createdBy.name
  }
  
}
