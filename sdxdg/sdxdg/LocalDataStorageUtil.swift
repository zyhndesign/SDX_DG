//
//  LocalDataStorageUtil.swift
//  sdxdg
//
//  Created by lotusprize on 17/3/16.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import Foundation
import UIKit

class LocalDataStorageUtil: NSObject {
    
    static let USER_DEFAULT_CURRENT_USER:String = "currentUser"
    
    static func getUserIdFromUserDefaults() -> Int{
        let currentUser = UserDefaults.init(suiteName: USER_DEFAULT_CURRENT_USER)
        let object:String = currentUser?.value(forKey: "username") as! String;
        print(object)
        let userObj = UserDefaults.init(suiteName: object);
        let tempVal = userObj?.value(forKey: "userId") as! String
        return Int(tempVal)!
    }
    
    static func saveCurrentUserDefault(value:String){
        let currentUser = UserDefaults.init(suiteName: USER_DEFAULT_CURRENT_USER)
        currentUser?.set(value, forKey: "username")
    }
    
    static func saveUserInfoToUserDefault(suiteName:String, key:String, value:String){
        let userDefault = UserDefaults.init(suiteName: suiteName)
        userDefault?.set(value, forKey: key)
    }
    
    static func saveUserInfoToUserDefault(suiteName:String, dictionary:Dictionary<String,String>){
        let userDefault = UserDefaults.init(suiteName: suiteName)
        for (key, value) in dictionary {
            userDefault?.set(value, forKey: key)
        }
    }
    
}
