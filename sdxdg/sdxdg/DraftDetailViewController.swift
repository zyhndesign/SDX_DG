//
//  DraftDetailViewController.swift
//  sdxdg
//
//  Created by lotusprize on 17/1/4.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import UIKit

class DraftDetailViewController: UIViewController,UIScrollViewDelegate {
    
    var scrollView: UIScrollView?
    var pageControl: UIPageControl?
    var editBtn:UIButton?
    var deleteBtn:UIButton?
    
    var model1View:UIImageView?
    var model2View:UIImageView?
    var model3View:UIImageView?
    var model4View:UIImageView?
    
    let darkColor:UIColor = UIColor.init(red: 59/255.0, green: 59/255.0, blue: 59/255.0, alpha: 1.0)
    let yellowColor:UIColor = UIColor.init(red: 253/255.0, green: 220/255.0, blue: 56/255.0, alpha: 1.0)
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var match:Match?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let naviheight = self.navigationController?.navigationBar.bounds.height
        //let statusHeight = UIApplication.shared.statusBarFrame.size.height
        let scrollHeight = self.screenHeight-45
        scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: scrollHeight))
        self.view.addSubview(scrollView!)
        model1View = UIImageView.init(frame: CGRect.init(x:  25, y: 0, width: screenWidth - 50, height: scrollHeight - naviheight! - 50))
        model2View = UIImageView.init(frame: CGRect.init(x: screenWidth + 25, y: 0, width: screenWidth - 50, height: scrollHeight - naviheight! - 50))
        model3View = UIImageView.init(frame: CGRect.init(x: screenWidth * 2 + 25, y: 0, width: screenWidth - 50, height: scrollHeight  - naviheight! - 50))
        model4View = UIImageView.init(frame: CGRect.init(x: screenWidth * 3 + 25, y: 0, width: screenWidth - 50, height: scrollHeight - naviheight! - 50))
        
        model1View?.contentMode = .scaleAspectFit
        model2View?.contentMode = .scaleAspectFit
        model3View?.contentMode = .scaleAspectFit
        model4View?.contentMode = .scaleAspectFit
        
        model1View?.image = UIImage.init(named: "model")
        model2View?.image = UIImage.init(named: "model")
        model3View?.image = UIImage.init(named: "model")
        model4View?.image = UIImage.init(named: "model")
        
        model1View?.contentMode = UIViewContentMode.scaleAspectFit
        model2View?.contentMode = UIViewContentMode.scaleAspectFit
        model3View?.contentMode = UIViewContentMode.scaleAspectFit
        model4View?.contentMode = UIViewContentMode.scaleAspectFit
        
        scrollView?.addSubview(model1View!)
        scrollView?.addSubview(model2View!)
        scrollView?.addSubview(model3View!)
        scrollView?.addSubview(model4View!)
        scrollView?.showsHorizontalScrollIndicator = false
        scrollView?.showsVerticalScrollIndicator = false
        scrollView?.isPagingEnabled = true
        scrollView?.scrollsToTop = false
        
        scrollView?.contentSize = CGSize.init(width: screenWidth * 4, height: screenHeight - 120)
        scrollView?.delegate = self
        
        pageControl = UIPageControl.init(frame: CGRect.init(x: screenWidth/2-50, y: screenHeight-80, width: 100, height: 35))
        pageControl?.backgroundColor = UIColor.clear
        pageControl?.numberOfPages = 4
        pageControl?.currentPage = 0
        pageControl?.currentPageIndicatorTintColor = UIColor.darkGray
        pageControl?.pageIndicatorTintColor = UIColor.lightGray
        pageControl?.addTarget(self, action: #selector(pageValueChanged(sender:)), for: UIControlEvents.valueChanged)
        self.view.addSubview(pageControl!)
        
        deleteBtn = UIButton.init(frame: CGRect.init(x: 0, y: screenHeight-45, width: screenWidth/2, height: 45))
        deleteBtn?.backgroundColor = darkColor
        deleteBtn?.setTitle("删除", for: UIControlState.normal)
        deleteBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        deleteBtn?.setTitleColor(UIColor.white, for: UIControlState.normal)
        deleteBtn?.addTarget(self, action: #selector(deleteBtnClick(sender:)), for: UIControlEvents.touchUpInside)
        editBtn = UIButton.init(frame: CGRect.init(x:screenWidth/2, y: screenHeight-45, width: screenWidth/2, height: 45))
        editBtn?.backgroundColor = yellowColor
        editBtn?.setTitle("编辑", for: UIControlState.normal)
        editBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        editBtn?.setTitleColor(UIColor.white, for: UIControlState.normal)
        editBtn?.addTarget(self, action: #selector(editBtnClick(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(deleteBtn!)
        self.view.addSubview(editBtn!)
        
        if let matchObject = match{
            var matchlists:[Matchlist] = matchObject.matchlists!
            
            for matchlist in matchlists{
                if matchlist.modelNum == 1{
                    if let url = matchlists[0].modelurl{
                        self.model1View?.af_setImage(withURL: URL.init(string: url)!)
                    }
                }
                else if matchlist.modelNum == 2{
                    if (matchlists.count == 1){
                        if let url = matchlists[0].modelurl{
                            self.model2View?.af_setImage(withURL: URL.init(string: url)!)
                        }
                    }
                    else if (matchlists.count == 2){
                        if let url = matchlists[1].modelurl{
                            self.model2View?.af_setImage(withURL: URL.init(string: url)!)
                        }
                    }
                }
                else if matchlist.modelNum == 3{
                    if (matchlists.count == 1){
                        if let url = matchlists[0].modelurl{
                            self.model3View?.af_setImage(withURL: URL.init(string: url)!)
                        }
                    }
                    else if (matchlists.count == 2){
                        if let url = matchlists[1].modelurl{
                            self.model3View?.af_setImage(withURL: URL.init(string: url)!)
                        }
                    }else if(matchlists.count == 3){
                        if let url = matchlists[2].modelurl{
                            self.model3View?.af_setImage(withURL: URL.init(string: url)!)
                        }
                    }
                }
                else if matchlist.modelNum == 4{
                    if (matchlists.count == 1){
                        if let url = matchlists[0].modelurl{
                            self.model4View?.af_setImage(withURL: URL.init(string: url)!)
                        }
                    }
                    else if (matchlists.count == 2){
                        if let url = matchlists[1].modelurl{
                            self.model4View?.af_setImage(withURL: URL.init(string: url)!)
                        }
                    }else if(matchlists.count == 3){
                        if let url = matchlists[3].modelurl{
                            self.model4View?.af_setImage(withURL: URL.init(string: url)!)
                        }
                    }
                    else{
                        if let url = matchlists[3].modelurl{
                            self.model4View?.af_setImage(withURL: URL.init(string: url)!)
                        }
                    }
                }
            }
            
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        let bounds = scrollView.frame
        
        pageControl?.currentPage = Int(offset.x / bounds.size.width)
    }
    
    func pageValueChanged(sender: UIPageControl) {
        var frame = scrollView!.frame
        frame.origin.x = frame.size.width * CGFloat(sender.currentPage)
        frame.origin.y = 0
        //展现当前页面内容
        scrollView?.scrollRectToVisible(frame, animated:true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func editBtnClick(sender: UIButton) {
        
    }
    
    func deleteBtnClick(sender: UIButton) {
        let alertController:UIAlertController = UIAlertController.init(title: nil, message: "此照片删除将不可恢复", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let cancel:UIAlertAction = UIAlertAction.init(title: "取消", style: UIAlertActionStyle.cancel) { (UIAlertAction) in
            
        }
        
        let delete:UIAlertAction = UIAlertAction.init(title: "删除", style: UIAlertActionStyle.default) { (UIAlertAction) in
            
        }
        
        alertController.addAction(cancel)
        alertController.addAction(delete)
        self.present(alertController, animated: true) { 
            
        }
        
    }
    
}
