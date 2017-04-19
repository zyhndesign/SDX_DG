//
//  Matchlist.swift
//  sdxdg
//
//  Created by lotusprize on 17/4/10.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import UIKit
import ObjectMapper

class Matchlist: Mappable {
    
    var id:Int?
    var innerClothId:Int?
    var outClothId:Int?
    var trousersId:Int?
    var modelNum:Int?
    var modelurl:String?
    var customeModel:ProductImageModel?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        innerClothId <- map["innerClothId"]
        outClothId <- map["outClothId"]
        trousersId <- map["trousersId"]
        modelNum <- map["modelNum"]
        modelurl <- map["modelurl"]
        customeModel <- map["customeModel"]
    }
    
    
}
