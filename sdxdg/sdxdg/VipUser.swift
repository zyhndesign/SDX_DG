//
//  VipUser.swift
//  sdxdg
//
//  Created by lotusprize on 17/4/25.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import UIKit
import ObjectMapper

class VipUser : Mappable {
    
    var gender:Int?
    var consumesum:Int?
    var id:Int?
    var vipname:String?
    var consumenumber:Int?
    var birthday:String?
    var valid:Int?
    var phonenumber:String?
    var cardnumber:String?
    var integral:Int?
    var shopname:String?
    var rank:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        gender <- map["gender"]
        consumesum <- map["consumesum"]
        vipname <- map["vipname"]
        consumenumber <- map["consumenumber"]
        birthday <- map["birthday"]
        valid <- map["valid"]
        phonenumber <- map["phonenumber"]
        cardnumber <- map["cardnumber"]
        integral <- map["integral"]
        shopname <- map["shopname"]
        rank <- map["rank"]
    }
}
