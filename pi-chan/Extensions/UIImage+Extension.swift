//
//  UIImage+Extension.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/17.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit

extension UIImageView {
  func toCircle() -> UIImageView{
    self.layer.cornerRadius = self.frame.size.width / 2;
    self.clipsToBounds = true;
    return self
  }
}