//
//  FeedbackDetailViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/26.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class FeedbackDetailViewController: UIViewController {
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var fbView1:UIImageView?
    var fbView2:UIImageView?
    var fbView3:UIImageView?
    var fbView4:UIImageView?
    
    var like1:UIImageView?
    var like2:UIImageView?
    var like3:UIImageView?
    var like4:UIImageView?
    
    
    var fbImage1:String?
    var fbImage1Like: Bool = false
    var fbImage2:String?
    var fbImage2Like: Bool = false
    var fbImage3:String?
    var fbImage3Like: Bool = false
    var fbImage4:String?
    var fbImage4Like: Bool = false
    
    func initData(fbImage1:String, fbImage1Like: Bool, fbImage2:String, fbImage2Like: Bool, fbImage3:String, fbImage3Like: Bool, fbImage4:String,fbImage4Like: Bool){
        
        self.fbImage1 = fbImage1
        self.fbImage2 = fbImage2
        self.fbImage3 = fbImage3
        self.fbImage4 = fbImage4
        self.fbImage1Like = fbImage1Like
        self.fbImage2Like = fbImage2Like
        self.fbImage3Like = fbImage3Like
        self.fbImage4Like = fbImage4Like
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let imageWidth = (screenWidth - 24) / 2
        let imageHeight = (screenHeight - 84) / 2
        fbView1 = UIImageView.init(frame: CGRect.init(x: 8, y: 72, width: imageWidth, height: imageHeight))
        self.view.addSubview(fbView1!)
        
        fbView2 = UIImageView.init(frame: CGRect.init(x: 16 + imageWidth, y: 72, width: imageWidth, height: imageHeight))
        self.view.addSubview(fbView2!)
        
        fbView3 = UIImageView.init(frame: CGRect.init(x: 8, y: 78 + imageHeight, width: imageWidth, height: imageHeight))
        self.view.addSubview(fbView3!)
        
        fbView4 = UIImageView.init(frame: CGRect.init(x: 16 + imageWidth, y: 78 + imageHeight, width: imageWidth, height: imageHeight))
        self.view.addSubview(fbView4!)
        
        
        like1 = UIImageView.init(frame: CGRect.init(x: imageWidth - 25, y: 88, width: 20, height: 20))
        self.view.addSubview(like1!)
        like2 = UIImageView.init(frame: CGRect.init(x: (imageWidth * 2 + 16) - 35, y: 88, width: 20, height: 20))
        self.view.addSubview(like2!)
        like3 = UIImageView.init(frame: CGRect.init(x: imageWidth - 25, y: imageHeight + 88, width: 20, height: 20))
        self.view.addSubview(like3!)
        like4 = UIImageView.init(frame: CGRect.init(x: (imageWidth * 2 + 16) - 35, y: imageHeight + 88, width: 20, height: 20))
        self.view.addSubview(like4!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fbView1?.image = UIImage.init(named: fbImage1!)
        fbView2?.image = UIImage.init(named: fbImage2!)
        fbView3?.image = UIImage.init(named: fbImage3!)
        fbView4?.image = UIImage.init(named: fbImage4!)
        if fbImage1Like{
            like1?.image = UIImage.init(named: "like")
        }
        if fbImage2Like{
            like2?.image = UIImage.init(named: "like")
        }
        if fbImage3Like{
            like3?.image = UIImage.init(named: "like")
        }
        if fbImage4Like{
            like4?.image = UIImage.init(named: "like")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
