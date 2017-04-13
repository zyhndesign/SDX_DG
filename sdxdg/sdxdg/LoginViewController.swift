//
//  LoginViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/13.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet var loadingIndicatorView: UIActivityIndicatorView!
    
    let yellowColor:CGColor = UIColor.init(red:253/255.0, green: 220/255.0, blue: 56/255.0, alpha: 1.0).cgColor
    let blackColor:UIColor = UIColor.init(red: 59/255.0, green: 59/255.0, blue: 59/255.0, alpha: 1.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTextFiledStyle(textField:username)
        initTextFiledStyle(textField:password)
        
        loginBtn.layer.cornerRadius = 6
        
        loadingIndicatorView.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginBtnClick(_ sender: Any) {
        loadingIndicatorView.startAnimating()
        loadingIndicatorView.isHidden = false
        
        let usernameValue:String = username.text!
        let pwdValue:String = password.text!
        
        if(usernameValue.isEmpty){
            self.stopAndHideAnimation()
            username.placeholder = "请输入账号"
            username.setValue(UIColor.red, forKeyPath: "_placeholderLabel.textColor")
            return
        }
        
        if(pwdValue.isEmpty){
            self.stopAndHideAnimation()
            password.placeholder = "请输入密码"
            password.setValue(UIColor.red, forKeyPath: "_placeholderLabel.textColor")
            return
        }
        
        let parameters:Parameters = ["username":usernameValue,"password":pwdValue]
        
        Alamofire.request(ConstantsUtil.APP_USER_LOGIN_URL,method:.post,parameters:parameters).responseJSON{
            response in
            
            switch response.result{
            case .success:
                if let jsonResult = response.result.value {
                    let json = JSON(jsonResult)
                    let resultCode = json["resultCode"]
                    
                    LocalDataStorageUtil.saveCurrentUserDefault(value: usernameValue)
                    
                    if resultCode == 200{
                        print(json["object"])
                        var userDictionay:Dictionary<String,String> = Dictionary.init()
                        userDictionay.updateValue(json["object"]["headicon"].stringValue, forKey:"headicon" )
                        userDictionay.updateValue(json["object"]["id"].stringValue, forKey: "userId")
                        userDictionay.updateValue(json["object"]["gender"].stringValue, forKey: "gender")
                        userDictionay.updateValue(json["object"]["shop"]["shopname"].stringValue, forKey: "shopname")
                        userDictionay.updateValue(json["object"]["phone"].stringValue, forKey: "phone")
                        
                        userDictionay.updateValue(usernameValue, forKey: "username")
                        let encryptPwdValue = DataEncodingUtil.Endcode_AES_ECB(strToEncode: pwdValue)
                        userDictionay.updateValue(encryptPwdValue, forKey: "password")
                        LocalDataStorageUtil.saveUserInfoToUserDefault(suiteName: "CURRENT_USER", dictionary: userDictionay)
                        
                        print(DataEncodingUtil.Decode_AES_ECB(strToDecode: encryptPwdValue))
                        
                        self.initMainActivity()
                    }
                    else{
                        print(json["message"])
                        MessageUtil.showMessage(view: self.view, message: json["message"].string!)
                    }
                }
            case .failure(let error):
                print(error)
                MessageUtil.showMessage(view: self.view, message: error.localizedDescription)
            }
            
            self.stopAndHideAnimation()
        }
    }
    
    func initMainActivity(){
        let homeTabBarViewController:HomeTabBarViewController = HomeTabBarViewController()
        let storyboard:UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let matchView  = storyboard.instantiateViewController(withIdentifier: "MatchViewController")
        let matchViewNave:UINavigationController = UINavigationController.init(rootViewController: matchView)
        matchViewNave.navigationBar.barTintColor = blackColor
        matchViewNave.navigationBar.tintColor = UIColor.white
        matchViewNave.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        let clientView = storyboard.instantiateViewController(withIdentifier: "ClientViewController")
        let clientViewNave:UINavigationController = UINavigationController.init(rootViewController: clientView)
        clientViewNave.navigationBar.barTintColor = blackColor
        clientViewNave.navigationBar.tintColor = UIColor.white
        clientViewNave.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        let mineView = storyboard.instantiateViewController(withIdentifier: "MineViewController")
        let mineViewNave:UINavigationController = UINavigationController.init(rootViewController: mineView)
        mineViewNave.navigationBar.barTintColor = blackColor
        mineViewNave.navigationBar.tintColor = UIColor.white
        mineViewNave.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        let tabArray = [matchViewNave,clientViewNave,mineViewNave]
        homeTabBarViewController.viewControllers = tabArray
        
        let attributes =  [NSForegroundColorAttributeName: UIColor(red: 59/255.0, green: 59/255.0, blue: 59/255.0, alpha: 1.0),
                           NSFontAttributeName: UIFont(name: "Heiti SC", size: 24.0)!]
        matchView.tabBarItem.setTitleTextAttributes(attributes , for: UIControlState.selected)
        clientView.tabBarItem.setTitleTextAttributes(attributes , for: UIControlState.selected)
        mineView.tabBarItem.setTitleTextAttributes(attributes , for: UIControlState.selected)
        
        self.present(homeTabBarViewController, animated: true, completion: nil)
    }
    
    func initTextFiledStyle(textField tField: UITextField) {
        tField.layer.cornerRadius = 6
        tField.layer.borderColor = yellowColor
        tField.layer.borderWidth = 1.0
        tField.backgroundColor = blackColor
        tField.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
    }
    
    func stopAndHideAnimation(){
        loadingIndicatorView.stopAnimating()
        loadingIndicatorView.isHidden = true
    }
    
    
}

