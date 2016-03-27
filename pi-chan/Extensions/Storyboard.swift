//
//  Storyboard.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/03/27.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
  
  // 角丸の半径(0で四角形)
  @IBInspectable var cornerRadius: CGFloat = 0.0
  
  // 枠
  @IBInspectable var borderColor: UIColor = UIColor.clearColor()
  @IBInspectable var borderWidth: CGFloat = 0.0
  
  override func drawRect(rect: CGRect) {
    // 角丸
    self.layer.cornerRadius = cornerRadius
    self.clipsToBounds = (cornerRadius > 0)
    
    // 枠線
    self.layer.borderColor = borderColor.CGColor
    self.layer.borderWidth = borderWidth
    
    super.drawRect(rect)
  }
}

@IBDesignable class CustomLabel: UILabel {
  
  // 角丸の半径(0で四角形)
  @IBInspectable var cornerRadius: CGFloat = 0.0
  
  // 枠
  @IBInspectable var borderColor: UIColor = UIColor.clearColor()
  @IBInspectable var borderWidth: CGFloat = 0.0
  
  override func drawRect(rect: CGRect) {
    // 角丸
    self.layer.cornerRadius = cornerRadius
    self.clipsToBounds = (cornerRadius > 0)
    
    // 枠線
    self.layer.borderColor = borderColor.CGColor
    self.layer.borderWidth = borderWidth
    
    super.drawRect(rect)
  }
}

