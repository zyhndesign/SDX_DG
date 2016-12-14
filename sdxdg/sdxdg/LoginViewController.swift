//
//  LoginViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/13.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    let yellowColor:CGColor = UIColor.init(red:253/255.0, green: 220/255.0, blue: 56/255.0, alpha: 1.0).cgColor
    let blackColor:UIColor = UIColor.init(red: 59/255.0, green: 59/255.0, blue: 59/255.0, alpha: 1.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTextFiledStyle(textField:username)
        initTextFiledStyle(textField:password)
        
        loginBtn.layer.cornerRadius = 6
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginBtnClick(_ sender: Any) {
        
        self.present(HomeTabBarViewController(), animated: true, completion: nil)
        
    }
    
    func initTextFiledStyle(textField tField: UITextField) {
        tField.layer.cornerRadius = 6
        tField.layer.borderColor = yellowColor
        tField.layer.borderWidth = 1.0
        tField.backgroundColor = blackColor
        tField.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
    }
}

