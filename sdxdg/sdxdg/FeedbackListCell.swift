//
//  FeedbackListCell.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/26.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit
import AlamofireImage

class FeedbackListCell: UITableViewCell {
    
    var nameLabel:UILabel?
    var fbIcon1:UIImageView?
    var fbIcon2:UIImageView?
    var fbIcon3:UIImageView?
    var fbIcon4:UIImageView?
    var heartIcon:UIImageView?
    var timeLabel:UILabel?
    
    var sBoard:UIStoryboard?
    var nController:UINavigationController?
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel.init(frame: CGRect.init(x: 10, y: 5, width: 300, height: 25))
        nameLabel?.font = UIFont.systemFont(ofSize: 12)
        self.contentView.addSubview(nameLabel!)
        
        heartIcon = UIImageView.init(frame: CGRect.init(x: screenWidth - 30, y: 5, width: 20, height: 20))
        heartIcon?.image = UIImage.init(named: "like")
        self.contentView.addSubview(heartIcon!)
        
        let fbViewWidth = (screenWidth - 50) / 4
        
        fbIcon1 = UIImageView.init(frame: CGRect.init(x: 10, y: 35, width: fbViewWidth, height: fbViewWidth))
        self.contentView.addSubview(fbIcon1!)
        
        fbIcon2 = UIImageView.init(frame: CGRect.init(x: 20 + fbViewWidth, y: 35, width: fbViewWidth, height: fbViewWidth))
        self.contentView.addSubview(fbIcon2!)
        
        fbIcon3 = UIImageView.init(frame: CGRect.init(x: 30 + fbViewWidth * 2, y: 35, width: fbViewWidth, height: fbViewWidth))
        self.contentView.addSubview(fbIcon3!)
        
        fbIcon4 = UIImageView.init(frame: CGRect.init(x: 40 + fbViewWidth * 3, y: 35, width: fbViewWidth, height: fbViewWidth))
        self.contentView.addSubview(fbIcon4!)
        
        timeLabel = UILabel.init(frame: CGRect.init(x: screenWidth - 130, y: 40 + ((screenWidth - 50) / 4), width: 130, height: 25))
        timeLabel?.font = UIFont.systemFont(ofSize: 10)
        self.contentView.addSubview(timeLabel!)
    }
    
    func initDataForCell(name:String, fbIcon1:String, fbIcon2:String, fbIcon3:String, fbIcon4:String, time:String,storyBoard:UIStoryboard, navigationController:UINavigationController){
        self.sBoard = storyBoard
        self.nController = navigationController
        
        self.nameLabel?.text = name
        self.fbIcon1?.af_setImage(withURL: URL.init(string: fbIcon1)!)
        self.fbIcon2?.af_setImage(withURL: URL.init(string: fbIcon2)!)
        self.fbIcon3?.af_setImage(withURL: URL.init(string: fbIcon3)!)
        self.fbIcon4?.af_setImage(withURL: URL.init(string: fbIcon4)!)
        self.timeLabel?.text = time
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
