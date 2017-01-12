//
//  MatchListCell.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/20.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class MatchListCell : UICollectionViewCell{
    let width = UIScreen.main.bounds.size.width//获取屏幕宽
    
    var imgView : UIImageView?//cell上的图片
    var titleLabel:UILabel?//cell上title
    var priceLabel:UILabel?//cell上价格
    var matchImage:UIImageView?
    var imgName:String?
    
    var customerLabel1:UILabel?//cell相关客户1
    var customerLabel2:UILabel?//cell相关客户2
    var customerLabel3:UILabel?//cell相关客户3
    var customerLabel4:UILabel?//cell相关客户4
    var customerLabel5:UILabel?//cell相关客户5
    var customerLabel6:UILabel?//cell相关客户6
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        //初始化各种控件
       
        imgView = UIImageView(frame: CGRect(origin: CGPoint.init(x: 2, y: 10), size: CGSize.init(width: (width-30)/2, height: (width-30)/2)))
        imgView?.contentMode = UIViewContentMode.scaleAspectFit
        self.addSubview(imgView!)
        
        let matchImageX = (width-30)/2 - 45
        let matchImageY = (width-30)/2 - 30
        matchImage = UIImageView(frame: CGRect(origin: CGPoint.init(x:matchImageX, y: matchImageY), size: CGSize.init(width: 40, height: 40)))
        matchImage?.image = UIImage.init(named: "selectMatchIcon")
        matchImage?.contentMode = UIViewContentMode.scaleAspectFit
        let tapMatchImage:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tapMatchImageClick(sender:)))
        matchImage?.addGestureRecognizer(tapMatchImage)
        matchImage?.isUserInteractionEnabled = true
        self.addSubview(matchImage!)
        
        titleLabel = UILabel(frame: CGRect(origin: CGPoint.init(x: 5, y: imgView!.frame.maxY-12), size: CGSize.init(width: (width-50)/2, height: 50)))
        titleLabel?.numberOfLines = 0
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 14.0)
        titleLabel?.textColor = UIColor.lightGray
        self.addSubview(titleLabel!)
        
        priceLabel = UILabel(frame: CGRect(origin: CGPoint.init(x: (width-50)/2 - 30, y: imgView!.frame.maxY - 12), size: CGSize.init(width: (width-50)/3, height: 50)))
        priceLabel?.numberOfLines = 0
        priceLabel?.font = UIFont.boldSystemFont(ofSize: 14.0)
        priceLabel?.textColor = UIColor.lightGray
        self.addSubview(priceLabel!)
        
        customerLabel1 = UILabel(frame:CGRect(origin: CGPoint.init(x: 5, y: titleLabel!.frame.maxY - 12), size: CGSize.init(width: (width-40)/2/3 - 5, height: 20)))
        initUILabel(customerLabel1!)
        self.addSubview(customerLabel1!)
        
        customerLabel2 = UILabel(frame:CGRect(origin: CGPoint.init(x: customerLabel1!.frame.maxX + 3, y: titleLabel!.frame.maxY - 12), size: CGSize.init(width: (width-40)/2/3 - 5, height: 20)))
        initUILabel(customerLabel2!)
        self.addSubview(customerLabel2!)
        
        customerLabel3 = UILabel(frame:CGRect(origin: CGPoint.init(x: customerLabel2!.frame.maxX + 3, y: titleLabel!.frame.maxY - 12), size: CGSize.init(width: (width-40)/2/3 - 5, height: 20)))
        initUILabel(customerLabel3!)
        self.addSubview(customerLabel3!)
        
        customerLabel4 = UILabel(frame:CGRect(origin: CGPoint.init(x: 5, y: customerLabel1!.frame.maxY + 3), size: CGSize.init(width: (width-40)/2/3 - 5, height: 20)))
        initUILabel(customerLabel4!)
        self.addSubview(customerLabel4!)
        
        customerLabel5 = UILabel(frame:CGRect(origin: CGPoint.init(x: customerLabel4!.frame.maxX + 3, y: customerLabel1!.frame.maxY + 3), size: CGSize.init(width: (width-40)/2/3 - 5, height: 20)))
        initUILabel(customerLabel5!)
        self.addSubview(customerLabel5!)
        
        customerLabel6 = UILabel(frame:CGRect(origin: CGPoint.init(x: customerLabel5!.frame.maxX + 3, y: customerLabel1!.frame.maxY + 3), size: CGSize.init(width: (width-40)/2/3 - 5, height: 20)))
        initUILabel(customerLabel6!)
        self.addSubview(customerLabel6!)
    }
    
    func initUILabel(_ label: UILabel){
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.boldSystemFont(ofSize: 10.0)
        label.textColor = UIColor.lightGray
        label.layer.cornerRadius = 7.0
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.init(colorLiteralRed: 253.0/255.0, green: 220.0/255.0, blue: 56.0/255.0, alpha: 1.0).cgColor
    }
    
    func tapMatchImageClick(sender:Any){
        print("click match...")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "modelMatch"), object: imgName)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
