//
//  HotMatchCell.swift
//  sdxdg
//
//  Created by lotusprize on 17/1/10.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import UIKit

class HotMatchCell : UICollectionViewCell {
    
    let width = UIScreen.main.bounds.size.width//获取屏幕宽
    let height = UIScreen.main.bounds.size.height
    
    var imgView:UIImageView?
    var redHeartIcon:UIImageView?
    var heartCount:UITextView?
    var fitBtn:UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imgView = UIImageView.init(frame: CGRect.init(x: 10, y: 10, width: (width-80)/2, height: (height - 30)/2))
        imgView?.contentMode = UIViewContentMode.scaleAspectFit
        self.addSubview(imgView!)
        
        redHeartIcon = UIImageView.init(frame: CGRect.init(x: ((width-40)/2 - 35), y: 25, width: 10, height: 10))
        redHeartIcon?.image = UIImage.init(named: "like")
        self.addSubview(redHeartIcon!)
        
        heartCount = UITextView.init(frame: CGRect.init(x: ((width-40)/2 - 25), y: 15, width: 30, height: 20))
        heartCount?.font = UIFont.systemFont(ofSize: 10)
        heartCount?.textColor = UIColor.darkGray
        self.addSubview(heartCount!)
        
        fitBtn = UIButton.init(frame: CGRect.init(x: 0, y: (height - 30)/2 + 5, width: (width-30)/2, height: 36))
        fitBtn?.backgroundColor = UIColor.init(red: 253/255.0, green: 220/255.0, blue: 56/255.0, alpha: 1.0)
        let btnIconLayer:CALayer = CALayer()
        btnIconLayer.contents = UIImage.init(named: "fitIcon")?.cgImage
        btnIconLayer.frame = CGRect.init(x: ((width-30)/2 - 30)/2 - 25, y: 8, width: 20, height: 18)
        fitBtn?.layer.addSublayer(btnIconLayer)
        
        let btnTextLayer:CATextLayer = CATextLayer.init()
        btnTextLayer.string = "试穿"
        btnTextLayer.fontSize = 15
        btnTextLayer.foregroundColor = UIColor.darkGray.cgColor
        btnTextLayer.frame = CGRect.init(x: ((width-30)/2 - 30)/2 + 5, y: 8, width: 30, height: 17)
        fitBtn?.layer.addSublayer(btnTextLayer)
        self.addSubview(fitBtn!)
        
        self.backgroundColor = UIColor.white
    }
    
    func initImageView(imgView:String, heartCount:Int){
        self.imgView?.af_setImage(withURL: URL.init(string: imgView)!)
        self.heartCount?.text = String(stringInterpolationSegment:heartCount)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
