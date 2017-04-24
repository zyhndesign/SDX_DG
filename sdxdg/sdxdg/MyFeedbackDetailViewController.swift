//
//  MyFeedbackDetailViewController.swift
//  sdxdg
//
//  Created by lotusprize on 17/1/5.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MyFeedbackDetailViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    
    let userId = LocalDataStorageUtil.getUserIdFromUserDefaults()
    var match:Match?
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    let panelWidth = (UIScreen.main.bounds.width - 30)/2
    let panelHeight = (UIScreen.main.bounds.height - 30 )/2 + 100
    
    var imagePanel1:UIView?
    var imagePanel2:UIView?
    var imagePanel3:UIView?
    var imagePanel4:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        
        imagePanel1 = UIView.init(frame: CGRect.init(x: 10, y: 10, width: panelWidth, height: panelHeight))
        imagePanel1?.backgroundColor = UIColor.white
        let imgView1:UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 10, width: (screenWidth - 30) / 2, height: panelHeight - 100))
        imgView1.image = UIImage.init(named: "model")
        imgView1.contentMode = .scaleAspectFit
        imagePanel1?.addSubview(imgView1)
        self.scrollView.addSubview(imagePanel1!)
        
        imagePanel2 = UIView.init(frame: CGRect.init(x: 20 + panelWidth, y: 10, width: panelWidth, height: panelHeight))
        imagePanel2?.backgroundColor = UIColor.white
        let imgView2:UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 10, width: (screenWidth - 30) / 2, height: panelHeight - 100))
        imgView2.image = UIImage.init(named: "model")
        imgView2.contentMode = .scaleAspectFit
        imagePanel2?.addSubview(imgView2)
        self.scrollView.addSubview(imagePanel2!)
        
        imagePanel3 = UIView.init(frame: CGRect.init(x: 10, y: panelHeight + 20, width: panelWidth, height: panelHeight))
        imagePanel3?.backgroundColor = UIColor.white
        let imgView3:UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 10, width: (screenWidth - 30) / 2, height: panelHeight - 100))
        imgView3.image = UIImage.init(named: "model")
        imgView3.contentMode = .scaleAspectFit
        imagePanel3?.addSubview(imgView3)
        self.scrollView.addSubview(imagePanel3!)
        
        imagePanel4 = UIView.init(frame: CGRect.init(x: 20 + panelWidth, y: panelHeight + 20, width: panelWidth, height: panelHeight))
        imagePanel4?.backgroundColor = UIColor.white
        let imgView4:UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 10, width: (screenWidth - 30) / 2, height: panelHeight - 100))
        imgView4.image = UIImage.init(named: "model")
        imgView4.contentMode = .scaleAspectFit
        imagePanel4?.addSubview(imgView4)
        self.scrollView.addSubview(imagePanel4!)
        
        self.scrollView.contentSize = CGSize.init(width: screenWidth, height: screenHeight + 210)
        
        let matchlists:[Matchlist] = (match?.matchlists)!
        var matchlistStr:String = ""
        for matchlist in matchlists{
            matchlistStr.append(String(describing: matchlist.id!))
            matchlistStr.append(",")
        }
        
        self.loadingFeedbackName(userId: userId, matchlistIds: matchlistStr)
        
        if let matchObject = match{
            var matchlists:[Matchlist] = matchObject.matchlists!
            for matchlist in matchlists{
                if matchlist.modelNum == 1{
                    if let url = matchlists[0].modelurl{
                        imgView1.af_setImage(withURL: URL.init(string: url)!)
                    }
                }
                else if matchlist.modelNum == 2{
                    if let url = matchlists[1].modelurl{
                        imgView2.af_setImage(withURL: URL.init(string: url)!)
                    }
                }
                else if matchlist.modelNum == 3{
                    if let url = matchlists[2].modelurl{
                        imgView3.af_setImage(withURL: URL.init(string: url)!)
                    }
                }
                else if matchlist.modelNum == 4{
                    if let url = matchlists[3].modelurl{
                        imgView4.af_setImage(withURL: URL.init(string: url)!)
                    }
                }
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func addCustomer(view:UIView,name:String, x:CGFloat, y:CGFloat,width:CGFloat,height:CGFloat){
        
        let nameLayer:CATextLayer = CATextLayer()
        nameLayer.frame = CGRect.init(x: x, y: y, width: width, height: height)
        nameLayer.string = name
        nameLayer.backgroundColor = UIColor.init(red: 253/255.0, green: 220/255.0, blue: 56/255.0, alpha: 1.0).cgColor
        nameLayer.cornerRadius = 8
        nameLayer.fontSize = 12
        nameLayer.foregroundColor = UIColor.darkGray.cgColor
        nameLayer.alignmentMode = kCAAlignmentCenter
        nameLayer.isWrapped = true
        
        view.layer.addSublayer(nameLayer)
    }

    func loadingFeedbackName(userId:Int, matchlistIds:String){
        let parameters:Parameters = ["userId":userId,"matchlistIds":matchlistIds]
        
        Alamofire.request(ConstantsUtil.APP_FEEDBACK_VIP_NAMES,method:.post,parameters:parameters).responseJSON{
            response in
            
            switch response.result{
            case .success:
                if let jsonResult = response.result.value {
                    let json = JSON(jsonResult)
                    let resultCode = json["resultCode"]
                    
                    if resultCode == 200{
                        print(json["object"])
                        let nameWidth = (self.panelWidth - 20)/3
                        for matchlist in (self.match?.matchlists)!{
                            if matchlist.modelNum == 1{
                                let key = "\(matchlist.id!)"
                                let result:[JSON] = json["object"][key].array!
                                var i:Int = 0
                                for str in result{
                                    if (i >= 0 && i < 3){
                                        self.addCustomer(view:self.imagePanel1!,name: str.string!, x: 5 + (5 * CGFloat(i)) + (CGFloat(i) * nameWidth), y: self.panelHeight - 90, width: nameWidth, height: 20)
                                    }
                                    else if (i >= 3 && i < 6){
                                        self.addCustomer(view:self.imagePanel1!,name: str.string!, x: 5, y: self.panelHeight - 65, width: nameWidth, height: 20)
                                    }
                                    
                                    i = i + 1
                                }
                            }
                            else if matchlist.modelNum == 2{
                                let key = "\(matchlist.id!)"
                                let result:[JSON] = json["object"][key].array!
                                var i:Int = 0
                                for str in result{
                                    if (i >= 0 && i < 3){
                                        self.addCustomer(view:self.imagePanel2!,name: str.string!, x: 5 + (5 * CGFloat(i)) + (CGFloat(i) * nameWidth), y: self.panelHeight - 90, width: nameWidth, height: 20)
                                    }
                                    else if (i >= 3 && i < 6){
                                        self.addCustomer(view:self.imagePanel2!,name: str.string!, x: 5, y: self.panelHeight - 65, width: nameWidth, height: 20)
                                    }
                                    
                                    i = i + 1
                                }
                            }
                            else if matchlist.modelNum == 3{
                                let key = "\(matchlist.id!)"
                                let result:[JSON] = json["object"][key].array!
                                var i:Int = 0
                                for str in result{
                                    if (i >= 0 && i < 3){
                                        self.addCustomer(view:self.imagePanel3!,name: str.string!, x: 5 + (5 * CGFloat(i)) + (CGFloat(i) * nameWidth), y: self.panelHeight - 90, width: nameWidth, height: 20)
                                    }
                                    else if (i >= 3 && i < 6){
                                        self.addCustomer(view:self.imagePanel3!,name: str.string!, x: 5, y: self.panelHeight - 65, width: nameWidth, height: 20)
                                    }
                                    
                                    i = i + 1
                                }
                            }
                            else if matchlist.modelNum == 4{
                                let key = "\(matchlist.id!)"
                                let result:[JSON] = json["object"][key].array!
                                var i:Int = 0
                                for str in result{
                                    if (i >= 0 && i < 3){
                                        self.addCustomer(view:self.imagePanel4!,name: str.string!, x: 5 + (5 * CGFloat(i)) + (CGFloat(i) * nameWidth), y: self.panelHeight - 90, width: nameWidth, height: 20)
                                    }
                                    else if (i >= 3 && i < 6){
                                        self.addCustomer(view:self.imagePanel4!,name: str.string!, x: 5, y: self.panelHeight - 65, width: nameWidth, height: 20)
                                    }
                                    
                                    i = i + 1
                                }
                            }
                            
                        }
                    }
                    else{
                        print(json["message"])
                        MessageUtil.showMessage(view: self.view, message: json["message"].string!)
                    }
                }
            case .failure(let error):
                print(error)
                MessageUtil.showMessage(view: self.view, message: error.localizedDescription)
            }
            
        }
    }
}
