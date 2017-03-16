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
    
    let USER_DEFAULT_CURRENT_USER:String = "currentUser"
    
    static func getUserIdFromUserDefaults() -> Int{
        return 0
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
