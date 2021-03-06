//
//  ShareViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/30.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit
import Alamofire

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
        shareUrl = ConstantsUtil.APP_DGGL_SHARE_DETAIL + "\(matchId)"
        let url:URL = URL.init(string: shareUrl)!
        let request:URLRequest = URLRequest.init(url: url)
        webView.loadRequest(request)
        
        hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "backBtn"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(shareButtonClicked(sender:)))
        self.navigationItem.leftItemsSupplementBackButton = true
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
        hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud?.label.text = "加载中..."
        
        let result:String = self.webView.stringByEvaluatingJavaScript(from: "uploadShareContent()")!
        
        if(result.isEmpty){
            hud?.label.text = "分享数据提交失败!"
            hud?.hide(animated: true, afterDelay: 2.0)
        }
        else{
            hud?.hide(animated: true)
            let array = result.components(separatedBy: "|")
            let code = array[0];
            UMSocialUIManager.showShareMenuViewInWindow{ (platformType,userInfo) -> Void in
                
                let messageObject:UMSocialMessageObject = UMSocialMessageObject.init()
                messageObject.text = ""//分享的文本
                
                let shareObject:UMShareWebpageObject = UMShareWebpageObject.init()
                shareObject.title = array[1]
                shareObject.descr = array[2]
                shareObject.thumbImage = UIImage.init(named: "AppIcon")//缩略图
                shareObject.webpageUrl = ConstantsUtil.APP_DGGL_SHARE_RESULT_DETAIL + "\(code)";
                messageObject.shareObject = shareObject;
                
                UMSocialManager.default().share(to: platformType, messageObject: messageObject, currentViewController: self, completion: { (shareResponse, error) -> Void in
                    if error != nil {
                        print("Share Fail with error ：%@", error)
                    }else{
                        let parameters:Parameters = ["matchId":self.matchId,"shareStatus":1];
                        Alamofire.request(ConstantsUtil.APP_USER_LOGIN_URL,method:.post,parameters:parameters).responseJSON{
                            response in
                            
                            switch response.result{
                            case .success:
                                MessageUtil.showMessage(view: self.view, message: "分享成功!")
                            case .failure(let error):
                                MessageUtil.showMessage(view: self.view, message: error.localizedDescription)
                            }
                        }
                    }
                })
            }
        }
    }
    
    /**
     分享按钮响应事件
     */
    func shareButtonClicked(sender:UIButton) {
        
        if (self.webView.canGoBack){
            self.webView.goBack();
        }
        else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
