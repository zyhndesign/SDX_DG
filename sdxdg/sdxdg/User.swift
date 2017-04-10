//
//  User.swift
//  sdxdg
//
//  Created by lotusprize on 17/4/10.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import UIKit
import ObjectMapper

class User: Mappable {
    
    var id:Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        
    }
    
    
}
