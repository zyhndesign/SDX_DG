//
//  MyFeedbackDetailViewController.swift
//  sdxdg
//
//  Created by lotusprize on 17/1/5.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import UIKit

class MyFeedbackDetailViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        let panelWidth = (screenWidth - 30)/2
        let panelHeight = (screenHeight - 30 )/2 + 100
        
        let imagePanel1 = UIView.init(frame: CGRect.init(x: 10, y: 10, width: panelWidth, height: panelHeight))
        imagePanel1.backgroundColor = UIColor.white
        let imgView1:UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 10, width: (screenWidth - 30) / 2, height: panelHeight - 100))
        imgView1.image = UIImage.init(named: "four1")
        imagePanel1.addSubview(imgView1)
        self.scrollView.addSubview(imagePanel1)
        
        let nameWidth = (panelWidth - 20)/3
        self.addCustomer(view:imagePanel1,name: "王子文", x: 5, y: panelHeight - 90, width: nameWidth, height: 20)
        self.addCustomer(view:imagePanel1,name: "李成然", x: 10 + nameWidth, y: panelHeight - 90, width: nameWidth, height: 20)
        self.addCustomer(view:imagePanel1,name: "单风尘", x: 15 + nameWidth * 2, y: panelHeight - 90, width: nameWidth, height: 20)
        self.addCustomer(view:imagePanel1,name: "李令浩", x: 5, y: panelHeight - 65, width: nameWidth, height: 20)
        self.addCustomer(view:imagePanel1,name: "邵可", x: 10 + nameWidth, y: panelHeight - 65, width: nameWidth, height: 20)
        
        
        let imagePanel2 = UIView.init(frame: CGRect.init(x: 20 + panelWidth, y: 10, width: panelWidth, height: panelHeight))
        imagePanel2.backgroundColor = UIColor.white
        let imgView2:UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 10, width: (screenWidth - 30) / 2, height: panelHeight - 100))
        imgView2.image = UIImage.init(named: "four2")
        imagePanel2.addSubview(imgView2)
        self.scrollView.addSubview(imagePanel2)
        self.addCustomer(view:imagePanel2,name: "王跃而", x: 5, y: panelHeight - 90, width: nameWidth, height: 20)
        self.addCustomer(view:imagePanel2,name: "吴小云", x: 10 + nameWidth, y: panelHeight - 90, width: nameWidth, height: 20)
        self.addCustomer(view:imagePanel2,name: "李世东", x: 15 + nameWidth * 2, y: panelHeight - 90, width: nameWidth, height: 20)
        
        let imagePanel3 = UIView.init(frame: CGRect.init(x: 10, y: panelHeight + 20, width: panelWidth, height: panelHeight))
        imagePanel3.backgroundColor = UIColor.white
        let imgView3:UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 10, width: (screenWidth - 30) / 2, height: panelHeight - 100))
        imgView3.image = UIImage.init(named: "four3")
        imagePanel3.addSubview(imgView3)
        self.scrollView.addSubview(imagePanel3)
        self.addCustomer(view:imagePanel3,name: "王跃而", x: 5, y: panelHeight - 90, width: nameWidth, height: 20)
        self.addCustomer(view:imagePanel3,name: "吴小云", x: 10 + nameWidth, y: panelHeight - 90, width: nameWidth, height: 20)
        self.addCustomer(view:imagePanel3,name: "李世东", x: 15 + nameWidth * 2, y: panelHeight - 90, width: nameWidth, height: 20)
        
        let imagePanel4 = UIView.init(frame: CGRect.init(x: 20 + panelWidth, y: panelHeight + 20, width: panelWidth, height: panelHeight))
        imagePanel4.backgroundColor = UIColor.white
        let imgView4:UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 10, width: (screenWidth - 30) / 2, height: panelHeight - 100))
        imgView4.image = UIImage.init(named: "four4")
        imagePanel4.addSubview(imgView4)
        self.scrollView.addSubview(imagePanel4)
        self.addCustomer(view:imagePanel4,name: "王子文", x: 5, y: panelHeight - 90, width: nameWidth, height: 20)
        self.addCustomer(view:imagePanel4,name: "李成然", x: 10 + nameWidth, y: panelHeight - 90, width: nameWidth, height: 20)
        self.addCustomer(view:imagePanel4,name: "单风尘", x: 15 + nameWidth * 2, y: panelHeight - 90, width: nameWidth, height: 20)
        self.addCustomer(view:imagePanel4,name: "李令浩", x: 5, y: panelHeight - 65, width: nameWidth, height: 20)
        self.addCustomer(view:imagePanel4,name: "邵可", x: 10 + nameWidth, y: panelHeight - 65, width: nameWidth, height: 20)
        
        self.scrollView.contentSize = CGSize.init(width: screenWidth, height: screenHeight + 210)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func addCustomer(view:UIView,name:String, x:CGFloat, y:CGFloat,width:CGFloat,height:CGFloat){
        
        let nameLayer:CATextLayer = CATextLayer()
        nameLayer.frame = CGRect.init(x: x, y: y, width: width, height: height)
        nameLayer.string = name
        nameLayer.backgroundColor = UIColor.init(red: 253/255.0, green: 220/255.0, blue: 56/255.0, alpha: 1.0).cgColor
        nameLayer.cornerRadius = 8
        nameLayer.fontSize = 12
        nameLayer.foregroundColor = UIColor.darkGray.cgColor
        nameLayer.alignmentMode = kCAAlignmentCenter
        nameLayer.isWrapped = true
        
        view.layer.addSublayer(nameLayer)
    }

}
