//
//  ClientDetailViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/26.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class ClientDetailViewController: UIViewController {
    
    @IBOutlet var baseInfoBtn: UIButton!
    @IBOutlet var consumeBtn: UIButton!
    @IBOutlet var feedbackBtn: UIButton!
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var baseInfoPanel:UIView?
    var consumePanel:UIView?
    var feedbackPanel:UIView?
    
    var vipUser:VipUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initBaseInfoPanel()
        self.initPushHistoryPanel()
        self.initFeedbackPanel()
        
        consumePanel?.isHidden = true
        feedbackPanel?.isHidden = true
    }
    
    func initBaseInfoPanel(){
        baseInfoPanel = UIView.init(frame: CGRect.init(x: 0, y: 113, width: screenWidth, height: screenHeight - 113))
        
        let icon:UIImageView = UIImageView.init(frame: CGRect.init(x: 20, y: 20, width: 130, height: 130))
        icon.image = UIImage.init(named: "customerIcon5")
        icon.contentMode = UIViewContentMode.scaleAspectFit
        baseInfoPanel!.addSubview(icon)
        
        let nameLabel:UILabel = UILabel.init(frame: CGRect.init(x: 160, y: 20, width: 100, height: 25))
        nameLabel.text = "VIP会员姓名:"
        nameLabel.font = UIFont.systemFont(ofSize: 12)
        baseInfoPanel!.addSubview(nameLabel)
        
        let nameLabelValue:UILabel = UILabel.init(frame: CGRect.init(x: 240, y: 20, width: 100, height: 25))
        nameLabelValue.text = vipUser?.vipname
        nameLabelValue.font = UIFont.systemFont(ofSize: 12)
        baseInfoPanel!.addSubview(nameLabelValue)
        
        let birthdayLabel:UILabel = UILabel.init(frame: CGRect.init(x: 160, y: 60, width: 100, height: 25))
        birthdayLabel.text = "生日:"
        birthdayLabel.font = UIFont.systemFont(ofSize: 12)
        baseInfoPanel!.addSubview(birthdayLabel)
        
        let valueBirthdayLabel:UILabel = UILabel.init(frame: CGRect.init(x: 240, y: 60, width: 100, height: 25))
        valueBirthdayLabel.text = vipUser?.birthday
        valueBirthdayLabel.font = UIFont.systemFont(ofSize: 12)
        baseInfoPanel!.addSubview(valueBirthdayLabel)
        
        let levelLabel:UILabel = UILabel.init(frame: CGRect.init(x: 160, y: 90, width: 100, height: 25))
        levelLabel.text = "级别:"
        levelLabel.font = UIFont.systemFont(ofSize: 12)
        baseInfoPanel!.addSubview(levelLabel)
        
        let valueLevelLabel:UILabel = UILabel.init(frame: CGRect.init(x: 240, y: 90, width: 100, height: 25))
        valueLevelLabel.text = vipUser?.rank
        valueLevelLabel.font = UIFont.systemFont(ofSize: 12)
        baseInfoPanel!.addSubview(valueLevelLabel)
        
        let mobileLabel:UILabel = UILabel.init(frame: CGRect.init(x: 160, y: 125, width: 100, height: 25))
        mobileLabel.text = "手机号码:"
        mobileLabel.font = UIFont.systemFont(ofSize: 12)
        baseInfoPanel!.addSubview(mobileLabel)
        
        let valueMobileLabel:UILabel = UILabel.init(frame: CGRect.init(x: 240, y: 125, width: 100, height: 25))
        valueMobileLabel.text = vipUser?.phonenumber
        valueMobileLabel.font = UIFont.systemFont(ofSize: 12)
        baseInfoPanel!.addSubview(valueMobileLabel)
        
        let line1:UIView = UIView.init(frame: CGRect.init(x: 15, y: 170, width: screenWidth - 30, height: 1))
        line1.backgroundColor = UIColor.lightGray
        baseInfoPanel!.addSubview(line1)
        
        let consumeLabel:UILabel = UILabel.init(frame: CGRect.init(x: 20, y: 180, width: 110, height: 30))
        consumeLabel.text = "目前消费额度:"
        consumeLabel.font = UIFont.systemFont(ofSize: 12)
        baseInfoPanel!.addSubview(consumeLabel)
        
        let valueConsumeLabel:UILabel = UILabel.init(frame: CGRect.init(x: 120, y: 180, width: 110, height: 30))
        valueConsumeLabel.text = String.init(format: "%i", (vipUser?.consumesum!)!)
        valueConsumeLabel.font = UIFont.systemFont(ofSize: 12)
        baseInfoPanel!.addSubview(valueConsumeLabel)
        
        let line2:UIView = UIView.init(frame: CGRect.init(x: 15, y: 210, width: screenWidth - 30, height: 1))
        line2.backgroundColor = UIColor.lightGray
        baseInfoPanel!.addSubview(line2)
        
        let consumeValueLabel:UILabel = UILabel.init(frame: CGRect.init(x: 20, y: 220, width: 110, height: 30))
        consumeValueLabel.text = "累计消费次数:"
        consumeValueLabel.font = UIFont.systemFont(ofSize: 12)
        baseInfoPanel!.addSubview(consumeValueLabel)
        
        let valueConsumeValueLabel:UILabel = UILabel.init(frame: CGRect.init(x: 120, y: 220, width: 110, height: 30))
        valueConsumeValueLabel.text = String.init(format: "%i", (vipUser?.consumenumber!)!)
        valueConsumeValueLabel.font = UIFont.systemFont(ofSize: 12)
        baseInfoPanel!.addSubview(valueConsumeValueLabel)
        
        
        let line3:UIView = UIView.init(frame: CGRect.init(x: 15, y: 250, width: screenWidth - 30, height: 1))
        line3.backgroundColor = UIColor.lightGray
        baseInfoPanel!.addSubview(line3)
        
        self.view.addSubview(baseInfoPanel!)
    }
    
    func initPushHistoryPanel(){
        let consumerController:ConsumeListViewController = ConsumeListViewController.init(storyBoard: self.storyboard!, naviController: self.navigationController!, vipName:(vipUser?.vipname)!)
        consumerController.view.frame = CGRect.init(x: 0, y: 113, width: screenWidth, height: screenHeight - 113)
        consumePanel = consumerController.view
        self.view.addSubview(consumePanel!)
        self.addChildViewController(consumerController)
    }
    
    func initFeedbackPanel(){
        let feedbackController:FeedbackListViewController = FeedbackListViewController.init(sBoard: self.storyboard!, naviController: self.navigationController!, vipName:(vipUser?.vipname)!, vipId:(vipUser?.id)!)
        feedbackController.view.frame = CGRect.init(x: 0, y: 113, width: screenWidth, height: screenHeight - 113)
        feedbackPanel = feedbackController.view
        self.view.addSubview(feedbackPanel!)
        self.addChildViewController(feedbackController)
    }
    
    @IBAction func baseInfoBtnClick(_ sender: Any) {
        baseInfoBtn.setBackgroundImage(UIImage.init(named: "selectedBtn"), for: UIControlState.normal)
        consumeBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        feedbackBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        baseInfoPanel?.isHidden = false
        consumePanel?.isHidden = true
        feedbackPanel?.isHidden = true
    }
    
    @IBAction func consumeBtnClick(_ sender: Any) {
        consumeBtn.setBackgroundImage(UIImage.init(named: "selectedBtn"), for: UIControlState.normal)
        baseInfoBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        feedbackBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        baseInfoPanel?.isHidden = true
        consumePanel?.isHidden = false
        feedbackPanel?.isHidden = true
    }
    
    @IBAction func feedbackBtnClick(_ sender: Any) {
        feedbackBtn.setBackgroundImage(UIImage.init(named: "selectedBtn"), for: UIControlState.normal)
        consumeBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        baseInfoBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        baseInfoPanel?.isHidden = true
        consumePanel?.isHidden = true
        feedbackPanel?.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
