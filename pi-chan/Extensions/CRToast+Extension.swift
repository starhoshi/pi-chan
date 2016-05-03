//
//  CRToast+Extension.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/05/04.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import CRToast

extension CRToast {
  static func showSuccessNotificationFromBottom(){
    let options = [
      kCRToastTextKey : "Me lleva la mierda",
      kCRToastAnimationInDirectionKey : CRToastAnimationDirection.Top.rawValue,
      kCRToastAnimationInTypeKey : CRToastAnimationType.Gravity.rawValue,
      kCRToastAnimationOutDirectionKey : CRToastAnimationDirection.Top.rawValue,
      kCRToastAnimationOutTypeKey : CRToastAnimationType.Gravity.rawValue,
      kCRToastNotificationPresentationTypeKey : CRToastPresentationType.Push.hashValue,
      kCRToastNotificationTypeKey : CRToastType.NavigationBar.rawValue,
      kCRToastTextAlignmentKey : NSTextAlignment.Left.rawValue,
      kCRToastTimeIntervalKey : 1.0,
      kCRToastUnderStatusBarKey : NSNumber(bool: false),
      kCRToastBackgroundColorKey : UIColor.redColor()
    ]
    CRToastManager.showNotificationWithOptions(options, completionBlock: {_ in})
  }
}