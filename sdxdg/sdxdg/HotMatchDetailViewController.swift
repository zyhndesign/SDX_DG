//
//  HotMatchDetailViewController.swift
//  sdxdg
//
//  Created by lotusprize on 17/4/19.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import UIKit

class HotMatchDetailViewController: UIViewController {
    
    let width = UIScreen.main.bounds.size.width//获取屏幕宽
    let height = UIScreen.main.bounds.size.height
    
    var feedbackModel:FeedbackModel?
    
    var matchImageView:UIImageView?
    var heartIcon:UIImageView?
    var innerCloth:UIImageView?
    var outCloth:UIImageView?
    var trouser:UIImageView?
    var likeCount:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        matchImageView = UIImageView.init(frame: CGRect.init(x: width/4, y: 80, width: width/2, height: height/2+60))
        matchImageView?.contentMode = UIViewContentMode.scaleAspectFit
        if let modelurl = feedbackModel?.modelurl{
            matchImageView?.af_setImage(withURL: URL.init(string: modelurl)!)
        }
        
        innerCloth = UIImageView.init(frame: CGRect.init(x: width/4/2, y: height/2+130, width: width/4, height: width/4))
        if let innerClothModel = feedbackModel?.innerClothUrl{
            if let productImageUrlValue = innerClothModel.productImageUrl{
                print(productImageUrlValue)
                innerCloth?.af_setImage(withURL: URL.init(string:productImageUrlValue)!)
            }
        }
        
        outCloth = UIImageView.init(frame: CGRect.init(x: width/4/2 + width/4, y: height/2+130, width: width/4, height: width/4))
        if let outClothModel = feedbackModel?.outClothUrl{
            if let productImageUrlValue = outClothModel.productImageUrl{
                print(productImageUrlValue)
                outCloth?.af_setImage(withURL: URL.init(string:productImageUrlValue)!)
            }
        }
        
        trouser = UIImageView.init(frame: CGRect.init(x: width/4/2 + width/2, y: height/2+130, width: width/4, height: width/4))
        if let trouserModel = feedbackModel?.trousersClothUrl{
            if let productImageUrlValue = trouserModel.productImageUrl{
                print(productImageUrlValue)
                trouser?.af_setImage(withURL: URL.init(string:productImageUrlValue)!)
            }
        }
        
        heartIcon = UIImageView.init(frame: CGRect.init(x: width - 100, y: 90, width: 25, height: 25))
        heartIcon?.image = UIImage.init(named: "like")
        
        likeCount = UILabel.init(frame: CGRect.init(x: width - 60, y: 95, width: 60, height: 25))
        likeCount?.textAlignment = .left
        if let count = feedbackModel?.countLike{
            likeCount?.text = "\(count)"
        }
        else{
            likeCount?.text = "\(0)"
        }
        likeCount?.textColor = UIColor.darkGray
        
        self.view.addSubview(matchImageView!)
        self.view.addSubview(innerCloth!)
        self.view.addSubview(outCloth!)
        self.view.addSubview(trouser!)
        self.view.addSubview(heartIcon!)
        self.view.addSubview(likeCount!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
