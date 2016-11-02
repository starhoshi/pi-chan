//
//  ProfileViewController.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/24.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import Font_Awesome_Swift
import SVProgressHUD
import SDCAlertView
import Toaster

class ProfileViewController: UIViewController {

    @IBOutlet weak var settingButton: UIBarButtonItem!
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var mail: UILabel!
    @IBOutlet weak var name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingButton.setFAIcon(icon: .FAInfoCircle, iconSize: 22)
        loadUserApi()
    }

    override func viewDidAppear(_ animated: Bool) {
        if Global.fromLogin {
            loadUserApi()
            Global.fromLogin = false
        }
    }

    func loadUserApi() {
        SVProgressHUD.show(withStatus: "Loading...")
        Esa(token: KeychainManager.getToken()!, currentTeam: KeychainManager.getTeamName()!).user() { result in
            SVProgressHUD.dismiss()
            switch result {
            case .Success(let user):
                self.setUserData(user)
            case .Failure(let error):
                ErrorHandler.errorAlert(error, controller: self)
            }
        }
    }

    func setUserData(user: User) {
        userIcon.kf.setImageWithURL(user.icon)
        userIcon.toCircle()
        screenName.text = user.screenName
        name.text = user.name
        mail.text = user.email
    }

    @IBAction func clickRevoke(sender: AnyObject) {
        let alert = AlertController(title: "認証解除", message: "ピーちゃんと esa.io の認証を解除しますか？\n\n解除した後も再度認証いただければ、またピーちゃんをご利用いただけます。", preferredStyle: .Alert)
        alert.addAction(AlertAction(title: "認証解除", style: .Preferred) {
            _ in self.loadRevokeApi()
        })
        alert.addAction(AlertAction(title: "キャンセル", style: .Default))
        alert.present()
    }

    func loadRevokeApi() {
        SVProgressHUD.showWithStatus("Loading...")
        log?.debug("\(KeychainManager.getToken())")
        Esa(token: KeychainManager.getToken()!, currentTeam: KeychainManager.getTeamName()!).revoke() { result in
            SVProgressHUD.dismiss()
            switch result {
            case .Success(_):
                JLToast.showPichanToast("アプリ連携を解除しました (\\( ⁰⊖⁰)/)\n\n再度ご利用の場合は、もう一度認証をお願いします。")
                Window.openLogin(self)
            case .Failure(let error):
                ErrorHandler.errorAlert(error, controller: self)
            }
        }
    }

}
