//
//  UpdateChecker.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/03/28.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import Siren

class UpdateChecker {
  static func prompt(){
    let siren = Siren.sharedInstance
    //    siren.appID = Constants.SEKITORI.ID.rawValue
    siren.alertType = .Skip
    siren.checkVersion(.Immediately)
  }
}

