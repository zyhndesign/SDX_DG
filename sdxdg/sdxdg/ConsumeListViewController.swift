//
//  ConsumeListViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/26.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class ConsumeListViewController: UITableViewController {
    
    let customerIconArray:[String] = ["customerIcon1","customerIcon2","customerIcon3","customerIcon4","customerIcon5"]
    let customerNameArray:[String] = ["Aaron","Lyndon","Dempsey","Baldwin","Eric","Clark","Harlan","Chapman","Goddard","Donald","Julius","Abraham","Felix","Geoffrey","Elmer","Blake","Franklin","Clarence","Lewis","Bartholomew","Gabriel"]
    
    var storyBoard:UIStoryboard?
    var naviController:UINavigationController?
    
    init(storyBoard:UIStoryboard, naviController:UINavigationController){
        super.init(nibName: nil, bundle: nil)
        self.storyBoard = storyBoard
        self.naviController = naviController
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(ConsumerListCell.self, forCellReuseIdentifier: "consumerCell")
        //self.tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 36;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identify:String = "consumerCell"
        let cell:ConsumerListCell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath) as! ConsumerListCell;
        let customerIconRandomNum:Int = Int(arc4random_uniform(UInt32(customerIconArray.count)))
        let customerNameRandomNum:Int = Int(arc4random_uniform(UInt32(customerNameArray.count)))
       
        cell.initDataForCell(imageName: customerIconArray[customerIconRandomNum], name: customerNameArray[customerNameRandomNum], price: "¥360.0", time: "2016-12-16",storyBoard: storyBoard!, navigationController:naviController!)
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
