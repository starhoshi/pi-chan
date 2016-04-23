//
//  LoginViewController.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/03/28.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import APIKit
import SVProgressHUD
import Font_Awesome_Swift
import SDCAlertView
import Cent

class AuthorizationViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @IBAction func login(sender: AnyObject) {
    Esa.authorization(
      self,
      success: {credential in
        log?.info(credential.oauth_token)
        self.callTeamsApi(credential.oauth_token)
      },
      failure:{ error in
        log?.info(error.localizedDescription)
      }
    )
  }
  
  func callTeamsApi(token:String){
    SVProgressHUD.showWithStatus("Loading...")
    Esa.teams(token){
      result in
      switch result {
      case .Success(let teams):
        SVProgressHUD.showSuccessWithStatus("Success!")
        log?.info("\(teams)")
        self.selectTeamWhenJoinedMultiTeams(teams)
      case .Failure(let error):
        SVProgressHUD.showErrorWithStatus("Error!")
        log?.info("\(error)")
      }
    }
  }
  
  func selectTeamWhenJoinedMultiTeams(teams:Teams){
    let teamNames = getTeamNames(teams)
    switch teamNames.count {
    case 0:
      // throw
      break
    case 1:
      // fin
      break
    default:
      // multi team
      break
    }
    
    if teamNames.count == 1 {
      
    }
  }
  
  func getTeamNames(teams:Teams) -> [String]{
    var teamNames:[String] = []
    teams.teams.each { team in
      teamNames << team.name
    }
    log?.info("\(teamNames)")
    return teamNames
  }
}
