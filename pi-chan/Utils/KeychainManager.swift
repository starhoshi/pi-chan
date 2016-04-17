//
//  KeychainManager.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/03/29.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import KeychainAccess

struct KeychainManager {
  private static let TOKEN = "TOKEN"
  private static let TEAM_NAME = "TEAM_NAME"
  private static let keychain = Keychain(service: "pi-chan")
  
  static func initialSettings(){
    if getToken() == nil {
      setToken("")
    }
    if getTeamName() == nil {
      setTeamName("")
    }
  }
  static func clear() {
    setToken("")
    setTeamName("")
  }
  
  static func getToken() -> String?{
    return keychain[TOKEN]
  }
  static func setToken(token:String){
    keychain[TOKEN] = token
  }
  static func getTeamName() -> String?{
    return keychain[TEAM_NAME]
  }
  static func setTeamName(teamName:String){
    keychain[TEAM_NAME] = teamName
  }
}
