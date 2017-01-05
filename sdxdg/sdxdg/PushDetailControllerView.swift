//
//  PushDetailControllerView.swift
//  sdxdg
//
//  Created by lotusprize on 17/1/4.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import UIKit

class PushDetailViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var namePanel:UIView?
    var contentPanel:UIView?
    var imagePanel:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        namePanel = UIView.init(frame: CGRect.init(x: 0, y: 10, width: screenWidth, height: 75))
        namePanel?.backgroundColor = UIColor.white
        let width = (screenWidth - 60) / 5
        self.addCustomer(name: "王子文", x: 10, y: 10, width: width, height: 20)
        self.addCustomer(name: "李成然", x: 20 + width, y: 10, width: width, height: 20)
        self.addCustomer(name: "单风尘", x: 30 + width * 2, y: 10, width: width, height: 20)
        self.addCustomer(name: "李令浩", x: 40 + width * 3, y: 10, width: width, height: 20)
        self.addCustomer(name: "邵可", x: 50 + width * 4, y: 10, width: width, height: 20)
        self.addCustomer(name: "王跃而", x: 10, y: 45, width: width, height: 20)
        self.addCustomer(name: "吴小云", x: 20 + width, y: 45, width: width, height: 20)
        self.addCustomer(name: "李世东", x: 30 + width * 2, y: 45, width: width, height: 20)
        
        scrollView.addSubview(namePanel!)
        
        contentPanel = UIView.init(frame: CGRect.init(x: 0, y: 95, width: screenWidth, height: 95))
        contentPanel?.backgroundColor = UIColor.white
        
        let titleLayer:CATextLayer = CATextLayer()
        titleLayer.frame = CGRect.init(x: 10, y: 10, width: screenWidth - 20, height: 35)
        titleLayer.fontSize = 17
        titleLayer.foregroundColor = UIColor.darkGray.cgColor
        titleLayer.string = "SUNDANCE 商务男装造型"
        contentPanel?.layer.addSublayer(titleLayer)
        
        let contentLayer:CATextLayer = CATextLayer()
        contentLayer.frame = CGRect.init(x: 10, y: 45, width: screenWidth - 20, height: 45)
        contentLayer.fontSize = 14
        contentLayer.foregroundColor = UIColor.darkGray.cgColor
        contentLayer.string = "亲爱的顾客您好！这次搭配内容是冬季商务系列新品，为您推送适合本次服务的搭配方案。祝您生活愉快!"
        contentLayer.isWrapped = true
        contentPanel?.layer.addSublayer(titleLayer)
        contentPanel?.layer.addSublayer(contentLayer)
        
        scrollView.addSubview(contentPanel!)
        
        imagePanel = UIView.init(frame: CGRect.init(x: 0, y: 200, width: screenWidth, height: screenHeight))
        let imgView1:UIImageView = UIImageView.init(frame: CGRect.init(x: 10, y: 10, width: (screenWidth - 30) / 2, height: (screenHeight - 30) / 2))
        imgView1.image = UIImage.init(named: "four1")
        imagePanel?.addSubview(imgView1)
        
        let imgView2:UIImageView = UIImageView.init(frame: CGRect.init(x: 20 + (screenWidth - 30) / 2, y: 10, width: (screenWidth - 30) / 2, height: (screenHeight - 30) / 2))
        imgView2.image = UIImage.init(named: "four2")
        imagePanel?.addSubview(imgView2)
        
        let imgView3:UIImageView = UIImageView.init(frame: CGRect.init(x: 10, y: (screenHeight - 30) / 2 + 20, width: (screenWidth - 30) / 2, height: (screenHeight - 30) / 2))
        imgView3.image = UIImage.init(named: "four3")
        imagePanel?.addSubview(imgView3)
        
        let imgView4:UIImageView = UIImageView.init(frame: CGRect.init(x: 20 + (screenWidth - 30) / 2, y: (screenHeight - 30) / 2 + 20, width: (screenWidth - 30) / 2, height: (screenHeight - 30) / 2))
        imgView4.image = UIImage.init(named: "four4")
        imagePanel?.addSubview(imgView4)
        
        scrollView.addSubview(imagePanel!)
        scrollView.contentSize = CGSize.init(width: screenWidth, height: screenHeight + 220)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addCustomer(name:String, x:CGFloat, y:CGFloat,width:CGFloat,height:CGFloat){
        
        let nameLayer:CATextLayer = CATextLayer()
        nameLayer.frame = CGRect.init(x: x, y: y, width: width, height: height)
        nameLayer.string = name
        nameLayer.borderColor = UIColor.init(red: 253/255.0, green: 220/255.0, blue: 56/255.0, alpha: 1.0).cgColor
        nameLayer.borderWidth = 1.0
        nameLayer.cornerRadius = 8
        nameLayer.fontSize = 12
        nameLayer.foregroundColor = UIColor.darkGray.cgColor
        nameLayer.alignmentMode = kCAAlignmentCenter
        nameLayer.isWrapped = true
        
        namePanel?.layer.addSublayer(nameLayer)
    }
    
}
