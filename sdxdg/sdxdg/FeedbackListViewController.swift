//
//  FeedbackListViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/26.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class FeedbackListViewController: UITableViewController {
    
    var sBoard:UIStoryboard?
    var naviController:UINavigationController?
    
    let screenWidth = UIScreen.main.bounds.width
    
    let refresh = UIRefreshControl.init()
    let pageLimit:Int = 10
    var pageNum:Int = 0
    var matchList:[Match] = []
    
    let userId = LocalDataStorageUtil.getUserIdFromUserDefaults()
    var vipName:String = ""
    var vipId:Int = 0
    init(sBoard:UIStoryboard, naviController:UINavigationController, vipName:String, vipId:Int){
        super.init(nibName: nil, bundle: nil)
        self.sBoard = sBoard
        self.naviController = naviController
        self.vipName = vipName
        self.vipId = vipId
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(FeedbackListCell.self, forCellReuseIdentifier: "feedbackCell")
        //self.tableView.dataSource = self
        
        refresh.backgroundColor = UIColor.white
        refresh.tintColor = UIColor.lightGray
        refresh.attributedTitle = NSAttributedString(string:"下拉刷新")
        refresh.addTarget(self, action: #selector(refreshLoadingData), for: UIControlEvents.valueChanged)
        self.tableView.addSubview(refresh)
        
        loadData(limit: pageLimit,offset: 0)
        
        self.tableView.tableFooterView = UIView.init(frame: CGRect.zero)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (screenWidth - 50) / 4 + 60
    }
    
    func refreshLoadingData(){
        loadData(limit: pageLimit,offset: pageLimit * pageNum)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController:FeedbackDetailViewController = sBoard?.instantiateViewController(withIdentifier: "FeedbackDetailView") as! FeedbackDetailViewController
        let match:Match = matchList[indexPath.row]
        
        let matchLists:[Matchlist] = match.matchlists!
        viewController.initData(matchLists: matchLists)
        viewController.vipId = vipId
        naviController?.pushViewController(viewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identify:String = "feedbackCell"
        let cell:FeedbackListCell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath) as! FeedbackListCell;
        
        let match:Match = matchList[indexPath.row]
        
        let matchLists:[Matchlist] = match.matchlists!
        
        cell.initDataForCell(name:match.seriesname! , fbIcon1: matchLists[0].modelurl!, fbIcon2: matchLists[1].modelurl!,
                             fbIcon3: matchLists[2].modelurl!, fbIcon4: matchLists[3].modelurl!,time:match.createtime! ,storyBoard: sBoard!, navigationController:naviController!)
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData(limit:Int, offset:Int){
        
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "正在加载中..."
        
        let parameters:Parameters = ["userId":userId, "vipName":vipName, "limit":limit,"offset":offset]
        
        Alamofire.request(ConstantsUtil.APP_SHARE_HISTORY_URL,method:.post, parameters:parameters).responseObject { (response: DataResponse<MatchServerModel>) in
            
            let matchServerModel = response.result.value
            
            if (matchServerModel?.resultCode == 200){
                
                if let matchServerModelList = matchServerModel?.object {
                    for matchModel in matchServerModelList{
                        self.matchList.insert(matchModel, at: 0)
                        self.pageNum = self.pageNum + 1
                    }
                    self.tableView.reloadData()
                    self.refresh.endRefreshing()
                    hud.label.text = "加载成功"
                    hud.hide(animated: true, afterDelay: 0.5)
                }
                else{
                    hud.label.text = "无推送历史数据"
                    hud.hide(animated: true, afterDelay: 0.5)
                }
                
                
            }
            else{
                hud.label.text = "加载失败"
                hud.hide(animated: true, afterDelay: 0.5)
            }
        }
    }
    
}

