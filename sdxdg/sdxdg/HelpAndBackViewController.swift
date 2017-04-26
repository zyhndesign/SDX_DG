//
//  HelpAndBackViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/24.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HelpAndBackViewController: UIViewController {
    
    @IBOutlet var textView: UITextView!
    @IBOutlet var postBtn: UIButton!
    
    let userId = LocalDataStorageUtil.getUserIdFromUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1.0
        postBtn.layer.cornerRadius = 6.0
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    @IBAction func postDataBtnClick(_ sender: Any) {
        if textView.text.isEmpty{
            MessageUtil.showMessage(view: self.view, message: "请输入反馈内容")
            return
        }
        
        let parameters:Parameters = ["userId":userId,"info":textView.text]
        
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "提交中..."
        Alamofire.request(ConstantsUtil.APP_USER_BACK_HELP_DATA_URL,method:.post,parameters:parameters).responseJSON { (response) in
            
            if let data = response.result.value {
                let responseResult = JSON(data)
                
                let resultCode = responseResult["resultCode"].intValue
                
                if resultCode == 200{
                    hud.label.text = "操作成功"
                    hud.hide(animated: true, afterDelay: 1.0)
                    
                    self.navigationController?.popViewController(animated: true)
                    
                }
                else{
                    hud.label.text = "操作失败"
                    hud.hide(animated: true, afterDelay: 1.0)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
