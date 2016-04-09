//
//  UIScrollView+Extension.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/09.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Unable to simultaneously satisfy constraints · Issue #1 · gontovnik/DGElasticPullToRefresh
// https://github.com/gontovnik/DGElasticPullToRefresh/issues/1
extension UIScrollView {
  func dg_stopScrollingAnimation() {}
}