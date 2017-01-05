//
//  ShareViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/30.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class ShareViewController : UIViewController,UIWebViewDelegate{
    
    @IBOutlet var addCustomerImage: UIImageView!
    @IBOutlet var webView: UIWebView!
    var hud:MBProgressHUD?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(addCustomerGestureTap(sender:)))
        addCustomerImage.addGestureRecognizer(gesture)
        
        self.webView.delegate = self
        let filePath:String = Bundle.main.path(forResource: "nDetail", ofType: "html",inDirectory:"sdxdp")!
        
        let url:URL = URL.init(fileURLWithPath: filePath)
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
    
    func addCustomerGestureTap(sender:UITapGestureRecognizer){
        let view = self.storyboard?.instantiateViewController(withIdentifier: "CustomerList")
        self.navigationController?.pushViewController(view!, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
