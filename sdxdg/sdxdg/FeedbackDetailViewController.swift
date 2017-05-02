//
//  FeedbackDetailViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/26.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

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
    
    var matchLists:[Matchlist]?
    
    var vipId:Int = 0
    
    let userId = LocalDataStorageUtil.getUserIdFromUserDefaults()
    
    func initData(matchLists:[Matchlist]){
        self.matchLists = matchLists
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
        fbView1?.af_setImage(withURL: URL.init(string: (matchLists?[0].modelurl)!)!)
        fbView2?.af_setImage(withURL: URL.init(string: (matchLists?[1].modelurl)!)!)
        fbView3?.af_setImage(withURL: URL.init(string: (matchLists?[2].modelurl)!)!)
        fbView4?.af_setImage(withURL: URL.init(string: (matchLists?[3].modelurl)!)!)
       
        if let mlist = matchLists{
            var ids:String = ""
            for data in mlist{
                ids.append(String(describing: data.id));
                ids.append(",");
            }
            self.loadData(matchlistIds: ids)
        }
        
    }
    
    func loadData(matchlistIds:String){
        
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "正在加载中..."
        
        let parameters:Parameters = ["matchlistIds":matchlistIds, "userId":userId, "vipId":vipId]
        
        Alamofire.request(ConstantsUtil.APP_USER_LOGIN_URL,method:.post,parameters:parameters).responseJSON{
            response in
            
            switch response.result{
            case .success:
                if let jsonResult = response.result.value {
                    let json = JSON(jsonResult)
                    let resultCode = json["resultCode"]
                    
                    
                    if resultCode == 200{
                        
                        for index in 0...(json["object"].count-1){
                            var i:Int = 0
                            for mList in self.matchLists!{
                                i = i + 1
                                if mList.id == json["object"][index].int{
                                    if (i == 0){
                                         self.like1?.image = UIImage.init(named: "like")
                                    }
                                    else if (i == 1){
                                         self.like2?.image = UIImage.init(named: "like")
                                    }
                                    else if (i == 2){
                                         self.like3?.image = UIImage.init(named: "like")
                                    }
                                    else if (i == 3){
                                         self.like4?.image = UIImage.init(named: "like")
                                    }
                                }
                            }
                            
                        }
                    }
                    else{
                        hud.label.text = "加载点赞数据失败"
                        hud.hide(animated: true, afterDelay: 0.5)
                    }
                }
            case .failure(let error):
                hud.label.text = "加载点赞数据失败"
                hud.hide(animated: true, afterDelay: 0.5)
            }
            
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
