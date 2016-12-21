//
//  MatchViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/14.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController {
    
    @IBOutlet var modelView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let gesture:UIGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(imageTapped(sender:)))
        modelView.addGestureRecognizer(gesture)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageTapped(sender: UIGestureRecognizer){
        let view = self.storyboard?.instantiateViewController(withIdentifier: "MatchCollectionView")
        self.present(view!, animated: true, completion: {() -> Void in (print("complete"))})
    }
    
    @IBAction func addClientBtnClick(_ sender: Any) {
        self.performSegue(withIdentifier: "CustomerListSegue", sender: self)
    }
    
    
    @IBAction func fourViewBtnClick(_ sender: Any) {
        
    }
    
    
    @IBAction func moreBtnClick(_ sender: Any) {
        
    }
}
