//
//  MyMatchViewController.swift
//  sdxdg
//
//  Created by lotusprize on 17/1/3.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import AlamofireObjectMapper
import SwiftyJSON

class MyMatchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var pushBtn: UIButton!
    @IBOutlet var backBtn: UIButton!
    @IBOutlet var draftBtn: UIButton!
    @IBOutlet var tableView: UITableView!
    
    let screenWidth = UIScreen.main.bounds.width
    let fbIconArray:[String] = ["fb1","fb2","fb3","fb4","fb5","fb6","fb7","fb8","fb9","fb10"]
    
    var btnInitTag:Int = 0
    
    var shareList:[Match] = []
    var feedbackList:[Match] = []
    var draftList:[Match] = []
    
    let pageLimit:Int = 10
    
    var sharePageNum:Int = 0
    var feedbackPageNum:Int = 0
    var draftPageNum = 0
    
    let refresh = UIRefreshControl()
    let userId = LocalDataStorageUtil.getUserIdFromUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pushBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        backBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        draftBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        pushBtn.setBackgroundImage(UIImage.init(named: "selectedBtn"), for: UIControlState.selected)
        backBtn.setBackgroundImage(UIImage.init(named: "selectedBtn"), for: UIControlState.selected)
        draftBtn.setBackgroundImage(UIImage.init(named: "selectedBtn"), for: UIControlState.selected)
        
        pushBtn.setTitle("已推送", for: UIControlState.normal)
        pushBtn.setTitle("已推送", for: UIControlState.selected)
        backBtn.setTitle("已反馈", for: UIControlState.normal)
        backBtn.setTitle("已反馈", for: UIControlState.selected)
        draftBtn.setTitle("草稿箱", for: UIControlState.normal)
        draftBtn.setTitle("草稿箱", for: UIControlState.selected)
        
        let titleColor:UIColor = UIColor.init(red: 59/255.0, green: 59/255.0, blue: 59/255.0, alpha: 1.0)
        pushBtn.setTitleColor(titleColor, for: UIControlState.normal)
        pushBtn.setTitleColor(titleColor, for: UIControlState.selected)
        backBtn.setTitleColor(titleColor, for: UIControlState.normal)
        backBtn.setTitleColor(titleColor, for: UIControlState.selected)
        draftBtn.setTitleColor(titleColor, for: UIControlState.normal)
        draftBtn.setTitleColor(titleColor, for: UIControlState.selected)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyMatchTableViewCell.self, forCellReuseIdentifier: "MatchCell")
        
        refresh.backgroundColor = UIColor.white
        refresh.tintColor = UIColor.lightGray
        refresh.attributedTitle = NSAttributedString(string:"下拉刷新")
        refresh.addTarget(self, action: #selector(refreshLoadingData), for: UIControlEvents.valueChanged)
        tableView.addSubview(refresh)
        
        if btnInitTag == 0{
            pushBtn.isSelected = true
            self.loadDataByCondition(category: 1, userId: userId, limit: pageLimit, offset: sharePageNum * pageLimit)
        }
        else if btnInitTag == 1{
            pushBtn.isSelected = true
            self.loadDataByCondition(category: 1, userId: userId, limit: pageLimit, offset: sharePageNum * pageLimit)
        }
        else if btnInitTag == 2{
            backBtn.isSelected = true
            self.loadDataByCondition(category: 2, userId: userId, limit: pageLimit, offset: feedbackPageNum * pageLimit)
        }
        else if btnInitTag == 3{
            draftBtn.isSelected = true
            self.loadDataByCondition(category: 3, userId: userId, limit: pageLimit, offset: draftPageNum * pageLimit)
        }
        
        self.tableView.tableFooterView = UIView.init(frame: CGRect.init())
    }
    
    func refreshLoadingData(){
        if btnInitTag == 1{
            self.loadDataByCondition(category: 1, userId: userId, limit: pageLimit, offset: sharePageNum * pageLimit)
        }
        else if btnInitTag == 2{
            self.loadDataByCondition(category: 2, userId: userId, limit: pageLimit, offset: feedbackPageNum * pageLimit)
        }
        else if btnInitTag == 3{
            self.loadDataByCondition(category: 3, userId: userId, limit: pageLimit, offset: draftPageNum * pageLimit)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexCellName:String = "MatchCell"
        let matchCell:MyMatchTableViewCell = tableView.dequeueReusableCell(withIdentifier: indexCellName, for: indexPath) as! MyMatchTableViewCell
        matchCell.selectionStyle = UITableViewCellSelectionStyle.none
        var match:Match?
        if (btnInitTag == 1){
            match = self.shareList[indexPath.row]
        }
        else if (btnInitTag == 2){
            match = self.feedbackList[indexPath.row]
        }
        else if (btnInitTag == 3){
            match = self.draftList[indexPath.row]
        }
        
        matchCell.initCellData(titleLable: match?.seriesname, timeLabel: match?.createtime, modelLists:match?.matchlists)
        return matchCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int = 0
        if (btnInitTag == 1){
            count = self.shareList.count
        }
        else if (btnInitTag == 2){
            count = self.feedbackList.count
        }
        else if (btnInitTag == 3){
            count = self.draftList.count
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (screenWidth - 50)/4 + 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if btnInitTag == 0 || btnInitTag == 1{
            let view:PushDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "PushDetailView") as! PushDetailViewController
            view.match = shareList[indexPath.row]
            self.navigationController?.pushViewController(view, animated: true)
        }
        else if btnInitTag == 2{
            let view:MyFeedbackDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "MyFeedbackDetailView") as! MyFeedbackDetailViewController
            view.match = feedbackList[indexPath.row]
            self.navigationController?.pushViewController(view, animated: true)
        }
        else if btnInitTag == 3{
            let view:DraftDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DraftDetailView") as! DraftDetailViewController
            print(draftList.count)
            print(indexPath.row)
            print(draftList[indexPath.row])
            view.match = draftList[indexPath.row]
            self.navigationController?.pushViewController(view, animated: true)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadDataByCondition(category:Int,userId:Int,limit:Int,offset:Int){
        var parameters:Parameters = [:]
        var url:String = ""
        if (category == 1){ //已经分享数据
            url = ConstantsUtil.APP_MATCH_LIST_BY_SHARESTATUS_URL
            parameters = ["userId":userId, "shareStatus":1,"limit":limit,"offset":offset]
        }
        else if (category == 2){ //已经反馈数据
            url = ConstantsUtil.APP_MATCH_LIST_BY_BACK_URL
            parameters = ["userId":userId, "backStatus":1,"limit":limit,"offset":offset]
        }
        else if (category == 3){ //草稿箱
            url = ConstantsUtil.APP_MATCH_LIST_BY_DRAFT_URL
            parameters = ["userId":userId, "draftStatus":1,"limit":limit,"offset":offset]
        }
        
        Alamofire.request(url,method:.post,parameters:parameters).responseObject { (response: DataResponse<MatchServerModel>) in
            
            let matchServerModel = response.result.value
            
            let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
            hud.label.text = "加载中..."
            
            if(matchServerModel?.success)!{
                
                if let matchlist = matchServerModel?.object{
                    if matchlist.count > 0{
                        for match in matchlist{
                            if (category == 1){
                                self.shareList.insert(match, at: 0)
                                self.sharePageNum = self.sharePageNum + 1
                            }
                            else if (category == 2){
                                self.feedbackList.insert(match, at: 0)
                                self.feedbackPageNum = self.feedbackPageNum + 1
                            }
                            else if (category == 3){
                                self.draftList.insert(match, at: 0)
                                self.draftPageNum = self.draftPageNum + 1
                            }
                        }
                        hud.hide(animated: true, afterDelay: 1.0)
                    }
                    else{
                        hud.label.text = "无更多数据"
                        hud.hide(animated: true, afterDelay: 1.0)
                    }
                    self.tableView.reloadData()
                }
                else{
                    hud.label.text = "数据加载失败"
                    hud.hide(animated: true, afterDelay: 1.0)
                }
            }
            else{
                hud.label.text = "数据加载失败"
                hud.hide(animated: true, afterDelay: 1.0)
            }
            self.refresh.endRefreshing()
        }
    }
    
    @IBAction func pushBtnClick(_ sender: Any) {
        pushBtn.isSelected = true
        backBtn.isSelected = false
        draftBtn.isSelected = false
        btnInitTag = 1
        self.loadDataByCondition(category: 1, userId: userId, limit: pageLimit, offset: sharePageNum * pageLimit)
    }
    
    @IBAction func backBtnClick(_ sender: Any) {
        pushBtn.isSelected = false
        backBtn.isSelected = true
        draftBtn.isSelected = false
        btnInitTag = 2
        self.loadDataByCondition(category: 2, userId: userId, limit: pageLimit, offset: feedbackPageNum * pageLimit)
    }
    
    @IBAction func draftBtnClick(_ sender: Any) {
        pushBtn.isSelected = false
        backBtn.isSelected = false
        draftBtn.isSelected = true
        btnInitTag = 3
        self.loadDataByCondition(category: 3, userId: userId, limit: pageLimit, offset: draftPageNum * pageLimit)
    }
    
}
