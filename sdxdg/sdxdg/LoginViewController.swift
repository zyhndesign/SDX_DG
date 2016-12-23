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
        
        //let item3 : UITabBarItem = UITabBarItem (title: "第三页面", image: UIImage(named: "mineIconNormal"), selectedImage: UIImage(named: "mineIconSelect"))
        //mineView.tabBarItem = item3
        
        let tabArray = [matchViewNave,clientViewNave,mineViewNave]
        homeTabBarViewController.viewControllers = tabArray
        
        let attributes =  [NSForegroundColorAttributeName: UIColor(red: 59/255.0, green: 59/255.0, blue: 59/255.0, alpha: 1.0),
                           NSFontAttributeName: UIFont(name: "Heiti SC", size: 24.0)!]
        matchView.tabBarItem.setTitleTextAttributes(attributes , for: UIControlState.selected)
        clientView.tabBarItem.setTitleTextAttributes(attributes , for: UIControlState.selected)
        mineView.tabBarItem.setTitleTextAttributes(attributes , for: UIControlState.selected)
        
        //let navi:UINavigationController = UINavigationController.init(rootViewController: homeTabBarViewController)
        
        self.present(homeTabBarViewController, animated: true, completion: nil)
        
    }
    
    func initTextFiledStyle(textField tField: UITextField) {
        tField.layer.cornerRadius = 6
        tField.layer.borderColor = yellowColor
        tField.layer.borderWidth = 1.0
        tField.backgroundColor = blackColor
        tField.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
    }
}

