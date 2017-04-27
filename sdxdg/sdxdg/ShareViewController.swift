//
//  ShareViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/30.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class ShareViewController : UIViewController,UIWebViewDelegate,PassCustomerProtocol{
    
    @IBOutlet var addCustomerImage: UIImageView!
    @IBOutlet var webView: UIWebView!
    var hud:MBProgressHUD?
    
    @IBOutlet var customerLabel: UILabel!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contextTextView: UITextView!
    
    @IBOutlet var sendSareBtn: UIButton!
    
    var matchId:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(addCustomerGestureTap(sender:)))
        addCustomerImage.addGestureRecognizer(gesture)
        
        self.webView.delegate = self
        
        //let filePath:String = Bundle.main.path(forResource: "nDetail", ofType: "html",inDirectory:"sdxdp")!
        //let url:URL = URL.init(fileURLWithPath: filePath)
        let url:URL = URL.init(string: ConstantsUtil.APP_DGGL_MATCH_DETAIL + "\(matchId)")!
        let request:URLRequest = URLRequest.init(url: url)
        webView.loadRequest(request)
        
        hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        
        customerLabel.numberOfLines = 1
        customerLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
        customerLabel.layer.borderWidth = 1
        customerLabel.layer.borderColor = UIColor.lightGray.cgColor
        
        contextTextView.layer.borderColor = UIColor.lightGray.cgColor
        contextTextView.layer.borderWidth = 1
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
        let view = self.storyboard?.instantiateViewController(withIdentifier: "CustomerList") as! CustomerListController
        view.customerProtocolDelegate = self
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func returnCustomerValue(customer:String){
        customerLabel.text = customerLabel.text! + customer
    }
    
    @IBAction func sendSareBtnClick(_ sender: Any) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
