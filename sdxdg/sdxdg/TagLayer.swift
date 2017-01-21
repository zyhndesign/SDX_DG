//
//  TagLayer.swift
//  sdxdg
//
//  Created by lotusprize on 17/1/21.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import UIKit

class TagLayer: CALayer {
    
    var bgLayer:CALayer?
    var textLayer:CATextLayer?
    
    init(text:String) {
        super.init()
        bgLayer = CALayer.init()
        bgLayer?.contents = UIImage.init(named: "labelTag")?.cgImage
        bgLayer?.bounds = CGRect.init(x: 0, y: 0, width: 24, height: 34)
        
        textLayer = CATextLayer.init()
        textLayer?.bounds = CGRect.init(x: 0, y: 0, width: 24, height: 30)
        textLayer?.string = text
        textLayer?.fontSize = 16
        textLayer?.foregroundColor = UIColor.darkGray.cgColor
        textLayer?.alignmentMode = kCAAlignmentCenter
        self.addSublayer(bgLayer!)
        self.addSublayer(textLayer!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(in ctx: CGContext) {
        
       
    }
    
}
