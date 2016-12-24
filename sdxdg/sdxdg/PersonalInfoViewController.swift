//
//  PersonalInfoViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/24.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class PersonalInfoViewController: UIViewController {
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var userIconImageView: UIImageView!
    @IBOutlet var postBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postBtn.layer.cornerRadius = 6
    }
    
    @IBAction func postDataBtnClick(_ sender: Any) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
