//
//  HelpAndBackViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/24.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class HelpAndBackViewController: UIViewController {
    
    @IBOutlet var textView: UITextView!
    @IBOutlet var postBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1.0
        postBtn.layer.cornerRadius = 6.0
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    @IBAction func postDataBtnClick(_ sender: Any) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
