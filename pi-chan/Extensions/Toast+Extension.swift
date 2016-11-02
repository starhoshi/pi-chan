//
//  JLToast+Extension.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/05/04.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import Toaster

extension Toast {
    static func showPichanToast(text: String) {
//        JLToastCenter.defaultCenter().cancelAllToasts()
//        JLToastConfigrations.initSettings()
//        JLToast.makeText(text, duration: JLToastDelay.SuperLongDelay).show()
        Toast(text: text).show()
    }
}

//class JLToastConfigrations {
//    static func initSettings() {
//        JLToastView.setDefaultValue(
//            UIColor.esaBrown(),
//            forAttributeName: JLToastViewBackgroundColorAttributeName,
//            userInterfaceIdiom: .Phone
//        )
//
//        JLToastView.setDefaultValue(
//            UIColor.esaFontBlue(),
//            forAttributeName: JLToastViewTextColorAttributeName,
//            userInterfaceIdiom: .Phone
//        )
//
//        JLToastView.setDefaultValue(
//            UIFont(name: "Lato-Regular", size: 14)!,
//            forAttributeName: JLToastViewFontAttributeName,
//            userInterfaceIdiom: .Phone
//        )
//
//        JLToastView.setDefaultValue(
//            60.0,
//            forAttributeName: JLToastViewPortraitOffsetYAttributeName,
//            userInterfaceIdiom: .Phone
//        )
//
//        JLToastView.setDefaultValue(
//            60.0,
//            forAttributeName: JLToastViewLandscapeOffsetYAttributeName,
//            userInterfaceIdiom: .Phone
//        )
//    }
//}
