//
//  Logger.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/03/27.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Log

let log: Logger? = {
    #if DEBUG
//        let Log = Logger(formatter: .detailed, theme: .TomorrowNight)
        return nil
//        return Log
    #else
        return nil
    #endif
}()
