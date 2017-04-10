//
//  Match.swift
//  sdxdg
//
//  Created by lotusprize on 17/4/10.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import UIKit
import ObjectMapper

class Match: Mappable {
    
    var id:Int?
    var user:User?
    var seriesname:String?
    var sharestatus:Int?
    var draftstatus:Int?
    var matchlists:[Matchlist]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        user <- map["user"]
        seriesname <- map["seriesname"]
        sharestatus <- map["sharestatus"]
        draftstatus <- map["draftstatus"]
        matchlists <- map["matchlists"]
    }
    
    
}
