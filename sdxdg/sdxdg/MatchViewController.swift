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
    
    var model1OutCloth:UIImageView?
    var model1InCloth:UIImageView?
    var model1Trouser:UIImageView?
    
    var model2OutCloth:UIImageView?
    var model2InCloth:UIImageView?
    var model2Trouser:UIImageView?
    
    var model3OutCloth:UIImageView?
    var model3InCloth:UIImageView?
    var model3Trouser:UIImageView?
    
    var model4OutCloth:UIImageView?
    var model4InCloth:UIImageView?
    var model4Trouser:UIImageView?
    
    var scrollView: UIScrollView!
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    var buttonSelect = false
    
    var fourViewPanel:UIView?
    
    var oldX:CGFloat = 0.0
    var newX:CGFloat = 0.0
    var currentPage:CGFloat = 0
    
    var dropMenuPanel:UIView?
    var shareBtn:UIButton?
    var saveBtn:UIButton?
    var savePanel:UIView?
    
    var model1String:[String] = []
    var model2String:[String] = []
    var model3String:[String] = []
    var model4String:[String] = []
    
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
        
        model1InCloth = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth/2, height: scrollHeight))
        model1OutCloth = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth/2, height: scrollHeight))
        model1Trouser = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth/2 , height: scrollHeight))
        model1InCloth?.contentMode = UIViewContentMode.scaleAspectFit
        model1OutCloth?.contentMode = UIViewContentMode.scaleAspectFit
        model1Trouser?.contentMode = UIViewContentMode.scaleAspectFit
        modelView1?.addSubview(model1InCloth!)
        modelView1?.addSubview(model1Trouser!)
        modelView1?.addSubview(model1OutCloth!)
        scrollView.addSubview(modelView1!)
        
        scrollView.clipsToBounds = false
        
        //scrollView.contentInset =  UIEdgeInsetsMake(0, 0, 0, 0)
        
        modelView2 = UIImageView.init(frame: CGRect.init(x: screenWidth / 2, y: 15, width: screenWidth/2, height: scrollHeight))
        modelView2?.image = UIImage.init(named: "model")
        modelView2?.contentMode = UIViewContentMode.scaleAspectFit
        modelView2?.layer.transform = CATransform3DMakeScale(0.8, 0.8, 0)
        model2InCloth = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth/2, height: scrollHeight))
        model2OutCloth = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth/2, height: scrollHeight))
        model2Trouser = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth/2 , height: scrollHeight))
        model2InCloth?.contentMode = UIViewContentMode.scaleAspectFit
        model2OutCloth?.contentMode = UIViewContentMode.scaleAspectFit
        model2Trouser?.contentMode = UIViewContentMode.scaleAspectFit
        modelView2?.addSubview(model2InCloth!)
        modelView2?.addSubview(model2Trouser!)
        modelView2?.addSubview(model2OutCloth!)
        scrollView.addSubview(modelView2!)
        
        modelView3 = UIImageView.init(frame: CGRect.init(x: screenWidth, y: 15, width: screenWidth/2, height: scrollHeight))
        modelView3?.image = UIImage.init(named: "model")
        modelView3?.contentMode = UIViewContentMode.scaleAspectFit
        modelView3?.layer.transform = CATransform3DMakeScale(0.6, 0.6, 0)
        model3InCloth = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth/2, height: scrollHeight))
        model3OutCloth = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth/2, height: scrollHeight))
        model3Trouser = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth/2 , height: scrollHeight))
        model3InCloth?.contentMode = UIViewContentMode.scaleAspectFit
        model3OutCloth?.contentMode = UIViewContentMode.scaleAspectFit
        model3Trouser?.contentMode = UIViewContentMode.scaleAspectFit
        modelView3?.addSubview(model3InCloth!)
        modelView3?.addSubview(model3Trouser!)
        modelView3?.addSubview(model3OutCloth!)
        scrollView.addSubview(modelView3!)
        
        modelView4 = UIImageView.init(frame: CGRect.init(x: screenWidth  + screenWidth / 2, y: 15, width: screenWidth/2, height: scrollHeight))
        modelView4?.image = UIImage.init(named: "model")
        modelView4?.contentMode = UIViewContentMode.scaleAspectFit
        modelView4?.layer.transform = CATransform3DMakeScale(0.4, 0.4, 0)
        model4InCloth = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth/2, height: scrollHeight))
        model4OutCloth = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth/2, height: scrollHeight))
        model4Trouser = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth/2 , height: scrollHeight))
        model4InCloth?.contentMode = UIViewContentMode.scaleAspectFit
        model4OutCloth?.contentMode = UIViewContentMode.scaleAspectFit
        model4Trouser?.contentMode = UIViewContentMode.scaleAspectFit
        modelView4?.addSubview(model4InCloth!)
        modelView4?.addSubview(model4Trouser!)
        modelView4?.addSubview(model4OutCloth!)
        scrollView.addSubview(modelView4!)
        
        scrollView.contentSize = CGSize.init(width: screenWidth * 2, height: scrollHeight)
        let gesture:UIGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(imageTapped(sender:)))
        scrollView.addGestureRecognizer(gesture)
       
        let naviHeight = self.navigationController?.navigationBar.frame.height
        let statusHeight = UIApplication.shared.statusBarFrame.size.height
        fourViewPanel = UIView.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: naviHeight! + statusHeight), size: CGSize.init(width: screenWidth, height: screenHeight)))
        fourViewPanel?.backgroundColor = UIColor.white
        
        scrollView.delegate = self
        
        dropMenuPanel = UIView.init(frame: CGRect.init(x: screenWidth - 130, y: naviHeight! + 30, width: 120, height: 70))
        dropMenuPanel?.layer.contents = UIImage.init(named: "popBg")?.cgImage
        
        shareBtn = UIButton.init(frame: CGRect.init(x: 10, y: 5, width: 110, height: 25))
        shareBtn?.setTitle("分享", for: UIControlState.normal)
        shareBtn?.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        shareBtn?.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        shareBtn?.contentVerticalAlignment = UIControlContentVerticalAlignment.bottom
        shareBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        let shareBtnLayer:CALayer = CALayer()
        shareBtnLayer.contents = UIImage.init(named: "shareBlackBtn")?.cgImage
        shareBtnLayer.frame = CGRect.init(x: 10, y: 5, width: 20, height: 20)
        shareBtn?.addTarget(self, action: #selector(shareBtnClick(sender:)), for: UIControlEvents.touchUpInside)
        shareBtn?.layer.addSublayer(shareBtnLayer)
        
        saveBtn = UIButton.init(frame: CGRect.init(x: 10, y: 35, width: 110, height: 25))
        saveBtn?.setTitle("保存", for: UIControlState.normal)
        saveBtn?.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        saveBtn?.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        saveBtn?.contentVerticalAlignment = UIControlContentVerticalAlignment.bottom
        saveBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        let saveBtnLayer:CALayer = CALayer()
        saveBtnLayer.contents = UIImage.init(named: "saveBlackBtn")?.cgImage
        saveBtnLayer.frame = CGRect.init(x: 10, y: 5, width: 20, height: 20)
        saveBtn?.addTarget(self, action: #selector(saveBtnClick(sender:)), for: UIControlEvents.touchUpInside)
        saveBtn?.layer.addSublayer(saveBtnLayer)
        dropMenuPanel?.addSubview(shareBtn!)
        dropMenuPanel?.addSubview(saveBtn!)
        
        let menuLine:UIView = UIView.init(frame: CGRect.init(x: 10, y: 33, width: 100, height: 1))
        menuLine.backgroundColor = UIColor.lightGray
        dropMenuPanel?.addSubview(menuLine)
        dropMenuPanel?.isHidden = true
        self.view.addSubview(dropMenuPanel!)
        
        NotificationCenter.default.addObserver(self, selector:#selector(self.updateMatchModel(notifaction:)), name: NSNotification.Name(rawValue: "BigModelMatch"), object: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("disppear...")
        //NotificationCenter.default.removeObserver(self)
    }
    
    func updateMatchModel(notifaction: NSNotification){
        let modelImgName:String = (notifaction.object as? String)!
        var image:[String] = modelImgName.components(separatedBy: "|")
        
        if (currentPage == 0){
            model1OutCloth?.image = UIImage.init(named: image[1])
            model1InCloth?.image = UIImage.init(named: image[0])
            model1Trouser?.image = UIImage.init(named: image[2])
            model1String = image
        }
        else if (currentPage == 1){
            model2OutCloth?.image = UIImage.init(named: image[1])
            model2InCloth?.image = UIImage.init(named: image[0])
            model2Trouser?.image = UIImage.init(named: image[2])
            model2String = image
        }
        else if (currentPage == 2){
            model3OutCloth?.image = UIImage.init(named: image[1])
            model3InCloth?.image = UIImage.init(named: image[0])
            model3Trouser?.image = UIImage.init(named: image[2])
            model3String = image
        }
        else if (currentPage == 3){
            model4OutCloth?.image = UIImage.init(named: image[1])
            model4InCloth?.image = UIImage.init(named: image[0])
            model4Trouser?.image = UIImage.init(named: image[2])
            model4String = image
        }
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
            self.fourViewPanel?.removeFromSuperview()
        }
        else{
            buttonSelect = true
            let layer1:CALayer = self.addModel(view: fourViewPanel!, x: 50, y: 10, width: screenWidth/2 - 90, height: screenHeight/2 - 80)
            if (model1String.count > 0){
                self.addClothLayer(mLayer:layer1, modelString:model1String)
            }
    
            let layer2:CALayer = self.addModel(view: fourViewPanel!, x: screenWidth/2 + 50, y: 10, width: screenWidth/2 - 90, height: screenHeight/2 - 80)
            if (model2String.count > 0){
                self.addClothLayer(mLayer:layer2, modelString:model2String)
            }
            
            let layer3:CALayer = self.addModel(view: fourViewPanel!, x: 50, y: screenHeight/2 - 50, width: screenWidth/2 - 90, height: screenHeight/2 - 80)
            if (model3String.count > 0){
                self.addClothLayer(mLayer:layer3, modelString:model3String)
            }
            
            let layer4:CALayer = self.addModel(view: fourViewPanel!, x: screenWidth/2 + 50, y: screenHeight/2 - 50, width: screenWidth/2 - 90, height: screenHeight/2 - 80)
            if (model4String.count > 0){
                self.addClothLayer(mLayer:layer4, modelString:model4String)
            }
            
            self.view.addSubview(fourViewPanel!)
            fourViewPanel?.layer.setAffineTransform(CGAffineTransform(scaleX: 0.1,y: 0.1))
            
            
            //设置动画效果，动画时间长度 1 秒。
            UIView.animate(withDuration: 0.5, delay:0.01,
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
    
    func addModel(view:UIView, x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat) -> CALayer{
        let layer:CALayer = CALayer()
        layer.frame = CGRect.init(origin: CGPoint.init(x: x, y: y), size: CGSize.init(width: width, height: height))
        layer.contents = UIImage.init(named: "model")?.cgImage
        view.layer.addSublayer(layer)
        return layer
    }
    
    func addModelCloth(mLayer:CALayer,imgName:String,x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat){
        let layer:CALayer = CALayer()
        layer.contents = UIImage.init(named: imgName)?.cgImage
        layer.frame = CGRect.init(x: x, y: y, width: width, height: height)
        mLayer.addSublayer(layer)
    }
    
    func addClothLayer(mLayer:CALayer, modelString:Array<String>){
        self.addModelCloth(mLayer: mLayer, imgName: modelString[0], x: 0, y: 0, width: screenWidth/2 - 90, height: screenHeight/2 - 80)
        self.addModelCloth(mLayer: mLayer, imgName: modelString[2], x: 0, y: 0, width: screenWidth/2 - 90, height: screenHeight/2 - 80)
        self.addModelCloth(mLayer: mLayer, imgName: modelString[1], x: 0, y: 0, width: screenWidth/2 - 90, height: screenHeight/2 - 80)
    }
    @IBAction func moreBtnClick(_ sender: Any) {
        if (buttonSelect){
            buttonSelect = false
            self.fourViewPanel?.removeFromSuperview()
        }
        let animation:CABasicAnimation = CABasicAnimation.init(keyPath: "position")
        animation.duration = 0.5
        if (dropMenuPanel?.isHidden)!{
            self.showMenuPanel(animation: animation)
        }
        else{
            self.hideMenuPanel(animation:animation)
        }
    }

    func showMenuPanel(animation:CABasicAnimation){
        
        let naviHeight = self.navigationController?.navigationBar.frame.height
        dropMenuPanel?.isHidden = false
        animation.fromValue = NSValue.init(cgPoint: CGPoint.init(x: screenWidth - 70, y: -50))
        animation.toValue = NSValue.init(cgPoint: CGPoint.init(x: screenWidth - 70, y: naviHeight! + 50))
        dropMenuPanel?.layer.add(animation, forKey: nil)
        
    }
    
    func hideMenuPanel(animation:CABasicAnimation){
        let naviHeight = self.navigationController?.navigationBar.frame.height
        animation.fromValue = NSValue.init(cgPoint: CGPoint.init(x: screenWidth - 70, y: naviHeight! + 50))
        animation.toValue = NSValue.init(cgPoint: CGPoint.init(x: screenWidth - 70, y:-50))
        dropMenuPanel?.layer.add(animation, forKey: nil)
        self.perform(#selector(hiddenMenuPanel), with: nil, afterDelay: 0.3)
        
    }
    
    func hiddenMenuPanel(){
        dropMenuPanel?.isHidden = true
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
    }
    //开始滑动
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
    }
  
    func shareBtnClick(sender:UIButton){
        
        let view = self.storyboard?.instantiateViewController(withIdentifier: "shareView")
        self.navigationController?.pushViewController(view!, animated: true)
        let animation:CABasicAnimation = CABasicAnimation.init(keyPath: "position")
        animation.duration = 0.5
        self.hideMenuPanel(animation: animation)
    }
    
    func saveBtnClick(sender:UIButton){
        let animation:CABasicAnimation = CABasicAnimation.init(keyPath: "position")
        animation.duration = 0.5
        self.hideMenuPanel(animation: animation)
        let naviHeight = self.navigationController?.navigationBar.frame.height
        
        savePanel = UIView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight))
        
        let modelWidth = (screenWidth - 50)/4
        let model1:UIImageView = UIImageView.init(frame: CGRect.init(x: 10, y: 30 + naviHeight!, width: modelWidth, height: modelWidth * 2))
        model1.image = UIImage.init(named: "four1")
        let model2:UIImageView = UIImageView.init(frame: CGRect.init(x: 20 + modelWidth, y: 30 + naviHeight!, width: modelWidth, height: modelWidth * 2))
        model2.image = UIImage.init(named: "four2")
        let model3:UIImageView = UIImageView.init(frame: CGRect.init(x: 30 + modelWidth*2, y: 30 + naviHeight!, width: modelWidth, height: modelWidth * 2))
        model3.image = UIImage.init(named: "four3")
        let model4:UIImageView = UIImageView.init(frame: CGRect.init(x: 40 + modelWidth*3, y: 30 + naviHeight!, width: modelWidth, height: modelWidth * 2))
        model4.image = UIImage.init(named: "four4")
        
        savePanel!.addSubview(model1)
        savePanel!.addSubview(model2)
        savePanel!.addSubview(model3)
        savePanel!.addSubview(model4)
        
        let textField:UITextField = UITextField.init(frame: CGRect.init(x: 10, y: modelWidth * 2 + naviHeight! + 40, width: screenWidth - 100, height: 35))
        textField.placeholder = "请输入标题"
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 8.0
        let saveBtn:UIButton = UIButton.init(frame: CGRect.init(x: screenWidth - 80, y: modelWidth * 2 + naviHeight! + 40, width: 70, height: 35))
        saveBtn.setTitle("保存", for:UIControlState.normal)
        saveBtn.layer.cornerRadius = 8.0
        saveBtn.backgroundColor = UIColor.init(red: 253.0/255.0, green: 220.0/255.0, blue: 56.0/255.0, alpha: 1.0)
        saveBtn.addTarget(self, action: #selector(saveBtnClickToServer(sender:)), for: UIControlEvents.touchUpInside)
        savePanel!.addSubview(textField)
        savePanel!.addSubview(saveBtn)
        
        savePanel!.backgroundColor = UIColor.lightGray
        savePanel!.alpha = 1.0
        self.view.addSubview(savePanel!)
        savePanel!.isHidden = false
        //UIApplication.shared.sendAction(#selector(resignFirstResponder), to: nil, from: nil, for: nil)
        //self.view.endEditing(true)
    }
    
    func saveBtnClickToServer(sender:UIButton){
        savePanel!.isHidden = true
    }
}
