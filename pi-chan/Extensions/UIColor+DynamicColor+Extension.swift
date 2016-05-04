//
//  UIColor+Extension.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/05.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import DynamicColor

extension UIColor {
  class func esaGreen() -> UIColor {
    return UIColor(hexString: "#0a9b94")
  }
  class func esaBrown() -> UIColor {
    return UIColor(hexString: "#efede0")
  }
  class func esaFontBlue() -> UIColor {
    return UIColor(hexString: "#3c4a60")
  }
  
  class func grayUITextFieldBorderColor() -> UIColor {
    return UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
  }
}