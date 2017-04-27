//
//  MerchandiseDetailViewController.swift
//  sdxdg
//
//  Created by lotusprize on 17/1/4.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import UIKit

class MerchandiseDetailViewController: UIViewController,UIWebViewDelegate {
    
    @IBOutlet var webView: UIWebView!
    
    var hud:MBProgressHUD?
    var hpId:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        //let filePath:String = Bundle.main.path(forResource: "pDetail", ofType: "html",inDirectory:"sdxdp")!
        //let url:URL = URL.init(fileURLWithPath: filePath)
        if (hpId > 0){
            let url:URL = URL.init(string: ConstantsUtil.APP_HPGL_HP_DETAIL + "\(hpId)")!
            let request:URLRequest = URLRequest.init(url: url)
            webView.loadRequest(request)
            
            hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        }
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        hud?.label.text = "加载中..."
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        hud?.hide(animated: true)
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
