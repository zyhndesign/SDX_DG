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
    
    //static var WEB_API_BASE_URL:String = "http://139.196.236.34:8778/sdx_cloud"
    static var WEB_API_BASE_URL:String = "http://192.168.3.156:8080/sdx"
    
    static let APP_USER_LOGIN_URL:String = WEB_API_BASE_URL + "/dggl/appUser/authorityCheck"
    static let APP_USER_UPDATE_URL:String = WEB_API_BASE_URL + "/dggl/appUser/updateUser"
    static let APP_USER_GET_VIP_URL:String = WEB_API_BASE_URL + "/dggl/appVipUser/getVipuserByShoppingGuideId"
    static let APP_USER_UPDATE_DATA_URL:String = WEB_API_BASE_URL + "/dggl/appUser/appUpdateUser"
    static let APP_USER_BACK_HELP_DATA_URL:String = WEB_API_BASE_URL + "/dggl/appHelper/createInfo"
    static let ALL_USER_UPDATE_PWD:String = WEB_API_BASE_URL + "/dggl/appUser/updatePwd"
    //创建搭配
    static let APP_MATCH_CREATE_URL:String =  WEB_API_BASE_URL + "/dggl/match/createMatch"
    //获取已经分享数据
    static let APP_MATCH_LIST_BY_SHARESTATUS_URL:String =  WEB_API_BASE_URL + "/dggl/match/getAppMatchByShareStatus"
    //获取草稿箱数据
    static let APP_MATCH_LIST_BY_DRAFT_URL:String =  WEB_API_BASE_URL + "/dggl/match/getAppMatchByDraftStatus"
    //获取反馈数据
    static let APP_MATCH_LIST_BY_BACK_URL:String =  WEB_API_BASE_URL + "/dggl/match/getAppMatchByBackStatus"
    //创建反馈
    static let APP_MATCH_LIST_FEEDBACK_URL:String = WEB_API_BASE_URL + "/dggl/feedback/createFeedback"
    //取消反馈
    static let APP_MATCH_LIST_CANCEL_FEEDBACK_URL:String = WEB_API_BASE_URL + "/dggl/feedback/deleteFeedback"
    //获取热门反馈
    static let APP_MATCH_LIST_HOT_FEEDBACK_URL:String = WEB_API_BASE_URL + "/dggl/feedback/getDataByUserId"
    //获取前3个热门反馈
    static let APP_MATCH_THREE_HOT_FEEDBACK_URL:String = WEB_API_BASE_URL + "/dggl/feedback/getTopThreeDataByUserId"
    //获取用户已经分享的数据
    static let APP_GET_SHARE_DATA_URL:String = WEB_API_BASE_URL + "/dggl/share/getShareData"
    //创建分享
    static let APP_CREATE_SHARE_DATA_URL:String = WEB_API_BASE_URL + "/dggl/share/createShare"
    
    static let APP_MATCH_LIST_BY_CATEGORY = WEB_API_BASE_URL + "/app/hpManage/getHpDataByCategoryId"
    
    static let APP_FEEDBACK_VIP_NAMES = WEB_API_BASE_URL + "/dggl/feedback/getFeedbackVipName"
    
    static let APP_HPGL_CATEGORY = WEB_API_BASE_URL + "/hpgl/category/getData"
    
    static let APP_HPGL_INDEX = WEB_API_BASE_URL + "/hpgl/hpIndexManage/getAppData"
    
    static let APP_SHARE_HISTORY_URL = WEB_API_BASE_URL + "/dggl/match/getPushHistoryByVipNameAndUserId"
    
    static let APP_HPGL_HP_DETAIL = WEB_API_BASE_URL + "/hpgl/hpManage/productDetail/"
    static let APP_DGGL_MATCH_DETAIL = WEB_API_BASE_URL + "/dggl/match/matchDetail/"
    static let APP_DGGL_SHARE_DETAIL = WEB_API_BASE_URL + "/dggl/match/shareDetail/"
    static let APP_DGGL_SHARE_RESULT_DETAIL = WEB_API_BASE_URL + "/dggl/share/shareDetail/"
    
    static let APP_QINIU_TOKEN = WEB_API_BASE_URL + "/hpgl/hpManage/getUploadKey"
    static let APP_QINIU_UPLOAD_URL = "http://upload.qiniu.com/"
    static let APP_QINIU_IMAGE_URL_PREFIX = "http://oaycvzlnh.bkt.clouddn.com/"
}
