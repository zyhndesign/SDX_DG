//
//  ShareViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/30.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class ShareViewController : UIViewController,UIWebViewDelegate{
    
    @IBOutlet var webView: UIWebView!
    var hud:MBProgressHUD?
    
    @IBOutlet var sendSareBtn: UIButton!
    
    var matchId:Int = 0
    
    private var shareUrl:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.delegate = self
        
        //let filePath:String = Bundle.main.path(forResource: "nDetail", ofType: "html",inDirectory:"sdxdp")!
        //let url:URL = URL.init(fileURLWithPath: filePath)
        shareUrl = ConstantsUtil.APP_DGGL_MATCH_DETAIL + "\(matchId)"
        let url:URL = URL.init(string: shareUrl)!
        let request:URLRequest = URLRequest.init(url: url)
        webView.loadRequest(request)
        
        hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        hud?.label.text = "加载中..."
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        hud?.hide(animated: true)
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
    }
    
    @IBAction func sendSareBtnClick(_ sender: Any) {
        print("share btn click")
        
        UMSocialUIManager.showShareMenuViewInWindow{ (platformType,userInfo) -> Void in
            
            let messageObject:UMSocialMessageObject = UMSocialMessageObject.init()
            messageObject.text = ""//分享的文本
            
            //1.分享图片
            /*
            let shareObject:UMShareImageObject = UMShareImageObject.init()
            shareObject.title = "Umeng分享标题"
            shareObject.descr = ""
            shareObject.thumbImage = UIImage.init(named: "fb1")
            shareObject.shareImage = "https://dev.umeng.com/images/tab2_1.png"
            messageObject.shareObject = shareObject;
            */
            
             //2.分享分享网页
             let shareObject:UMShareWebpageObject = UMShareWebpageObject.init()
             shareObject.title = "圣得西服装新款推荐"
             shareObject.descr = "亲爱的顾客您好！这次服装搭配请您查看详情，祝您生活愉快！"
             shareObject.thumbImage = UIImage.init(named: "AppIcon")//缩略图
             shareObject.webpageUrl = self.shareUrl;
             messageObject.shareObject = shareObject;
           
            UMSocialManager.default().share(to: platformType, messageObject: messageObject, currentViewController: self, completion: { (shareResponse, error) -> Void in
                if error != nil {
                    print("Share Fail with error ：%@", error)
                }else{
                    print("Share succeed")
                }
            })
            
        }
    }
    
    /**
     分享按钮响应事件
     */
    func shareButtonClicked(sender:UIButton) {
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
