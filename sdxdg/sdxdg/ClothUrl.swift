//
//  ClothUrl.swift
//  sdxdg
//
//  Created by lotusprize on 17/4/18.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import UIKit
import ObjectMapper

class ClothUrl: Mappable {
    
    var productImageUrl:String?
    var frontViewUrl:String?
    var backViewUrl:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        productImageUrl <- map["productImageUrl"]
        frontViewUrl <- map["frontViewUrl"]
        backViewUrl <- map["backViewUrl"]
        
    }
    
}
