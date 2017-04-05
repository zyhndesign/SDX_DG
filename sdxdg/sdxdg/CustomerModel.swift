//
//  AddCustomerModel.swift
//  sdxdg
//
//  Created by lotusprize on 17/1/9.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import UIKit
import ObjectMapper

class CustomerModel: Mappable {
    var id:Int?
    var customerName:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        customerName <- map["customerName"]
    }
}
