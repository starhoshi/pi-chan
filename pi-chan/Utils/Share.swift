//
//  Share.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/05/03.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit

class Share {
    static func openBrowser(url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.openURL(url)
        }
    }

    static func openAppStore(url: URL) {
        UIApplication.shared.openURL(url)
    }

}
