//
//  SettingViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/23.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class SettingViewController : UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "backBtn"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(backBtnClick(sender:)))
        self.tableView.tableFooterView = UIView.init(frame:CGRect.zero)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     func backBtnClick(sender: Any) {
        self.dismiss(animated: true, completion: {() -> Void in (print("close complete"))})
    }

    
}
