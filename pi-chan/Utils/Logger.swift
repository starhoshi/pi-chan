//
//  Logger.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/03/27.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import XCGLogger

let log: XCGLogger? = {
  #if DEBUG
    let log = XCGLogger.defaultInstance()
    log.xcodeColorsEnabled = true
    log.xcodeColors = [
      .Verbose: .lightGrey,
      .Debug: .white,
      .Info: .green,
      .Warning: .orange,
      .Error: XCGLogger.XcodeColor(fg: UIColor.redColor(), bg: UIColor.whiteColor()),
      .Severe: XCGLogger.XcodeColor(fg: (255, 255, 255), bg: (255, 0, 0))
    ]
    log.setup(.Verbose, showThreadName: true, showLogLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: nil, fileLogLevel: .Debug)
    return log
  #else
    return nil
  #endif
}()
