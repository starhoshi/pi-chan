//
//  JLToast+Extension.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/05/04.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import JLToast

extension JLToastDelay {
  public static let SuperLongDelay: NSTimeInterval = 5.0
}

extension JLToast {

  static func showPichanToast(text:String){
    JLToastConfigrations.initSettings()
    JLToast.makeText(text, duration: JLToastDelay.SuperLongDelay).show()
  }
}

class JLToastConfigrations{
  static func initSettings(){
    JLToastView.setDefaultValue(
      UIColor.esaBrown(),
      forAttributeName: JLToastViewBackgroundColorAttributeName,
      userInterfaceIdiom: .Phone
    )

    JLToastView.setDefaultValue(
      UIColor.esaFontBlue(),
      forAttributeName: JLToastViewTextColorAttributeName,
      userInterfaceIdiom: .Phone
    )

    JLToastView.setDefaultValue(
      UIFont(name: "Lato-Regular", size: 14)!,
      forAttributeName: JLToastViewFontAttributeName,
      userInterfaceIdiom: .Phone
    )
  }
}