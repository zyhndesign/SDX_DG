//
//  FeedbackServerModel.swift
//  sdxdg
//
//  Created by lotusprize on 17/4/18.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import UIKit
import ObjectMapper

class FeedbackServerModel: Mappable {
    
    var resultCode:Int?
    var success:Bool?
    var error_code:Int?
    var message:String?
    var object:[FeedbackModel]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        resultCode <- map["resultCode"]
        success <- map["success"]
        error_code <- map["error_code"]
        message <- map["message"]
        object <- map["object"]
    }
    
}
