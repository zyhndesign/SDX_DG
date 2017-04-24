//
//  PushDetailControllerView.swift
//  sdxdg
//
//  Created by lotusprize on 17/1/4.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire
import SwiftyJSON

class PushDetailViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var namePanel:UIView?
    var contentPanel:UIView?
    var imagePanel:UIView?
    
    var match:Match?
    let userId = LocalDataStorageUtil.getUserIdFromUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        namePanel = UIView.init(frame: CGRect.init(x: 0, y: 10, width: screenWidth, height: 75))
        namePanel?.backgroundColor = UIColor.white
        
        scrollView.addSubview(namePanel!)
        
        contentPanel = UIView.init(frame: CGRect.init(x: 0, y: 95, width: screenWidth, height: 95))
        contentPanel?.backgroundColor = UIColor.white
        
        let titleLayer:CATextLayer = CATextLayer()
        titleLayer.frame = CGRect.init(x: 10, y: 10, width: screenWidth - 20, height: 35)
        titleLayer.fontSize = 17
        titleLayer.foregroundColor = UIColor.darkGray.cgColor
        titleLayer.string = match?.seriesname
        contentPanel?.layer.addSublayer(titleLayer)
        
        scrollView.addSubview(contentPanel!)
        
        imagePanel = UIView.init(frame: CGRect.init(x: 0, y: 200, width: screenWidth, height: screenHeight))
        let imgView1:UIImageView = UIImageView.init(frame: CGRect.init(x: 10, y: 10, width: (screenWidth - 30) / 2, height: (screenHeight - 30) / 2))
        imgView1.contentMode = .scaleAspectFit
        imgView1.backgroundColor = UIColor.white
        imagePanel?.addSubview(imgView1)
        
        let imgView2:UIImageView = UIImageView.init(frame: CGRect.init(x: 20 + (screenWidth - 30) / 2, y: 10, width: (screenWidth - 30) / 2, height: (screenHeight - 30) / 2))
        imgView2.contentMode = .scaleAspectFit
        imagePanel?.addSubview(imgView2)
        
        let imgView3:UIImageView = UIImageView.init(frame: CGRect.init(x: 10, y: (screenHeight - 30) / 2 + 20, width: (screenWidth - 30) / 2, height: (screenHeight - 30) / 2))
        imgView3.contentMode = .scaleAspectFit
        imagePanel?.addSubview(imgView3)
        
        let imgView4:UIImageView = UIImageView.init(frame: CGRect.init(x: 20 + (screenWidth - 30) / 2, y: (screenHeight - 30) / 2 + 20, width: (screenWidth - 30) / 2, height: (screenHeight - 30) / 2))
        imgView4.contentMode = .scaleAspectFit
        imagePanel?.addSubview(imgView4)
        
        if let matchlistData = match?.matchlists{
            for object in matchlistData{
                if (object.modelNum == 1){
                    imgView1.af_setImage(withURL: URL.init(string: object.modelurl!)!)
                }
                else if (object.modelNum == 2){
                    imgView2.af_setImage(withURL: URL.init(string: object.modelurl!)!)
                }
                else if (object.modelNum == 3){
                    imgView3.af_setImage(withURL: URL.init(string: object.modelurl!)!)
                }
                else if (object.modelNum == 4){
                    imgView4.af_setImage(withURL: URL.init(string: object.modelurl!)!)
                }
            }
        }
        
        scrollView.addSubview(imagePanel!)
        scrollView.contentSize = CGSize.init(width: screenWidth, height: screenHeight + 220)
        
        self.loadShareInfo(userId: userId, matchId: (match?.id)!)
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addCustomer(name:String, x:CGFloat, y:CGFloat,width:CGFloat,height:CGFloat){
        
        let nameLayer:CATextLayer = CATextLayer()
        nameLayer.frame = CGRect.init(x: x, y: y, width: width, height: height)
        nameLayer.string = name
        nameLayer.borderColor = UIColor.init(red: 253/255.0, green: 220/255.0, blue: 56/255.0, alpha: 1.0).cgColor
        nameLayer.borderWidth = 1.0
        nameLayer.cornerRadius = 8
        nameLayer.fontSize = 12
        nameLayer.foregroundColor = UIColor.darkGray.cgColor
        nameLayer.alignmentMode = kCAAlignmentCenter
        nameLayer.isWrapped = true
        
        namePanel?.layer.addSublayer(nameLayer)
    }
    
    func loadShareInfo(userId:Int, matchId:Int){
        let parameters:Parameters = ["userId":userId,"matchId":matchId]
        
        Alamofire.request(ConstantsUtil.APP_GET_SHARE_DATA_URL,method:.post,parameters:parameters).responseJSON{
            response in
            
            switch response.result{
            case .success:
                if let jsonResult = response.result.value {
                    let json = JSON(jsonResult)
                    let resultCode = json["resultCode"]
                    
                    if resultCode == 200{
                        if (json["object"].count > 0){
                            let contentLayer:CATextLayer = CATextLayer()
                            contentLayer.frame = CGRect.init(x: 10, y: 45, width: self.screenWidth - 20, height: 45)
                            contentLayer.fontSize = 14
                            contentLayer.string = json["object"][0][0].string
                            contentLayer.foregroundColor = UIColor.darkGray.cgColor
                            contentLayer.isWrapped = true
                            self.contentPanel?.layer.addSublayer(contentLayer)
                            
                            var shareStr:String = json["object"][0][1].string!
                            let shareStrArr = shareStr.characters.split(separator: ",").map(String.init)
                            var i:Int = 0
                            let width = (self.screenWidth - 60) / 5
                            for shareName in shareStrArr{
                                
                                if (i >= 0 && i < 5){
                                    let x = 10 + (CGFloat(i) * 10) + (CGFloat(i) * width)
                                    self.addCustomer(name: shareName, x: x, y: 10, width: width, height: 20)
                                }
                                else if ( i >= 5 && i <= 10){
                                    let x = 10 + ((CGFloat(i - 5)) * 10) + (CGFloat(i - 5) * width)
                                    self.addCustomer(name: shareName, x: x, y: 45, width: width, height: 20)
                                }
                                i = i + 1
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
