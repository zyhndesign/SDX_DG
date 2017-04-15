//
//  MatchViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/14.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit
import SwiftyJSON
import AlamofireObjectMapper
import AlamofireImage
import Alamofire

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
    
    var shareBtn:UIButton?
    var saveBtn:UIButton?
    var savePanel:UIView?
    
    var model1GarmentModel:[GarmentModel] = []
    var model2GarmentModel:[GarmentModel] = []
    var model3GarmentModel:[GarmentModel] = []
    var model4GarmentModel:[GarmentModel] = []
    
    var label:UILabel?
    
    var layer1:CALayer?
    var layer2:CALayer?
    var layer3:CALayer?
    var layer4:CALayer?
    
    var saveModel1:UIImageView?
    var saveModel2:UIImageView?
    var saveModel3:UIImageView?
    var saveModel4:UIImageView?
    
    var model1UploadResult = (modelUpload:false,modelUrl:"")
    var model2UploadResult = (modelUpload:false,modelUrl:"")
    var model3UploadResult = (modelUpload:false,modelUrl:"")
    var model4UploadResult = (modelUpload:false,modelUrl:"")
    
    var textField:UITextField?
    
    let userId = LocalDataStorageUtil.getUserIdFromUserDefaults()
    
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
        
        let selectGarmentModelList:[GarmentModel] = (notifaction.object as? [GarmentModel])!
        let innerClothGarmentModel:GarmentModel = selectGarmentModelList[0]
        let outterClothGarmentModel:GarmentModel = selectGarmentModelList[1]
        let trouserClothGarmentModel:GarmentModel = selectGarmentModelList[2]
        
        if (currentPage == 0){
            model1InCloth?.af_setImage(withURL: URL.init(string:innerClothGarmentModel.imageUrl1!)!)
            model1OutCloth?.af_setImage(withURL: URL.init(string:outterClothGarmentModel.imageUrl1!)!)
            model1Trouser?.af_setImage(withURL: URL.init(string:trouserClothGarmentModel.imageUrl1!)!)
            model1GarmentModel = selectGarmentModelList
            self.scrollView.setContentOffset(CGPoint.init(x: 0, y: 0), animated: true)
        }
        else if (currentPage == 1){
            model2InCloth?.af_setImage(withURL: URL.init(string:innerClothGarmentModel.imageUrl1!)!)
            model2OutCloth?.af_setImage(withURL: URL.init(string:outterClothGarmentModel.imageUrl1!)!)
            model2Trouser?.af_setImage(withURL: URL.init(string:trouserClothGarmentModel.imageUrl1!)!)
            model2GarmentModel = selectGarmentModelList
            self.scrollView.setContentOffset(CGPoint.init(x: screenWidth/2, y: 0), animated: true)
        }
        else if (currentPage == 2){
            model3InCloth?.af_setImage(withURL: URL.init(string:innerClothGarmentModel.imageUrl1!)!)
            model3OutCloth?.af_setImage(withURL: URL.init(string:outterClothGarmentModel.imageUrl1!)!)
            model3Trouser?.af_setImage(withURL: URL.init(string:trouserClothGarmentModel.imageUrl1!)!)
            model3GarmentModel = selectGarmentModelList
            self.scrollView.setContentOffset(CGPoint.init(x: screenWidth, y: 0), animated: true)
        }
        else if (currentPage == 3){
            model4InCloth?.af_setImage(withURL: URL.init(string:innerClothGarmentModel.imageUrl1!)!)
            model4OutCloth?.af_setImage(withURL: URL.init(string:outterClothGarmentModel.imageUrl1!)!)
            model4Trouser?.af_setImage(withURL: URL.init(string:trouserClothGarmentModel.imageUrl1!)!)
            model4GarmentModel = selectGarmentModelList
            self.scrollView.setContentOffset(CGPoint.init(x: screenWidth + screenWidth/2, y: 0), animated: true)
        }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageTapped(sender: UIGestureRecognizer){
        let view:MatchListViewController = self.storyboard?.instantiateViewController(withIdentifier: "MatchCollectionView") as! MatchListViewController
        //self.present(view!, animated: true, completion: {() -> Void in (print("complete"))})
        
        self.navigationController?.pushViewController(view, animated: true)
        
    }
    
    @IBAction func fourViewPanelBtnClick(_ sender: Any) {
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
            if (model1GarmentModel.count == 3){
                self.addClothLayer(mLayer:layer1!, innerImage: (model1InCloth?.image)!, outterImage: (model1OutCloth?.image)!, trouserImage: (model1Trouser?.image)!)
            }
            
            layer2 = self.addModel(view: fourViewPanel!, x: screenWidth/2 + 50, y: 10, width: screenWidth/2 - 110, height: screenHeight/2 - 80)
            let tagB = TagLayer.init(text: "B")
            tagB.frame = CGRect.init(x: 0, y: 5, width: 24, height: 34)
            layer2?.addSublayer(tagB)
            if (model2GarmentModel.count == 3){
                self.addClothLayer(mLayer:layer2!, innerImage: (model2InCloth?.image)!, outterImage: (model2OutCloth?.image)!, trouserImage: (model2Trouser?.image)!)
            }
            
            layer3 = self.addModel(view: fourViewPanel!, x: 50, y: screenHeight/2 - 50, width: screenWidth/2 - 110, height: screenHeight/2 - 80)
            let tagC = TagLayer.init(text: "C")
            tagC.frame = CGRect.init(x: 0, y: 0, width: 24, height: 34)
            layer3?.addSublayer(tagC)
            if (model3GarmentModel.count == 3){
                self.addClothLayer(mLayer:layer3!, innerImage: (model3InCloth?.image)!, outterImage: (model3OutCloth?.image)!, trouserImage: (model3Trouser?.image)!)
            }
            
            layer4 = self.addModel(view: fourViewPanel!, x: screenWidth/2 + 50, y: screenHeight/2 - 50, width: screenWidth/2 - 110, height: screenHeight/2 - 80)
            let tagD = TagLayer.init(text: "D")
            tagD.frame = CGRect.init(x: 0, y: 0, width: 24, height: 34)
            layer4?.addSublayer(tagD)
            if (model4GarmentModel.count == 3){
                self.addClothLayer(mLayer:layer4!, innerImage: (model4InCloth?.image)!, outterImage: (model4OutCloth?.image)!, trouserImage: (model4Trouser?.image)!)
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
        self.tapDelete(sender: UITapGestureRecognizer.init())
    }
    
    func addModel(view:UIView, x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat) -> CALayer{
        let layer:CALayer = CALayer()
        layer.frame = CGRect.init(origin: CGPoint.init(x: x, y: y), size: CGSize.init(width: width, height: height))
        layer.contents = UIImage.init(named: "model")?.cgImage
        view.layer.addSublayer(layer)
        return layer
    }
    
    func addModelCloth(mLayer:CALayer,image:UIImage,x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat){
        let layer:CALayer = CALayer()
        layer.contents = image.cgImage
        layer.frame = CGRect.init(x: x, y: y, width: width, height: height)
        mLayer.addSublayer(layer)
    }
    
    func addClothLayer(mLayer:CALayer, innerImage:UIImage, outterImage:UIImage, trouserImage:UIImage){
        self.addModelCloth(mLayer: mLayer, image: innerImage, x: 0, y: 0, width: screenWidth/2 - 110, height: screenHeight/2 - 80)
        self.addModelCloth(mLayer: mLayer, image: trouserImage, x: 0, y: 0, width: screenWidth/2 - 110, height: screenHeight/2 - 80)
        self.addModelCloth(mLayer: mLayer, image: outterImage, x: 0, y: 0, width: screenWidth/2 - 110, height: screenHeight/2 - 80)
    }
    
    @IBAction func shareBtnClick(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "shareView")
        self.navigationController?.pushViewController(view!, animated: true)
        let animation:CABasicAnimation = CABasicAnimation.init(keyPath: "position")
        animation.duration = 0.5
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
    
    @IBAction func saveBtnClick(_ sender: Any) {
        let animation:CABasicAnimation = CABasicAnimation.init(keyPath: "position")
        animation.duration = 0.5
        let naviHeight = self.navigationController?.navigationBar.frame.height
        
        savePanel = UIView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight))
        
        let modelWidth = (screenWidth - 50)/4
        saveModel1 = UIImageView.init(frame: CGRect.init(x: 10, y: 30 + naviHeight!, width: modelWidth, height: modelWidth * 2))
        if(model1GarmentModel.count == 3){
            saveModel1!.image = self.combineImage(clothLayerImage: (model1InCloth?.image)!, trousersLayerImage: (model1Trouser?.image)!, outClothLayerImage: (model1OutCloth?.image)!)
            saveModel1?.contentMode = UIViewContentMode.scaleAspectFit
        }
        saveModel2 = UIImageView.init(frame: CGRect.init(x: 20 + modelWidth, y: 30 + naviHeight!, width: modelWidth, height: modelWidth * 2))
        if(model2GarmentModel.count == 3){
            saveModel2!.image = self.combineImage(clothLayerImage: (model2InCloth?.image)!, trousersLayerImage: (model2Trouser?.image)!, outClothLayerImage: (model2OutCloth?.image)!)
            saveModel2?.contentMode = UIViewContentMode.scaleAspectFit
        }
        
        saveModel3 = UIImageView.init(frame: CGRect.init(x: 30 + modelWidth*2, y: 30 + naviHeight!, width: modelWidth, height: modelWidth * 2))
        if(model3GarmentModel.count == 3){
            saveModel3!.image = self.combineImage(clothLayerImage: (model3InCloth?.image)!, trousersLayerImage: (model3Trouser?.image)!, outClothLayerImage: (model3OutCloth?.image)!)
            saveModel3?.contentMode = UIViewContentMode.scaleAspectFit
        }
        
        saveModel4 = UIImageView.init(frame: CGRect.init(x: 40 + modelWidth*3, y: 30 + naviHeight!, width: modelWidth, height: modelWidth * 2))
        if(model4GarmentModel.count == 3){
            saveModel4!.image = self.combineImage(clothLayerImage: (model4InCloth?.image)!, trousersLayerImage: (model4Trouser?.image)!, outClothLayerImage: (model4OutCloth?.image)!)
            saveModel4?.contentMode = UIViewContentMode.scaleAspectFit
        }
        
        savePanel!.addSubview(saveModel1!)
        savePanel!.addSubview(saveModel2!)
        savePanel!.addSubview(saveModel3!)
        savePanel!.addSubview(saveModel4!)
        
        textField = UITextField.init(frame: CGRect.init(x: 10, y: modelWidth * 2 + naviHeight! + 40, width: screenWidth - 100, height: 35))
        textField!.placeholder = "请输入标题"
        textField!.layer.borderColor = UIColor.darkGray.cgColor
        textField!.layer.borderWidth = 1.0
        textField!.layer.cornerRadius = 8.0
        let saveBtn:UIButton = UIButton.init(frame: CGRect.init(x: screenWidth - 80, y: modelWidth * 2 + naviHeight! + 40, width: 70, height: 35))
        saveBtn.setTitle("保存", for:UIControlState.normal)
        saveBtn.layer.cornerRadius = 8.0
        saveBtn.backgroundColor = UIColor.init(red: 253.0/255.0, green: 220.0/255.0, blue: 56.0/255.0, alpha: 1.0)
        saveBtn.addTarget(self, action: #selector(saveBtnClickToServer(sender:)), for: UIControlEvents.touchUpInside)
        savePanel!.addSubview(textField!)
        savePanel!.addSubview(saveBtn)
        
        savePanel!.backgroundColor = UIColor.lightGray
        savePanel!.alpha = 1.0
        self.view.addSubview(savePanel!)
        savePanel!.isHidden = false
        
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "保存处理中..."
        
        Alamofire.request(ConstantsUtil.APP_QINIU_TOKEN).responseJSON { (response) in
            
            if let data = response.result.value {
                let responseResult = JSON(data)
                
                let resultCode = responseResult["resultCode"].intValue
                
                if resultCode == 200{
                    let token = responseResult["uptoken"].string!
                    print(token)
                    self.model1UploadResult = (modelUpload:false,modelUrl:"")
                    self.model2UploadResult = (modelUpload:false,modelUrl:"")
                    self.model3UploadResult = (modelUpload:false,modelUrl:"")
                    self.model4UploadResult = (modelUpload:false,modelUrl:"")
                    
                    self.saveModel(image: self.saveModel1!.image, token: token, modelNum:1)
                    self.saveModel(image: self.saveModel2!.image, token: token, modelNum:2)
                    self.saveModel(image: self.saveModel3!.image, token: token, modelNum:3)
                    self.saveModel(image: self.saveModel4!.image, token: token, modelNum:4)
                    hud.hide(animated: true, afterDelay: 3)
                }
            }
        }
    }
    
    func saveBtnClickToServer(sender:UIButton){
        
        //savePanel!.isHidden = true
        //保存模型图片
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        var seriesname:String? = textField!.text
        if seriesname!.characters.count < 1{
            hud.label.text = "请输入标题"
            hud.hide(animated: true, afterDelay: 2.0)
            return
        }
        
        hud.label.text = "保存处理中..."
        
        if self.model1UploadResult.modelUpload && self.model2UploadResult.modelUpload && self.model3UploadResult.modelUpload && self.model4UploadResult.modelUpload{
            
            var matchlists:[Any] = []
            var draftstatus:Int = 0
            if !model1UploadResult.modelUrl.isEmpty{
                
                let match1list:[String:Any] = ["innerClothId":model1GarmentModel[0].id, "outClothId":model1GarmentModel[1].id, "trousersId":model1GarmentModel[2].id, "modelurl":model1UploadResult.modelUrl,"modelNum":"1"]
                matchlists.append(match1list)
            }
            else{
                draftstatus = 1
            }
            if !model2UploadResult.modelUrl.isEmpty{
                let match2list:[String:Any] = ["innerClothId":model2GarmentModel[0].id, "outClothId":model2GarmentModel[1].id, "trousersId":model2GarmentModel[2].id, "modelurl":model2UploadResult.modelUrl,"modelNum":"2"]
                matchlists.append(match2list)
            }
            else{
                draftstatus = 1
            }
            
            if !model3UploadResult.modelUrl.isEmpty{
                let match3list:[String:Any] = ["innerClothId":model3GarmentModel[0].id, "outClothId":model3GarmentModel[1].id, "trousersId":model3GarmentModel[2].id, "modelurl":model3UploadResult.modelUrl,"modelNum":"3"]
                matchlists.append(match3list)
            }
            else{
                draftstatus = 1
            }
            
            if !model4UploadResult.modelUrl.isEmpty{
                let match4list:[String:Any] = ["innerClothId":model4GarmentModel[0].id, "outClothId":model4GarmentModel[1].id, "trousersId":model4GarmentModel[2].id, "modelurl":model4UploadResult.modelUrl,"modelNum":"4"]
                matchlists.append(match4list)
            }
            else{
                draftstatus = 1
            }
            
            let user:[String:Any] = ["id":userId]
            
            let parameters: [String:Any] =  ["seriesname": seriesname, "draftstatus":draftstatus, "user": user ,
                               "matchlists": matchlists]
            print(parameters)
            if (JSONSerialization.isValidJSONObject(parameters)){
                print("json string")
            }
            else{
                print("not json string")
            }
            
            if (matchlists.count == 0){
                hud.label.text = "未搭配服装"
                hud.hide(animated: true, afterDelay: 2.0)
                self.savePanel!.isHidden = true
            }
            else{
                Alamofire.request(ConstantsUtil.APP_MATCH_CREATE_URL, method: .post, parameters: parameters,encoding: JSONEncoding.default).responseJSON(completionHandler: { (response) in
                    
                    if let value = response.result.value as? [String: AnyObject]{
                        let json = JSON(value)
                        if json["resultCode"].intValue == 200{
                            hud.label.text = "操作成功"
                        }
                        else{
                            hud.label.text = "操作失败"
                        }
                    }
                    else{
                        hud.label.text = "操作失败"
                    }
                    hud.hide(animated: true, afterDelay: 2.0)
                    self.savePanel!.isHidden = true
                })
            }
        }
        else{
            hud.label.text = "图片未处理成功"
            hud.hide(animated: true, afterDelay: 2.0)
            self.savePanel!.isHidden = true
        }
    }
    
    func saveModel(image:UIImage?,token:String,modelNum:Int){
        print("call save image method......")
        var modelUrl:String = ""
        
        if let modelImage = image{
            
            let headers = ["content-type":"multipart/form-data"]
            
            Alamofire.upload(
                multipartFormData: { multipartFormData in
                    multipartFormData.append((token.data(using: String.Encoding.utf8)!), withName: "token")
                    let filename = (UIDevice.current.identifierForVendor?.uuidString)!
                    multipartFormData.append(UIImagePNGRepresentation(modelImage)!, withName: "file", fileName: filename, mimeType: "image/png")
                    
            },
                to: ConstantsUtil.APP_QINIU_UPLOAD_URL,
                headers: headers,
                encodingCompletion: { encodingResult in
                    switch encodingResult {
                    case .success(let upload, _, _):
                        upload.responseJSON { response in
                            
                            if let value = response.result.value as? [String: AnyObject]{
                                let json = JSON(value)
                                modelUrl = ConstantsUtil.APP_QINIU_IMAGE_URL_PREFIX + json["key"].string!
                                self.setModel(modelUpload: true, modelUrl: modelUrl, modelNum: modelNum)
                            }
                        }
                    case .failure(let encodingError):
                        print(encodingError)
                        self.setModel(modelUpload: true, modelUrl: modelUrl, modelNum: modelNum)
                    }
            }
            )
        }
        else{
            self.setModel(modelUpload: true, modelUrl: modelUrl, modelNum: modelNum)
        }
    }
    
    func setModel(modelUpload:Bool,modelUrl:String,modelNum:Int){
        if (modelNum == 1){
            self.model1UploadResult = (modelUpload:true,modelUrl:modelUrl)
        }
        else if (modelNum == 2){
            self.model2UploadResult = (modelUpload:true,modelUrl:modelUrl)
        }
        else if (modelNum == 3){
            self.model3UploadResult = (modelUpload:true,modelUrl:modelUrl)
        }
        else if (modelNum == 4){
            self.model4UploadResult = (modelUpload:true,modelUrl:modelUrl)
        }
    }
    
    func combineImage(clothLayerImage:UIImage, trousersLayerImage:UIImage, outClothLayerImage:UIImage)->UIImage{
        let modelImage:UIImage = (self.modelView1?.image)!
        let size:CGSize = self.modelView1!.frame.size
        
        UIGraphicsBeginImageContext(size);
        UIColor.white.setFill()
        modelImage.draw(in: CGRect.init(x: 0, y: 0, width: size.width, height: size.height))
        clothLayerImage.draw(in: CGRect.init(x: 0, y: 0, width: size.width, height: size.height))
        trousersLayerImage.draw(in: CGRect.init(x: 0, y: 0, width: size.width, height: size.height))
        outClothLayerImage.draw(in: CGRect.init(x: 0, y: 0, width: size.width, height: size.height))
        
        let resultingImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        return resultingImage
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
    
    
    func upLoadImageRequest(urlString : String, params:[String:String], data:Data,success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()){
        
        let headers = ["content-type":"multipart/form-data"]
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                let flag = params["token"]
                multipartFormData.append((flag?.data(using: String.Encoding.utf8)!)!, withName: "token")
                let filename = (UIDevice.current.identifierForVendor?.uuidString)!
                multipartFormData.append(data, withName: "file", fileName: filename, mimeType: "image/png")
               
        },
            to: urlString,
            headers: headers,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        if let value = response.result.value as? [String: AnyObject]{
                            let json = JSON(value)
                            print(json)
                        }
                    }
                case .failure(let encodingError):
                    failture(encodingError)
                }
        }
        )
    }
}
