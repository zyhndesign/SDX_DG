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
        
        let messageObject:UMSocialMessageObject = UMSocialMessageObject.init()
        //创建网页内容对象
        let thumbURL:String =  "https://mobile.umeng.com/images/pic/home/social/img-1.png"
        
        let shareObject:UMShareWebpageObject = UMShareWebpageObject.shareObject(withTitle: "欢迎使用圣得西导购平台", descr: "", thumImage: thumbURL)
        //设置网页地址
        shareObject.webpageUrl = "http://mobile.umeng.com/social"
        
        //分享消息对象设置分享内容对象
        messageObject.shareObject = shareObject;
        
        let sharePaltformArray = [
            [ "share_weixin", "share_friend", "share_sina" , "share_qq", "share_zone"],
            [ "微信","朋友圈", "微博", "QQ", "QQ空间"]
        ]
        
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
