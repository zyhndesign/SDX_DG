//
//  ConstantsUtil.swift
//  sdxdg
//
//  Created by lotusprize on 17/3/16.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import Foundation
import UIKit

class ConstantsUtil : NSObject {
    
    static var WEB_API_BASE_URL:String = "http://192.168.3.129:8080/sdx"
    
    static let APP_USER_LOGIN_URL:String = WEB_API_BASE_URL + "/dggl/appUser/authorityCheck"
    static let APP_USER_UPDATE_URL:String = WEB_API_BASE_URL + "/dggl/appUser/updateUser"
    static let APP_USER_GET_VIP_URL:String = WEB_API_BASE_URL + "dggl/appVipUser/getVipuserByShoppingGuideId"
}
