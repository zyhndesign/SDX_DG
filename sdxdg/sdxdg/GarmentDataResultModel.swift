//
//  GarmentDataResultModel.swift
//  sdxdg
//
//  Created by lotusprize on 17/4/5.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import UIKit
import ObjectMapper

class GarmentDataResultModel: Mappable {
    
    var success:Bool?
    var error_code:Int?
    var resultCode:Int?
    var message:String?
    var object:[GarmentModel]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        success <- map["success"]
        error_code <- map["error_code"]
        resultCode <- map["resultCode"]
        message <- map["message"]
        object <- map["object"]
    }
}
