//
//  MyMatchTableViewCell.swift
//  sdxdg
//
//  Created by lotusprize on 17/1/4.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import UIKit
import AlamofireImage

class MyMatchTableViewCell : UITableViewCell {
    
    var titleLable:UILabel?
    var timeLabel:UILabel?
    var model1:UIImageView?
    var model2:UIImageView?
    var model3:UIImageView?
    var model4:UIImageView?
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLable = UILabel.init(frame: CGRect.init(x: 10, y: 5, width: 150, height: 25))
        titleLable?.font = UIFont.systemFont(ofSize: 12.0)
        
        
        timeLabel = UILabel.init(frame: CGRect.init(x: screenWidth - 160, y: 5, width: 150, height: 25))
        timeLabel?.font = UIFont.systemFont(ofSize: 12.0)
        timeLabel?.textAlignment = NSTextAlignment.right
        let modelWidth = (screenWidth - 50 ) / 4
        
        model1 = UIImageView.init(frame: CGRect.init(x: 10, y: 30, width: modelWidth, height: modelWidth))
        
        model2 = UIImageView.init(frame: CGRect.init(x: 20 + modelWidth, y: 30, width: modelWidth, height: modelWidth))
        
        model3 = UIImageView.init(frame: CGRect.init(x: 30 + modelWidth * 2, y: 30, width: modelWidth, height: modelWidth))
        
        model4 = UIImageView.init(frame: CGRect.init(x: 40 + modelWidth * 3, y: 30, width: modelWidth, height: modelWidth))
        
        self.contentView.addSubview(titleLable!)
        self.contentView.addSubview(timeLabel!)
        self.contentView.addSubview(model1!)
        self.contentView.addSubview(model2!)
        self.contentView.addSubview(model3!)
        self.contentView.addSubview(model4!)
        
    }
    
    func initCellData(titleLable:String?, timeLabel:String?, modelLists:[Matchlist]?){
        if let title = titleLable{
            self.titleLable?.text = title
        }
        
        if let time = timeLabel{
            self.timeLabel?.text = time
        }
        
        if let modellist = modelLists{
            
            for matchlistObject in modellist{
                if matchlistObject.modelNum == 1{
                    self.model1?.af_setImage(withURL: URL.init(string: matchlistObject.modelurl!)!)
                }
                else if matchlistObject.modelNum == 2{
                    self.model2?.af_setImage(withURL: URL.init(string: matchlistObject.modelurl!)!)
                }
                else if matchlistObject.modelNum == 3{
                    self.model3?.af_setImage(withURL: URL.init(string: matchlistObject.modelurl!)!)
                }
                else if matchlistObject.modelNum == 4{
                    self.model4?.af_setImage(withURL: URL.init(string: matchlistObject.modelurl!)!)
                }
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
