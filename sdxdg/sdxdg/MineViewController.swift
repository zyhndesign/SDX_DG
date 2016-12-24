//
//  MineViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/14.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {
    
    @IBOutlet var userInfoPanel: UIView!
    @IBOutlet var scrollView: UIScrollView!
    
    var backDataIcon:UIImageView?
    var backDataLabel:UILabel?
    var timeSegmentControl:UISegmentedControl?
    var chartView:UIImageView?
    
    var myMatchViewIcon:UIImageView?
    var myMatchViewLabel:UILabel?
    var myMatchAllLabel:UILabel?
    var myMatchArrowImageView:UIImageView?
    
    var myMatchPushImageView:UIImageView?
    var myMatchPushLabel:UILabel?
    var myMatchFeedbackImageView:UIImageView?
    var myMatchFeedbackLabel:UILabel?
    var myMatchDraftImageView:UIImageView?
    var myMatchDraftLabel:UILabel?
    
    var hotMatchImageView:UIImageView?
    var hotMatchLabel:UILabel?
    var hotMatchALLLabel:UILabel?
    var hotMatchArrowImageView:UIImageView?
    
    var top3ImageView1:UIImageView?
    var top3ImageView2:UIImageView?
    var top3ImageView3:UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let screenWidth:CGFloat = UIScreen.main.bounds.width
        //let screenHeight:CGFloat = UIScreen.main.bounds.height
        
        let userInfoPanelGesture:UIGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(panelTapped(sender:)))
        userInfoPanel.addGestureRecognizer(userInfoPanelGesture)
        
        backDataIcon = UIImageView.init(frame: CGRect.init(x: 10, y: 15, width: 20, height: 20))
        backDataIcon?.image = UIImage.init(named: "backDataIcon")
        scrollView.addSubview(backDataIcon!)
        
        backDataLabel = UILabel.init(frame: CGRect.init(x: 40, y: 15, width: 100, height: 30))
        backDataLabel?.text = "反馈数据"
        backDataLabel?.font = UIFont.init(name: "Helvetica", size: 12)
        scrollView.addSubview(backDataLabel!)
       
        let graphView:UIView = UIView.init(frame: CGRect.init(x: 0, y: 50, width: screenWidth, height: 230))
        graphView.backgroundColor = UIColor.white
        let items = ["周", "月", "年"]
        timeSegmentControl = UISegmentedControl(items:items)
        timeSegmentControl?.frame = CGRect.init(x: 30, y: 15, width: screenWidth - 60, height: 30)
        timeSegmentControl?.selectedSegmentIndex = 0
        timeSegmentControl?.addTarget(self, action: #selector(segmentControlClick(sender:)), for: UIControlEvents.valueChanged)
        graphView.addSubview(timeSegmentControl!)
        
        chartView = UIImageView.init(frame: CGRect.init(x: 30, y: 55, width: screenWidth - 60, height: 160))
        chartView?.image = UIImage.init(named: "chartWeek")
        graphView.addSubview(chartView!)
        
        scrollView.addSubview(graphView)
        
        myMatchViewIcon = UIImageView.init(frame: CGRect.init(x: 10, y: 290, width: 20, height: 20))
        myMatchViewIcon?.image = UIImage.init(named: "myMatchIcon")
        scrollView.addSubview(myMatchViewIcon!)
        
        myMatchViewLabel = UILabel.init(frame: CGRect.init(x: 40, y: 290, width: 100, height: 20))
        myMatchViewLabel?.text = "我的搭配"
        myMatchViewLabel?.font = UIFont.init(name: "Helvetica", size: 12)
        scrollView.addSubview(myMatchViewLabel!)
        
        myMatchAllLabel = UILabel.init(frame: CGRect.init(x: screenWidth - 70, y: 290, width: 30, height: 20))
        myMatchAllLabel?.text = "全部"
        myMatchAllLabel?.font = UIFont.init(name: "Helvetica", size: 12)
        scrollView.addSubview(myMatchAllLabel!)
        
        myMatchArrowImageView = UIImageView.init(frame: CGRect.init(x: screenWidth - 30, y: 293, width: 10, height: 15))
        myMatchArrowImageView?.image = UIImage.init(named: "rightArrow")
        scrollView.addSubview(myMatchArrowImageView!)
        
        let myMatchView:UIView = UIView.init(frame: CGRect.init(x: 0, y: 320, width: screenWidth, height: 65))
        myMatchView.backgroundColor = UIColor.white
        
        myMatchPushImageView = UIImageView.init(frame: CGRect.init(x: screenWidth / 3 / 2 - 25, y: 5, width: 30, height: 30))
        myMatchPushImageView?.image = UIImage.init(named: "push")
        myMatchView.addSubview(myMatchPushImageView!)
        
        myMatchPushLabel = UILabel.init(frame: CGRect.init(x: screenWidth / 3 / 2 - 30, y: 45, width: 40, height: 20))
        myMatchPushLabel?.text = "推送"
        myMatchPushLabel?.textAlignment = NSTextAlignment.center
        myMatchPushLabel?.font = UIFont.init(name: "Helvetica", size: 12)
        myMatchView.addSubview(myMatchPushLabel!)
        
        myMatchFeedbackImageView = UIImageView.init(frame: CGRect.init(x: screenWidth / 3 + screenWidth / 3 / 2 - 25, y: 5, width: 30, height: 30))
        myMatchFeedbackImageView?.image = UIImage.init(named: "feedback")
        myMatchView.addSubview(myMatchFeedbackImageView!)
        
        myMatchFeedbackLabel = UILabel.init(frame: CGRect.init(x: screenWidth / 3 + screenWidth / 3 / 2 - 30, y: 45, width: 40, height: 20))
        myMatchFeedbackLabel?.text = "反馈"
        myMatchFeedbackLabel?.textAlignment = NSTextAlignment.center
        myMatchFeedbackLabel?.font = UIFont.init(name: "Helvetica", size: 12)
        myMatchView.addSubview(myMatchFeedbackLabel!)
        
        myMatchDraftImageView = UIImageView.init(frame: CGRect.init(x: screenWidth / 3 * 2 + screenWidth / 3 / 2 - 25, y: 5, width: 30, height: 30))
        myMatchDraftImageView?.image = UIImage.init(named: "draftbox")
        myMatchView.addSubview(myMatchDraftImageView!)
        
        myMatchDraftLabel = UILabel.init(frame: CGRect.init(x: screenWidth / 3 * 2 + screenWidth / 3 / 2 - 30, y: 45, width: 40, height: 20))
        myMatchDraftLabel?.text = "草稿箱"
        myMatchDraftLabel?.textAlignment = NSTextAlignment.center
        myMatchDraftLabel?.font = UIFont.init(name: "Helvetica", size: 12)
        myMatchView.addSubview(myMatchDraftLabel!)
        
        scrollView.addSubview(myMatchView)
        
        hotMatchImageView = UIImageView.init(frame: CGRect.init(x: 10, y: 395, width: 20, height: 20))
        hotMatchImageView?.image = UIImage.init(named: "hotMatchIcon")
        scrollView.addSubview(hotMatchImageView!)
        
        hotMatchLabel = UILabel.init(frame: CGRect.init(x: 40, y: 395, width: 60, height: 20))
        hotMatchLabel?.text = "热门搭配"
        hotMatchLabel?.font = UIFont.init(name: "Helvetica", size: 12)
        scrollView.addSubview(hotMatchLabel!)
        
        hotMatchALLLabel = UILabel.init(frame: CGRect.init(x: screenWidth - 70, y: 395, width: 30, height: 20))
        hotMatchALLLabel?.text = "全部"
        hotMatchALLLabel?.font = UIFont.init(name: "Helvetica", size: 12)
        scrollView.addSubview(hotMatchALLLabel!)
        
        hotMatchArrowImageView = UIImageView.init(frame: CGRect.init(x: screenWidth - 30, y: 398, width: 10, height: 15))
        hotMatchArrowImageView?.image = UIImage.init(named: "rightArrow")
        scrollView.addSubview(hotMatchArrowImageView!)
        
        let hotView:UIView = UIView.init(frame: CGRect.init(x: 0, y: 425, width: screenWidth, height: 130))
         let borderColor:CGColor = UIColor.init(red: 253/255.0, green: 220/255.0, blue: 56/255.0, alpha: 1.0).cgColor
        top3ImageView1 = UIImageView.init(frame: CGRect.init(x: 10, y: 10, width: (screenWidth - 60) / 3, height: (screenWidth - 60) / 3))
        top3ImageView1?.layer.borderWidth = 1.0
        top3ImageView1?.layer.borderColor = borderColor
        top3ImageView1?.image = UIImage.init(named: "top3Image1")
        hotView.addSubview(top3ImageView1!)
        
       
        top3ImageView2 = UIImageView.init(frame: CGRect.init(x: screenWidth / 2 - ((screenWidth - 60) / 3) / 2, y: 10, width: (screenWidth - 60) / 3, height: (screenWidth - 60) / 3))
        top3ImageView2?.layer.borderWidth = 1.0
        top3ImageView2?.layer.borderColor = borderColor
        top3ImageView2?.image = UIImage.init(named: "top3Image2")
        hotView.addSubview(top3ImageView2!)
        
        top3ImageView3 = UIImageView.init(frame: CGRect.init(x: ((screenWidth - 60) / 3) * 2 + 50, y: 10, width: (screenWidth - 60) / 3, height: (screenWidth - 60) / 3))
        top3ImageView3?.image = UIImage.init(named: "top3Image3")
        top3ImageView3?.layer.borderWidth = 1.0
        top3ImageView3?.layer.borderColor = borderColor
        hotView.addSubview(top3ImageView3!)
        
        scrollView.addSubview(hotView)
        scrollView.contentSize = CGSize.init(width: screenWidth, height: 580)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func settingBtnClick(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "settingView")
        self.navigationController?.pushViewController(view!, animated: true)
    }
    
    func panelTapped(sender:UITapGestureRecognizer){
        let view = self.storyboard?.instantiateViewController(withIdentifier: "PersonalInfoView")
        self.navigationController?.pushViewController(view!, animated: true)
    }
    
    func segmentControlClick(sender:UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0:
            chartView?.image = UIImage.init(named: "chartWeek")
        case 1:
            chartView?.image = UIImage.init(named: "chartMonth")
        case 2:
            chartView?.image = UIImage.init(named: "chartYear")
        default:
            chartView?.image = UIImage.init(named: "chartWeek")
        }
    }
    
}
