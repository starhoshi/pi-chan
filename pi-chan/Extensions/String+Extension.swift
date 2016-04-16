//
//  String+Extension.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/16.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

extension String{
  func replaceNewLine() -> String{
    var md = self.stringByReplacingOccurrencesOfString("\r\n", withString: "#!#!#")
    md = md.stringByReplacingOccurrencesOfString("\n\r", withString: "#!#!#")
    md = md.stringByReplacingOccurrencesOfString("\n", withString: "#!#!#")
    md = md.stringByReplacingOccurrencesOfString("\r", withString: "#!#!#")
    md = md.stringByReplacingOccurrencesOfString("#!#!#", withString: "\\n")
    return md
  }
  
}