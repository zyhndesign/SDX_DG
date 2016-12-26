//
//  ConsumerListCell.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/26.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class ConsumerListCell: UITableViewCell {
    
    var thumbView:UIImageView?
    var nameLabel:UILabel?
    var priceLabel:UILabel?
    var matchBtn:UIButton?
    var consumerTime:UILabel?
    
    var sBoard:UIStoryboard?
    var nController:UINavigationController?
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let yellowColor:UIColor = UIColor.init(red:253/255.0, green: 220/255.0, blue: 56/255.0, alpha: 1.0)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        thumbView = UIImageView.init(frame: CGRect.init(x: 15, y: 5, width: 100, height: 100))
        thumbView?.contentMode = UIViewContentMode.scaleAspectFill
        self.contentView.addSubview(thumbView!)
        
        nameLabel = UILabel.init(frame: CGRect.init(x: 130, y: 10, width: 150, height: 25))
        nameLabel?.font = UIFont.systemFont(ofSize: 12)
        self.contentView.addSubview(nameLabel!)
        
        priceLabel = UILabel.init(frame: CGRect.init(x: screenWidth - 60, y: 10, width: 60,height: 25))
        priceLabel?.font = UIFont.systemFont(ofSize: 12)
        self.contentView.addSubview(priceLabel!)
        
        matchBtn = UIButton.init(frame: CGRect.init(x: 130, y: 55, width: 100, height: 30))
        matchBtn?.setTitle("搭配", for: UIControlState.normal)
        matchBtn?.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        matchBtn?.layer.cornerRadius = 7.0
        matchBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        matchBtn?.backgroundColor = yellowColor
        self.contentView.addSubview(matchBtn!)
        
        consumerTime = UILabel.init(frame: CGRect.init(x: screenWidth - 80, y: 70, width: 100, height: 25))
        consumerTime?.font = UIFont.systemFont(ofSize: 12)
        self.contentView.addSubview(consumerTime!)
        
    }
    
    func initDataForCell(imageName:String, name:String, price:String, time:String, storyBoard:UIStoryboard, navigationController:UINavigationController){
        thumbView?.image = UIImage.init(named: imageName)
        nameLabel?.text = name
        priceLabel?.text = price
        consumerTime?.text = time
        sBoard = storyBoard
        nController = navigationController
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
