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
import Cent
import XLActionController
import JLToast

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
        self.selectTeamWhenJoinedMultiTeams(teams,token: token)
      case .Failure(let error):
        SVProgressHUD.showErrorWithStatus("Error!")
        ErrorHandler.errorAlert(error, controller: self)
      }
    }
  }
  
  func selectTeamWhenJoinedMultiTeams(teams:Teams, token:String){
    switch teams.teams.count {
    case 1:
      successAuthorization(teams.teams.first()!.name, token:token)
      break
    default:
      showTeamSelectActionSheet(teams, token: token)
      break
    }
  }
  
  func showTeamSelectActionSheet(teams:Teams, token:String) {
    let actionSheet = TwitterActionController()
    actionSheet.headerData = "Select Your Team (\\( ⁰⊖⁰)/)"
    teams.teams.each { team in
      let image = UIImage(data: NSData(contentsOfURL: team.icon)!)
      actionSheet.addAction(Action(ActionData(title: team.name, subtitle: team.url.absoluteString, image: image!), style: .Default, handler: { action in
        self.successAuthorization(team.name, token:token)
        log?.debug(team.name)
      }))
    }
    presentViewController(actionSheet, animated: true, completion: nil)
  }
  
  func successAuthorization(teamName:String,token:String){
    KeychainManager.setTeamName(teamName)
    KeychainManager.setToken(token)
    self.dismissViewControllerAnimated(true, completion: nil)
    JLToast.showPichanToast("\(teamName) へログインが成功しました!")
  }
}
