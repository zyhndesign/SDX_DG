//
//  MatchViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/14.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addClientBtnClick(_ sender: Any) {
        self.performSegue(withIdentifier: "CustomerListSegue", sender: self)
    }
    
    
    @IBAction func fourViewBtnClick(_ sender: Any) {
        
    }
    
    
    @IBAction func moreBtnClick(_ sender: Any) {
        
    }
}
