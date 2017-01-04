//
//  ShareViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/30.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class ShareViewController : UIViewController{
    
    @IBOutlet var addCustomerImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(addCustomerGestureTap(sender:)))
        addCustomerImage.addGestureRecognizer(gesture)
        
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
