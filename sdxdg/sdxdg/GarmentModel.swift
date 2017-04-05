//
//  GarmentModel.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/30.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit
import ObjectMapper

class GarmentModel : Mappable{
    
    var id:Int?
    var hpName:String?
    var hpNum:String?
    var price:String?
    //var customerModel:[CustomerModel]?
    
    var imageUrl1:String?
    var imageUrl2:String?
    var imageUrl3:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        hpName <- map["hpName"]
        price <- map["price"]
        hpNum <- map["hpNum"]
        imageUrl1 <- map["imageUrl1"]
        imageUrl2 <- map["imageUrl2"]
        imageUrl3 <- map["imageUrl3"]
        //customerModel <- map["customerModel"]
    }
    
}
