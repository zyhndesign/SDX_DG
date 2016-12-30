//
//  MatchViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/14.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController,UIScrollViewDelegate {
    
    var modelView1: UIImageView?
    var modelView2: UIImageView?
    var modelView3: UIImageView?
    var modelView4: UIImageView?
    
    var scrollView: UIScrollView!
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    var buttonSelect = false
    
    var fourViewPanel:UIView?
    
    var oldX:CGFloat = 0.0
    var newX:CGFloat = 0.0
    var currentPage:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let naviBarHeight = self.navigationController?.navigationBar.bounds.height
        let tabBarHeight = self.tabBarController?.tabBar.bounds.height
        let scrollHeight = screenHeight - naviBarHeight! - tabBarHeight! - 60
        scrollView = UIScrollView()
        scrollView.frame = CGRect.init(x: screenWidth / 4 , y: naviBarHeight! + 20, width: screenWidth / 2, height: scrollHeight)
        self.view.addSubview(scrollView)
        scrollView.canCancelContentTouches = true
        scrollView.delaysContentTouches = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        
        // Do any additional setup after loading the view, typically from a nib.
        self.automaticallyAdjustsScrollViewInsets = false
        modelView1 = UIImageView.init(frame: CGRect.init(x: 0, y: 15, width: screenWidth/2, height: scrollHeight))
        modelView1?.image = UIImage.init(named: "model")
        modelView1?.contentMode = UIViewContentMode.scaleAspectFit
        scrollView.addSubview(modelView1!)
        
        scrollView.clipsToBounds = false
        
        //scrollView.contentInset =  UIEdgeInsetsMake(0, 0, 0, 0)
        
        modelView2 = UIImageView.init(frame: CGRect.init(x: screenWidth / 2, y: 15, width: screenWidth/2, height: scrollHeight))
        modelView2?.image = UIImage.init(named: "model")
        modelView2?.contentMode = UIViewContentMode.scaleAspectFit
        modelView2?.layer.transform = CATransform3DMakeScale(0.8, 0.8, 0)
        scrollView.addSubview(modelView2!)
        
        modelView3 = UIImageView.init(frame: CGRect.init(x: screenWidth, y: 15, width: screenWidth/2, height: scrollHeight))
        modelView3?.image = UIImage.init(named: "model")
        modelView3?.contentMode = UIViewContentMode.scaleAspectFit
        modelView3?.layer.transform = CATransform3DMakeScale(0.6, 0.6, 0)
        scrollView.addSubview(modelView3!)
        
        modelView4 = UIImageView.init(frame: CGRect.init(x: screenWidth  + screenWidth / 2, y: 15, width: screenWidth/2, height: scrollHeight))
        modelView4?.image = UIImage.init(named: "model")
        modelView4?.contentMode = UIViewContentMode.scaleAspectFit
        modelView4?.layer.transform = CATransform3DMakeScale(0.4, 0.4, 0)
        scrollView.addSubview(modelView4!)
        
        scrollView.contentSize = CGSize.init(width: screenWidth * 2, height: scrollHeight)
        let gesture:UIGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(imageTapped(sender:)))
        scrollView.addGestureRecognizer(gesture)
       
        
        fourViewPanel = UIView.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 44), size: CGSize.init(width: screenWidth, height: screenHeight)))
        fourViewPanel?.backgroundColor = UIColor.white
        
        scrollView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageTapped(sender: UIGestureRecognizer){
        print("click...")
        let view = self.storyboard?.instantiateViewController(withIdentifier: "MatchCollectionView")
        //self.present(view!, animated: true, completion: {() -> Void in (print("complete"))})
        self.navigationController?.pushViewController(view!, animated: true)
        if (currentPage == 0){
        
        }
        else if (currentPage == 1){
        
        }
        else if (currentPage == 2){
        
        }
        else if (currentPage == 3){
        
        }
    }
    
    @IBAction func addClientBtnClick(_ sender: Any) {
        //self.performSegue(withIdentifier: "CustomerListSegue", sender: self)
    }
    
    @IBAction func fourViewBtnClick(_ sender: Any) {
        
        if (buttonSelect){
            buttonSelect = false
            
            print("remove")
            /*
            UIView.animate(withDuration: 1, delay:0.01,
                           options:UIViewAnimationOptions.transitionCrossDissolve, animations:
                {
                ()-> Void in
                self.fourViewPanel?.layer.setAffineTransform(CGAffineTransform(scaleX: 0,y: 0))
            },
                completion:{
                            (finished:Bool) -> Void in
                            UIView.animate(withDuration: 10, animations:{
                                ()-> Void in
                                self.fourViewPanel?.layer.setAffineTransform(CGAffineTransform.identity)
                            })
                    self.fourViewPanel?.removeFromSuperview()
            })*/
        }
        else{
            buttonSelect = true
            
            let layer1:CALayer = CALayer()
            layer1.frame = CGRect.init(origin: CGPoint.init(x: 20, y: 0), size: CGSize.init(width: screenWidth/2 - 30, height: screenHeight/2 - 30))
            
            layer1.contents = UIImage.init(named: "four1")?.cgImage
            fourViewPanel?.layer.addSublayer(layer1)
            
            let layer2:CALayer = CALayer()
            layer2.frame = CGRect.init(origin: CGPoint.init(x: screenWidth/2 + 10, y: 0), size: CGSize.init(width: screenWidth/2 - 30, height: screenHeight/2 - 30))
            layer2.contents = UIImage.init(named: "four2")?.cgImage
            fourViewPanel?.layer.addSublayer(layer2)
            
            let layer3:CALayer = CALayer()
            layer3.frame = CGRect.init(origin: CGPoint.init(x: 20, y: screenHeight/2 - 50), size: CGSize.init(width: screenWidth/2 - 30, height: screenHeight/2 - 30))
            layer3.contents = UIImage.init(named: "four3")?.cgImage
            fourViewPanel?.layer.addSublayer(layer3)
            
            let layer4:CALayer = CALayer()
            layer4.frame = CGRect.init(origin: CGPoint.init(x: screenWidth/2 + 10, y: screenHeight/2 - 50), size: CGSize.init(width: screenWidth/2 - 30, height: screenHeight/2 - 30))
            layer4.contents = UIImage.init(named: "four4")?.cgImage
            fourViewPanel?.layer.addSublayer(layer4)
            self.view.addSubview(fourViewPanel!)
            fourViewPanel?.layer.setAffineTransform(CGAffineTransform(scaleX: 0.1,y: 0.1))
            
            //设置动画效果，动画时间长度 1 秒。
            UIView.animate(withDuration: 1, delay:0.01,
                                       options:UIViewAnimationOptions.transitionCrossDissolve, animations:
                {
                    ()-> Void in
                    self.fourViewPanel?.layer.setAffineTransform(CGAffineTransform(scaleX: 1,y: 1))
            },
                    completion:{
                        (finished:Bool) -> Void in
                            UIView.animate(withDuration: 0.08, animations:{
                                            ()-> Void in
                                            self.fourViewPanel?.layer.setAffineTransform(CGAffineTransform.identity)
                                        })
            })
            
        }
    }
    
    @IBAction func moreBtnClick(_ sender: Any) {
    }


    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let pageWidth = scrollView.frame.size.width;
        // 根据当前的x坐标和页宽度计算出当前页数
        currentPage = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1.0;
        
        newX = scrollView.contentOffset.x
        
        if (newX > oldX){
            print("从左往右滑动")
            if(currentPage == 0){
                let variable = (0.2 / pageWidth) * scrollView.contentOffset.x
                modelView1?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 1 - variable), 1 - variable, 0)
                
                modelView2?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 + variable), cutVariable(variable: 0.8 + variable), 0)
                modelView3?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.6 + variable), cutVariable(variable: 0.6 + variable), 0)
                modelView4?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.4 + variable), cutVariable(variable: 0.4 + variable), 0)
            }
            else if (currentPage == 1){
                let variable = (0.2 / pageWidth) * (scrollView.contentOffset.x - pageWidth)
                modelView1?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 + variable), cutVariable(variable: 0.8 + variable), 0)
                modelView2?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 1 - variable), cutVariable(variable: 1 - variable), 0)
                modelView3?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 + variable), cutVariable(variable: 0.8 + variable), 0)
                modelView4?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.6 + variable), cutVariable(variable: 0.6 + variable), 0)
            }
            else if (currentPage == 2){
                let variable = (0.2 / pageWidth) * (scrollView.contentOffset.x - pageWidth * 2)
                modelView1?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.6 + variable), cutVariable(variable: 0.6 + variable), 0)
                modelView2?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 + variable), cutVariable(variable: 0.8 + variable), 0)
                modelView3?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 1 - variable), 1 - cutVariable(variable: variable), 0)
                modelView4?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 + variable), cutVariable(variable: 0.8 + variable), 0)
            }
            else if (currentPage == 3){
                let variable = (0.2 / pageWidth) * (scrollView.contentOffset.x - pageWidth * 3)
                print(variable)
                modelView1?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.4 + variable), cutVariable(variable: 0.4 + variable), 0)
                modelView2?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.6 + variable), cutVariable(variable: 0.6 + variable), 0)
                modelView3?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 + variable), cutVariable(variable: 0.8 + variable), 0)
                modelView4?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 1 - variable), 1 - cutVariable(variable: variable), 0)
            }
        }
        else if (newX < oldX){
            print("从右往左滑动")
            if(currentPage == 0){
                let variable = (0.2 / pageWidth) * scrollView.contentOffset.x
                modelView1?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 1 + variable), cutVariable(variable: 1 + variable), 0)
                modelView2?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 - variable), cutVariable(variable: 0.8 - variable), 0)
                modelView3?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.6 - variable), cutVariable(variable: 0.6 - variable), 0)
                modelView4?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.4 - variable), cutVariable(variable: 0.4 - variable), 0)
            }
            else if (currentPage == 1){
                let variable = (0.2 / pageWidth) * (scrollView.contentOffset.x - pageWidth)
                modelView1?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 - variable), cutVariable(variable: 0.8 - variable), 0)
                modelView2?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 1 + variable), cutVariable(variable: 1 + variable), 0)
                modelView3?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 - variable), cutVariable(variable: 0.8 - variable), 0)
                modelView4?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.6 - variable), cutVariable(variable: 0.6 - variable), 0)
            }
            else if (currentPage == 2){
                let variable = (0.2 / pageWidth) * (scrollView.contentOffset.x - pageWidth * 2)
                modelView1?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.6 - variable), cutVariable(variable: 0.6 - variable), 0)
                modelView2?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 - variable), cutVariable(variable: 0.8 - variable), 0)
                modelView3?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 1 + variable), cutVariable(variable: 1 + variable), 0)
                modelView4?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 - variable), cutVariable(variable: 0.8 - variable), 0)
            }
            else if (currentPage == 3){
                let variable = (0.2 / pageWidth) * (scrollView.contentOffset.x - pageWidth * 3)
                print(variable)
                modelView1?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.4 - variable), cutVariable(variable: 0.4 - variable), 0)
                modelView2?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.6 - variable), cutVariable(variable: 0.6 - variable), 0)
                modelView3?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 - variable), cutVariable(variable: 0.8 - variable), 0)
                modelView4?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 1 + variable), cutVariable(variable: 1 + variable), 0)
            }
        }
    }
    
    func cutVariable(variable:CGFloat) -> CGFloat{
        if variable > 1{
            return 1
        }
        
        return variable
    }
    
    //开始拖动
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        oldX = scrollView.contentOffset.x
        
    }
    //开始拖动（以某种速率和偏移量）
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
    
    //停止拖动
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        /*
        let pageWidth = scrollView.frame.size.width;
        // 根据当前的x坐标和页宽度计算出当前页数
        let currentPage = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        if (currentPage == 0){
            print("第一个模型")
            modelView1?.layer.transform = CATransform3DMakeScale(1, 1, 0)
            modelView2?.layer.transform = CATransform3DMakeScale(0.8, 0.8, 0)
            modelView3?.layer.transform = CATransform3DMakeScale(0.6, 0.6, 0)
            modelView4?.layer.transform = CATransform3DMakeScale(0.4, 0.4, 0)
        }
        else if (currentPage == 1){
            print("第二个模型")
            modelView1?.layer.transform = CATransform3DMakeScale(0.8, 0.8, 0)
            modelView2?.layer.transform = CATransform3DMakeScale(1, 1, 0)
            modelView3?.layer.transform = CATransform3DMakeScale(0.8, 0.8, 0)
            modelView4?.layer.transform = CATransform3DMakeScale(0.6, 0.6, 0)
        }
        else if (currentPage == 2){
            print("第三个模型")
            modelView1?.layer.transform = CATransform3DMakeScale(0.6, 0.6, 0)
            modelView2?.layer.transform = CATransform3DMakeScale(0.8, 0.8, 0)
            modelView3?.layer.transform = CATransform3DMakeScale(1, 1, 0)
            modelView4?.layer.transform = CATransform3DMakeScale(0.8, 0.8, 0)
        }
        else if (currentPage == 3){
            print("第四个模型")
            modelView1?.layer.transform = CATransform3DMakeScale(0.4, 0.4, 0)
            modelView2?.layer.transform = CATransform3DMakeScale(0.6, 0.6, 0)
            modelView3?.layer.transform = CATransform3DMakeScale(0.8, 0.8, 0)
            modelView4?.layer.transform = CATransform3DMakeScale(1, 1, 0)
        }
        */
    }
    //开始滑动
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
    }
  
}
