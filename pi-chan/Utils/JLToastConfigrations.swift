//
//  JLToastConfigrations.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/05/04.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import JLToast

class JLToastConfigrations{
  static func setDefault(){
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
