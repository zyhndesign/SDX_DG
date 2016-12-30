//
//  GarmentModel.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/30.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class GarmentModel : NSObject{
    
    var title:String?
    var price:String?
    var customerName1:String?
    var customerName2:String?
    var customerName3:String?
    var customerName4:String?
    var customerName5:String?
    var customerName6:String?
    var imageName:String?
    
    override init() {
        super.init()
        let dic = ["title":"商务男士套头衫","price":"¥121","imageName":"inCloth1","customerName1":"郭智","customerName2":"江河湖","customerName3":"李开基","customerName4":"胡凯凯","customerName5":"何志文","customerName6":"杰克鲍尔"] as [String : Any]
        self.setValuesForKeys(dic)
    }
    
    init(dic:[String:Any])
    {
        super.init()
        self.setValuesForKeys(dic)
    }
    
}
