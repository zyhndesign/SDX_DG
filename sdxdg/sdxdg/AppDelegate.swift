//
//  AppDelegate.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/13.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        /*
        let storyBoard:UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let firstVC:HomeTabBarViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTabBarViewController") as! HomeTabBarViewController
        let naviController:UINavigationController = firstVC.navigationController!
        self.window?.rootViewController = naviController
        self.window?.makeKeyAndVisible()
        let loginVC:LoginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
         */
       // firstVC.present(loginVC, animated: true, completion: nil)
        UMSocialManager.default().openLog(true)
        UMSocialManager.default().umSocialAppkey = "590a8f40677baa08510011b7"
        UMSocialManager.default().setPlaform(UMSocialPlatformType.wechatSession, appKey: "wxdadf467339aff59d", appSecret: "d3c6a339de637fc19f88a1c4bf2917c1", redirectURL: "")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        let result = UMSocialManager.default().handleOpen(url)
        return result;
    }
}

