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
    
    static var WEB_API_BASE_URL:String = "http://192.168.3.22:8080/sdx"
    
    static let APP_USER_LOGIN_URL:String = WEB_API_BASE_URL + "/dggl/appUser/authorityCheck"
    static let APP_USER_UPDATE_URL:String = WEB_API_BASE_URL + "/dggl/appUser/updateUser"
    static let APP_USER_GET_VIP_URL:String = WEB_API_BASE_URL + "/dggl/appVipUser/getVipuserByShoppingGuideId"
    
    static let APP_MATCH_CREATE_URL:String =  WEB_API_BASE_URL + "/dggl/match/createMatch"
    static let APP_MATCH_LIST_BY_SHARESTATUS_URL:String =  WEB_API_BASE_URL + "/dggl/match/getMatchByShareStatus"
   
    static let APP_MATCH_LIST_BY_CATEGORY = WEB_API_BASE_URL + "/app/hpManage/getHpDataByCategoryId"
    
    static let APP_QINIU_TOKEN = WEB_API_BASE_URL + "/hpgl/hpManage/getUploadKey"
    static let APP_QINIU_UPLOAD_URL = "http://upload.qiniu.com/"
    static let APP_QINIU_IMAGE_URL_PREFIX = "http://oaycvzlnh.bkt.clouddn.com/"
}
