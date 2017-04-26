//
//  UpdatePwdViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/24.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class UpdatePwdViewController: UIViewController {
    
    @IBOutlet var pwdTextField: UITextField!
    @IBOutlet var newPwdTextField1: UITextField!
    @IBOutlet var newPwdTextField2: UITextField!
    @IBOutlet var postBtn: UIButton!
    
    let userId = LocalDataStorageUtil.getUserIdFromUserDefaults()
    let username = LocalDataStorageUtil.getUserInfoByKey(key: "username")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        postBtn.layer.cornerRadius = 6.0
    }
    
    @IBAction func postBtnClick(_ sender: Any) {
        if (pwdTextField.text?.isEmpty)!{
            MessageUtil.showMessage(view: self.view, message: "请输入旧密码")
            return
        }
        
        if (newPwdTextField1.text?.isEmpty)!{
            MessageUtil.showMessage(view: self.view, message: "请输入新密码")
            return
        }
        
        if (newPwdTextField2.text?.isEmpty)!{
            MessageUtil.showMessage(view: self.view, message: "请确认新密码")
            return
        }
        
        if newPwdTextField1.text != newPwdTextField2.text{
            MessageUtil.showMessage(view: self.view, message: "两次输入密码不相等周云")
            return
        }
        
        let parameters:Parameters = ["userId":userId,"password":pwdTextField.text!, "newPwd":newPwdTextField1.text!,"username":username]
        
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "提交中..."
        Alamofire.request(ConstantsUtil.ALL_USER_UPDATE_PWD,method:.post,parameters:parameters).responseJSON { (response) in
            
            if let data = response.result.value {
                let responseResult = JSON(data)
                
                let resultCode = responseResult["resultCode"].intValue
                
                if resultCode == 200{
                    hud.label.text = "操作成功"
                    hud.hide(animated: true, afterDelay: 1.0)
                    
                    self.navigationController?.popViewController(animated: true)
                    
                }
                else if resultCode == 300{
                    hud.label.text = "旧密码错误"
                    hud.hide(animated: true, afterDelay: 1.0)
                }
                else{
                    hud.label.text = "操作失败"
                    hud.hide(animated: true, afterDelay: 1.0)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
