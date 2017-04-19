//
//  FeedbackModel.swift
//  sdxdg
//
//  Created by lotusprize on 17/4/18.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import UIKit
import ObjectMapper

class FeedbackModel: Mappable {
    
    var matchlistId:Int?
    var userId:Int?
    var countLike:Int?
    var innerClothId:Int?
    var outClothId:Int?
    var trousersId:Int?
    var innerClothUrl:ClothUrl?
    var outClothUrl:ClothUrl?
    var trousersClothUrl:ClothUrl?
    var modelurl:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        matchlistId <- map["matchlistId"]
        userId <- map["userId"]
        countLike <- map["countLike"]
        innerClothId <- map["innerClothId"]
        outClothId <- map["outClothId"]
        trousersId <- map["trousersId"]
        innerClothUrl <- map["innerClothUrl"]
        outClothUrl <- map["outClothUrl"]
        trousersClothUrl <- map["trousersClothUrl"]
        modelurl <- map["modelurl"]
    }
    
}
