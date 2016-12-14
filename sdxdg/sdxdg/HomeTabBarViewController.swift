//
//  HomeTabBarViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/13.
//  Copyright © 2016年 geekTeam. All rights reserved.
//


import UIKit

class HomeTabBarViewController : UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let storyboard:UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let matchView  = storyboard.instantiateViewController(withIdentifier: "MatchViewController")
        
        let clientView = storyboard.instantiateViewController(withIdentifier: "ClientViewController")
        
        let mineView = storyboard.instantiateViewController(withIdentifier: "MineViewController")
        //let item3 : UITabBarItem = UITabBarItem (title: "第三页面", image: UIImage(named: "mineIconNormal"), selectedImage: UIImage(named: "mineIconSelect"))
        //mineView.tabBarItem = item3
        
        let tabArray = [matchView,clientView,mineView]
        self.viewControllers = tabArray
        
        let attributes =  [NSForegroundColorAttributeName: UIColor(red: 59/255.0, green: 59/255.0, blue: 59/255.0, alpha: 1.0),
                           NSFontAttributeName: UIFont(name: "Heiti SC", size: 24.0)!]
        matchView.tabBarItem.setTitleTextAttributes(attributes , for: UIControlState.selected)
        clientView.tabBarItem.setTitleTextAttributes(attributes , for: UIControlState.selected)
        mineView.tabBarItem.setTitleTextAttributes(attributes , for: UIControlState.selected)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
