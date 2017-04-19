//
//  HotMatchViewController.swift
//  sdxdg
//
//  Created by lotusprize on 17/1/4.
//  Copyright © 2017年 geekTeam. All rights reserved.
//


import UIKit
import Alamofire

class HotMatchViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionView: UICollectionView!
    
    let width = UIScreen.main.bounds.size.width//获取屏幕宽
    let height = UIScreen.main.bounds.size.height
    
    let refresh = UIRefreshControl()
    let pageLimit:Int = 10
    var pageNum:Int = 0
    
    let userId = LocalDataStorageUtil.getUserIdFromUserDefaults()
    
    var feedbackModels:[FeedbackModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(HotMatchCell.self, forCellWithReuseIdentifier:"cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        refresh.backgroundColor = UIColor.white
        refresh.tintColor = UIColor.lightGray
        refresh.attributedTitle = NSAttributedString(string:"下拉刷新")
        refresh.addTarget(self, action: #selector(refreshLoadingData), for: UIControlEvents.valueChanged)
        self.collectionView.addSubview(refresh)

        loadCostumeData(limit: pageLimit,offset: pageLimit * pageNum)
    }
    
    func refreshLoadingData(){
        print(pageNum)
        loadCostumeData(limit: pageLimit,offset: pageLimit * pageNum)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:HotMatchCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! HotMatchCell
        let feedbackModel:FeedbackModel = feedbackModels[indexPath.row]
        cell.initImageView(imgView: feedbackModel.modelurl!, heartCount: feedbackModel.countLike!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedbackModels.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(10, 5, 5, 10)
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: (width - 30)/2, height: (height/2 + 15))
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let feedbackModel:FeedbackModel = feedbackModels[indexPath.row]
        let view:HotMatchDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "HotMatchDetailView") as! HotMatchDetailViewController
        view.feedbackModel = feedbackModel
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func loadCostumeData(limit:Int, offset:Int){
        print("loading data.......")
        let parameters:Parameters = ["limit":limit,"offset":offset,"userId":userId]
        
        Alamofire.request(ConstantsUtil.APP_MATCH_LIST_HOT_FEEDBACK_URL,method:.post,parameters:parameters).responseObject { (response: DataResponse<FeedbackServerModel>) in
            
            let feedbackServerModel = response.result.value
            
            if (feedbackServerModel?.resultCode == 200){
                
                if let feedbackServerModelObject = feedbackServerModel?.object{
                    for feedModel in feedbackServerModelObject{
                        self.feedbackModels.insert(feedModel, at: 0)
                    }
                    
                    if (feedbackServerModelObject.count > 0){
                        self.collectionView.reloadData()
                        self.pageNum = self.pageNum + 1;
                    }
                    else{
                        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                        hud.label.text = "无更多数据"
                        hud.hide(animated: true, afterDelay: 2.0)
                    }
                    self.refresh.endRefreshing()
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

