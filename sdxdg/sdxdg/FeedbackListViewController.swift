//
//  FeedbackListViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/26.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class FeedbackListViewController: UITableViewController {
    
    var sBoard:UIStoryboard?
    var naviController:UINavigationController?
    let fbIconArray:[String] = ["fb1","fb2","fb3","fb4","fb5","fb6","fb7","fb8","fb9","fb10"]
    
    let screenWidth = UIScreen.main.bounds.width
    
    init(sBoard:UIStoryboard, naviController:UINavigationController){
        super.init(nibName: nil, bundle: nil)
        self.sBoard = sBoard
        self.naviController = naviController
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(FeedbackListCell.self, forCellReuseIdentifier: "feedbackCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 36;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (screenWidth - 50) / 4 + 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController:FeedbackDetailViewController = sBoard?.instantiateViewController(withIdentifier: "FeedbackDetailView") as! FeedbackDetailViewController
        let iconRandomNum1:Int = Int(arc4random_uniform(UInt32(fbIconArray.count)))
        let iconRandomNum2:Int = Int(arc4random_uniform(UInt32(fbIconArray.count)))
        let iconRandomNum3:Int = Int(arc4random_uniform(UInt32(fbIconArray.count)))
        let iconRandomNum4:Int = Int(arc4random_uniform(UInt32(fbIconArray.count)))
        viewController.initData(fbImage1: fbIconArray[iconRandomNum1], fbImage1Like: true, fbImage2: fbIconArray[iconRandomNum2], fbImage2Like: true, fbImage3: fbIconArray[iconRandomNum3], fbImage3Like: true, fbImage4: fbIconArray[iconRandomNum4], fbImage4Like: true)
        naviController?.pushViewController(viewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identify:String = "feedbackCell"
        let cell:FeedbackListCell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath) as! FeedbackListCell;
        let iconRandomNum1:Int = Int(arc4random_uniform(UInt32(fbIconArray.count)))
        let iconRandomNum2:Int = Int(arc4random_uniform(UInt32(fbIconArray.count)))
        let iconRandomNum3:Int = Int(arc4random_uniform(UInt32(fbIconArray.count)))
        let iconRandomNum4:Int = Int(arc4random_uniform(UInt32(fbIconArray.count)))
       
        cell.initDataForCell(name:"SUNDANCE 商务男装造型", fbIcon1: fbIconArray[iconRandomNum1], fbIcon2: fbIconArray[iconRandomNum2], fbIcon3: fbIconArray[iconRandomNum3], fbIcon4: fbIconArray[iconRandomNum4],time:"16:25 2016-12-26",storyBoard: sBoard!, navigationController:naviController!)
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

