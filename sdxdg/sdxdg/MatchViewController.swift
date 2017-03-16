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
    
    var label:UILabel?
    
    var layer1:CALayer?
    var layer2:CALayer?
    var layer3:CALayer?
    var layer4:CALayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let naviBarHeight = self.navigationController?.navigationBar.bounds.height
        let tabBarHeight = self.tabBarController?.tabBar.bounds.height
        let scrollHeight = screenHeight - naviBarHeight! - tabBarHeight! - 80
        
        label = UILabel.init(frame: CGRect.init(x: 60, y: naviBarHeight! + 14, width: 24, height: 34))
        label?.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "labelTag")!)
        label?.text = "A"
        label?.textAlignment = NSTextAlignment.center
        label?.font = UIFont.systemFont(ofSize: 16)
        label?.textColor = UIColor.darkGray
        self.view.addSubview(label!)
        
        scrollView = UIScrollView()
        scrollView.frame = CGRect.init(x: screenWidth / 4 , y: naviBarHeight! + 20, width: screenWidth / 2, height: scrollHeight)
        
        self.view.addSubview(scrollView)
        scrollView.canCancelContentTouches = true
        scrollView.delaysContentTouches = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
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
        
        dropMenuPanel = UIView.init(frame: CGRect.init(x: screenWidth - 130, y: naviHeight! + 20, width: 120, height: 90))
        dropMenuPanel?.layer.contents = UIImage.init(named: "popBg")?.cgImage
        
        shareBtn = UIButton.init(frame: CGRect.init(x: 10, y: 10, width: 110, height: 25))
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
        
        saveBtn = UIButton.init(frame: CGRect.init(x: 10, y: 50, width: 110, height: 25))
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
        
        let menuLine:UIView = UIView.init(frame: CGRect.init(x: 10, y: 43, width: 100, height: 1))
        menuLine.backgroundColor = UIColor.lightGray
        dropMenuPanel?.addSubview(menuLine)
        dropMenuPanel?.isHidden = true
        self.view.addSubview(dropMenuPanel!)
        
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tapDelete(sender:)))
        let deleteBtn:UIImageView = UIImageView.init(frame: CGRect.init(x: screenWidth - 100, y: screenHeight - 100, width: 30, height: 30))
        deleteBtn.image = UIImage.init(named: "deleteBtn")
        deleteBtn.isUserInteractionEnabled = true
        deleteBtn.addGestureRecognizer(tapGesture)
        self.view.addSubview(deleteBtn)
        
        NotificationCenter.default.addObserver(self, selector:#selector(self.updateMatchModel(notifaction:)), name: NSNotification.Name(rawValue: "BigModelMatch"), object: nil)
        
        let leftSwipeGestureRecognizer:UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: self, action: #selector(handleSwipes(sender:)))
        let rightSwipeGestureRecognizer:UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: self, action: #selector(handleSwipes(sender:)))
        
        leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.left
        rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(leftSwipeGestureRecognizer)
        self.view.addGestureRecognizer(rightSwipeGestureRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("disppear...")
        //NotificationCenter.default.removeObserver(self)
    }
    
    func tapDelete(sender:UITapGestureRecognizer){
        if (currentPage == 0){
            model1OutCloth?.image = UIImage.init()
            model1InCloth?.image = UIImage.init()
            model1Trouser?.image = UIImage.init()
        }
        else if (currentPage == 1){
            model2OutCloth?.image = UIImage.init()
            model2InCloth?.image = UIImage.init()
            model2Trouser?.image = UIImage.init()
        }
        else if (currentPage == 2){
            model3OutCloth?.image = UIImage.init()
            model3InCloth?.image = UIImage.init()
            model3Trouser?.image = UIImage.init()
        }
        else if (currentPage == 3){
            model4OutCloth?.image = UIImage.init()
            model4InCloth?.image = UIImage.init()
            model4Trouser?.image = UIImage.init()
        }
    }
    
    func updateMatchModel(notifaction: NSNotification){
        let modelImgName:String = (notifaction.object as? String)!
        var image:[String] = modelImgName.components(separatedBy: "|")
        if (image.count == 4){
            let modelNum:Int = Int(image[3])!
            
            if (modelNum == 1){
                model1OutCloth?.image = UIImage.init(named: image[1])
                model1InCloth?.image = UIImage.init(named: image[0])
                model1Trouser?.image = UIImage.init(named: image[2])
                model1String = image
                self.scrollView.setContentOffset(CGPoint.init(x: 0, y: 0), animated: true)
            }
            else if (modelNum == 2){
                model2OutCloth?.image = UIImage.init(named: image[1])
                model2InCloth?.image = UIImage.init(named: image[0])
                model2Trouser?.image = UIImage.init(named: image[2])
                model2String = image
                self.scrollView.setContentOffset(CGPoint.init(x: screenWidth/2, y: 0), animated: true)
            }
            else if (modelNum == 3){
                model3OutCloth?.image = UIImage.init(named: image[1])
                model3InCloth?.image = UIImage.init(named: image[0])
                model3Trouser?.image = UIImage.init(named: image[2])
                model3String = image
                self.scrollView.setContentOffset(CGPoint.init(x: screenWidth, y: 0), animated: true)
            }
            else if (modelNum == 4){
                model4OutCloth?.image = UIImage.init(named: image[1])
                model4InCloth?.image = UIImage.init(named: image[0])
                model4Trouser?.image = UIImage.init(named: image[2])
                model4String = image
                self.scrollView.setContentOffset(CGPoint.init(x: screenWidth + screenWidth/2, y: 0), animated: true)
            }
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageTapped(sender: UIGestureRecognizer){
        print("click...")
        let view:MatchListViewController = self.storyboard?.instantiateViewController(withIdentifier: "MatchCollectionView") as! MatchListViewController
        //self.present(view!, animated: true, completion: {() -> Void in (print("complete"))})
        if (currentPage == 0){
            view.modelSequenceNum = 1
        }
        else if (currentPage == 1){
            view.modelSequenceNum = 2
        }
        else if (currentPage == 2){
            view.modelSequenceNum = 3
        }
        else if (currentPage == 3){
            view.modelSequenceNum = 4
        }
        self.navigationController?.pushViewController(view, animated: true)
        
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
            layer1 = self.addModel(view: fourViewPanel!, x: 50, y: 10, width: screenWidth/2 - 110, height: screenHeight/2 - 80)
            let tagA = TagLayer.init(text: "A")
            tagA.frame = CGRect.init(x: 0, y: 5, width: 24, height: 34)
            layer1?.addSublayer(tagA)
            if (model1String.count > 0){
                self.addClothLayer(mLayer:layer1!, modelString:model1String)
            }
            
            layer2 = self.addModel(view: fourViewPanel!, x: screenWidth/2 + 50, y: 10, width: screenWidth/2 - 110, height: screenHeight/2 - 80)
            let tagB = TagLayer.init(text: "B")
            tagB.frame = CGRect.init(x: 0, y: 5, width: 24, height: 34)
            layer2?.addSublayer(tagB)
            if (model2String.count > 0){
                self.addClothLayer(mLayer:layer2!, modelString:model2String)
            }
            
            layer3 = self.addModel(view: fourViewPanel!, x: 50, y: screenHeight/2 - 50, width: screenWidth/2 - 110, height: screenHeight/2 - 80)
            let tagC = TagLayer.init(text: "C")
            tagC.frame = CGRect.init(x: 0, y: 0, width: 24, height: 34)
            layer3?.addSublayer(tagC)
            if (model3String.count > 0){
                self.addClothLayer(mLayer:layer3!, modelString:model3String)
            }
            
            layer4 = self.addModel(view: fourViewPanel!, x: screenWidth/2 + 50, y: screenHeight/2 - 50, width: screenWidth/2 - 110, height: screenHeight/2 - 80)
            let tagD = TagLayer.init(text: "D")
            tagD.frame = CGRect.init(x: 0, y: 0, width: 24, height: 34)
            layer4?.addSublayer(tagD)
            if (model4String.count > 0){
                self.addClothLayer(mLayer:layer4!, modelString:model4String)
            }
            
            let delBtn1:UIButton = UIButton.init(frame: CGRect.init(x: screenWidth/2 - 30, y: screenHeight/2 - 100, width: 26, height: 26))
            let delBtn2:UIButton = UIButton.init(frame: CGRect.init(x: screenWidth - 30, y: screenHeight/2 - 100, width: 26, height: 26))
            let delBtn3:UIButton = UIButton.init(frame: CGRect.init(x: screenWidth/2 - 30, y: screenHeight - 160, width: 26, height: 26))
            let delBtn4:UIButton = UIButton.init(frame: CGRect.init(x: screenWidth - 30, y: screenHeight - 160, width: 26, height: 26))
            delBtn1.setBackgroundImage(UIImage.init(named: "deleteBtn"), for: UIControlState.normal)
            delBtn2.setBackgroundImage(UIImage.init(named: "deleteBtn"), for: UIControlState.normal)
            delBtn3.setBackgroundImage(UIImage.init(named: "deleteBtn"), for: UIControlState.normal)
            delBtn4.setBackgroundImage(UIImage.init(named: "deleteBtn"), for: UIControlState.normal)
            delBtn1.tag = 1
            delBtn2.tag = 2
            delBtn3.tag = 3
            delBtn4.tag = 4
            delBtn1.addTarget(self, action: #selector(fourPanelDelBtnClick(sender:)), for: UIControlEvents.touchUpInside)
            delBtn2.addTarget(self, action: #selector(fourPanelDelBtnClick(sender:)), for: UIControlEvents.touchUpInside)
            delBtn3.addTarget(self, action: #selector(fourPanelDelBtnClick(sender:)), for: UIControlEvents.touchUpInside)
            delBtn4.addTarget(self, action: #selector(fourPanelDelBtnClick(sender:)), for: UIControlEvents.touchUpInside)
            fourViewPanel?.addSubview(delBtn1)
            fourViewPanel?.addSubview(delBtn2)
            fourViewPanel?.addSubview(delBtn3)
            fourViewPanel?.addSubview(delBtn4)
            
            self.view.addSubview(fourViewPanel!)
            
        }
    }
    
    func fourPanelDelBtnClick(sender:UIButton){
        if (sender.tag == 1){
            layer1?.sublayers?.forEach({ (layer) in
                layer.contents = nil
            })
        }
        else if (sender.tag == 2){
            layer2?.sublayers?.forEach({ (layer) in
                layer.contents = nil
            })
        }
        else if (sender.tag == 3){
            layer3?.sublayers?.forEach({ (layer) in
                layer.contents = nil
            })
        }
        else if (sender.tag == 4){
            layer4?.sublayers?.forEach({ (layer) in
                layer.contents = nil
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
        self.addModelCloth(mLayer: mLayer, imgName: modelString[0], x: 0, y: 0, width: screenWidth/2 - 110, height: screenHeight/2 - 80)
        self.addModelCloth(mLayer: mLayer, imgName: modelString[2], x: 0, y: 0, width: screenWidth/2 - 110, height: screenHeight/2 - 80)
        self.addModelCloth(mLayer: mLayer, imgName: modelString[1], x: 0, y: 0, width: screenWidth/2 - 110, height: screenHeight/2 - 80)
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
        animation.toValue = NSValue.init(cgPoint: CGPoint.init(x: screenWidth - 70, y: naviHeight! + 40))
        dropMenuPanel?.layer.add(animation, forKey: nil)
        
    }
    
    func hideMenuPanel(animation:CABasicAnimation){
        let naviHeight = self.navigationController?.navigationBar.frame.height
        animation.fromValue = NSValue.init(cgPoint: CGPoint.init(x: screenWidth - 70, y: naviHeight! + 40))
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
        print(currentPage)
        newX = scrollView.contentOffset.x
        
        if (newX > oldX){
            self.leftToRightScroll(pageWidth: pageWidth)
        }
        else if (newX < oldX){
            if(currentPage == 0){
                let variable = (0.2 / pageWidth) * scrollView.contentOffset.x
                modelView1?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 1 + variable), cutVariable(variable: 1 + variable), 0)
                modelView2?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 - variable), cutVariable(variable: 0.8 - variable), 0)
                modelView3?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.6 - variable), cutVariable(variable: 0.6 - variable), 0)
                modelView4?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.4 - variable), cutVariable(variable: 0.4 - variable), 0)
                label?.text = "A"
            }
            else if (currentPage == 1){
                let variable = (0.2 / pageWidth) * (scrollView.contentOffset.x - pageWidth)
                modelView1?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 - variable), cutVariable(variable: 0.8 - variable), 0)
                modelView2?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 1 + variable), cutVariable(variable: 1 + variable), 0)
                modelView3?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 - variable), cutVariable(variable: 0.8 - variable), 0)
                modelView4?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.6 - variable), cutVariable(variable: 0.6 - variable), 0)
                label?.text = "B"
            }
            else if (currentPage == 2){
                let variable = (0.2 / pageWidth) * (scrollView.contentOffset.x - pageWidth * 2)
                modelView1?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.6 - variable), cutVariable(variable: 0.6 - variable), 0)
                modelView2?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 - variable), cutVariable(variable: 0.8 - variable), 0)
                modelView3?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 1 + variable), cutVariable(variable: 1 + variable), 0)
                modelView4?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 - variable), cutVariable(variable: 0.8 - variable), 0)
                label?.text = "C"
            }
            else if (currentPage == 3){
                let variable = (0.2 / pageWidth) * (scrollView.contentOffset.x - pageWidth * 3)
                print(variable)
                modelView1?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.4 - variable), cutVariable(variable: 0.4 - variable), 0)
                modelView2?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.6 - variable), cutVariable(variable: 0.6 - variable), 0)
                modelView3?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 - variable), cutVariable(variable: 0.8 - variable), 0)
                modelView4?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 1 + variable), cutVariable(variable: 1 + variable), 0)
                label?.text = "D"
            }
        }
        else{
            self.leftToRightScroll(pageWidth: pageWidth)
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
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
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
        
    }
    
    func saveBtnClickToServer(sender:UIButton){
        savePanel!.isHidden = true
    }
    
    func leftToRightScroll(pageWidth:CGFloat){
        if(currentPage == 0){
            let variable = (0.2 / pageWidth) * scrollView.contentOffset.x
            modelView1?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 1 - variable), 1 - variable, 0)
            modelView2?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 + variable), cutVariable(variable: 0.8 + variable), 0)
            modelView3?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.6 + variable), cutVariable(variable: 0.6 + variable), 0)
            modelView4?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.4 + variable), cutVariable(variable: 0.4 + variable), 0)
            label?.text = "A"
        }
        else if (currentPage == 1){
            let variable = (0.2 / pageWidth) * (scrollView.contentOffset.x - pageWidth)
            modelView1?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 + variable), cutVariable(variable: 0.8 + variable), 0)
            modelView2?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 1 - variable), cutVariable(variable: 1 - variable), 0)
            modelView3?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 + variable), cutVariable(variable: 0.8 + variable), 0)
            modelView4?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.6 + variable), cutVariable(variable: 0.6 + variable), 0)
            label?.text = "B"
        }
        else if (currentPage == 2){
            let variable = (0.2 / pageWidth) * (scrollView.contentOffset.x - pageWidth * 2)
            modelView1?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.6 + variable), cutVariable(variable: 0.6 + variable), 0)
            modelView2?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 + variable), cutVariable(variable: 0.8 + variable), 0)
            modelView3?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 1 - variable), 1 - cutVariable(variable: variable), 0)
            modelView4?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 + variable), cutVariable(variable: 0.8 + variable), 0)
            label?.text = "C"
        }
        else if (currentPage == 3){
            let variable = (0.2 / pageWidth) * (scrollView.contentOffset.x - pageWidth * 3)
            print(variable)
            modelView1?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.4 + variable), cutVariable(variable: 0.4 + variable), 0)
            modelView2?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.6 + variable), cutVariable(variable: 0.6 + variable), 0)
            modelView3?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 0.8 + variable), cutVariable(variable: 0.8 + variable), 0)
            modelView4?.layer.transform = CATransform3DMakeScale(cutVariable(variable: 1 - variable), 1 - cutVariable(variable: variable), 0)
            label?.text = "D"
        }
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer){
        if (sender.direction == UISwipeGestureRecognizerDirection.left) {
            if (currentPage == 0){
                self.scrollView.setContentOffset(CGPoint.init(x: screenWidth/2, y: 0), animated: true)
            }
            else if (currentPage == 1){
                self.scrollView.setContentOffset(CGPoint.init(x: screenWidth, y: 0), animated: true)
            }
            else if (currentPage == 2){
                self.scrollView.setContentOffset(CGPoint.init(x: screenWidth + screenWidth/2, y: 0), animated: true)
            }
        }
        
        if (sender.direction == UISwipeGestureRecognizerDirection.right) {
            if (currentPage == 1){
                self.scrollView.setContentOffset(CGPoint.init(x: 0, y: 0), animated: true)
            }
            else if (currentPage == 2){
                self.scrollView.setContentOffset(CGPoint.init(x: screenWidth/2, y: 0), animated: true)
            }
            else if (currentPage == 3){
                self.scrollView.setContentOffset(CGPoint.init(x: screenWidth, y: 0), animated: true)
            }

        }
    }
}
