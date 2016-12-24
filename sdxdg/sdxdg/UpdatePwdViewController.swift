//
//  UpdatePwdViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/24.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class UpdatePwdViewController: UIViewController {
    
    @IBOutlet var pwdTextField: UITextField!
    @IBOutlet var newPwdTextField1: UITextField!
    @IBOutlet var newPwdTextField2: UITextField!
    @IBOutlet var postBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        postBtn.layer.cornerRadius = 6.0
    }
    
    @IBAction func postBtnClick(_ sender: Any) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
