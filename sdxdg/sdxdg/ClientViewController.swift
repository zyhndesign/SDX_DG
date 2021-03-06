//
//  ClientViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/14.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ClientViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var tableView: UITableView!
    
    var customerNum:Int = 0
    
    let customerIconArray:[String] = ["defaultCustomerIcon","defaultCustomerIcon","defaultCustomerIcon","defaultCustomerIcon","defaultCustomerIcon"]
    
    var customerNameArray:[String] = Array.init()
    var indexArray:[String] = Array.init()
    var letterResultArr:NSMutableArray!
    
    var vipUserList:[VipUser] = []
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //创建一个重用的单元格
        self.tableView.register(ClientTableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        self.tableView.tableFooterView = UIView.init(frame: CGRect.zero)
        self.automaticallyAdjustsScrollViewInsets = false
        
        let userId:Int = LocalDataStorageUtil.getUserIdFromUserDefaults()
        self.loadVipCustomerByUserId(userId: userId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //注册广播机制，监听选择的人数
        //NotificationCenter.default.addObserver(self, selector:#selector(self.updateClientNumber(notifaction:)), name: NSNotification.Name(rawValue: "customerCount"), object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //NotificationCenter.default.removeObserver(self)
    }
    //实现索引数据源代理方法
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return indexArray
    }
    
    
    //点击索引，移动TableView的组位置
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        
        return index
    }
    
    //设置分区数
    func numberOfSections(in tableView: UITableView) -> Int {
        return indexArray.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.letterResultArr.object(at: section) as AnyObject).count
    }
    
    // UITableViewDataSource协议中的方法，该方法的返回值决定指定分区的头部
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return indexArray[section];
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 26;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view:ClientDetailViewController = self.storyboard!.instantiateViewController(withIdentifier: "ClientDetailView") as! ClientDetailViewController
        //view.titleName = nameLabel?.text
        //self.navigationController?.pushViewController(view, animated: true)
        
        let customerName = (self.letterResultArr.object(at: indexPath.section) as! NSMutableArray).object(at: indexPath.row) as! String
        print(customerName)
        
        for vipUser in vipUserList{
            if vipUser.vipname == customerName{
                view.vipUser = vipUser
            }
        }
        
        self.navigationController?.pushViewController(view, animated: true)
    }
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //为了提供表格显示性能，已创建完成的单元需重复使用
        let identify:String = "SwiftCell"
        //同一形式的单元格重复使用，在声明时已注册
        let cell:ClientTableViewCell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath) as! ClientTableViewCell;
        let customerIconRandomNum:Int = Int(arc4random_uniform(UInt32(customerIconArray.count)))
        
        let customerName = (self.letterResultArr.object(at: indexPath.section) as! NSMutableArray).object(at: indexPath.row) as! String
        cell.initListData(imageUrl: customerIconArray[customerIconRandomNum], name: customerName,storyBoard: self.storyboard!, navigationController:self.navigationController!)
        
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        //let secno = indexPath.section
        
        return cell
    }
    
    @IBAction func confirmBtnClick(_ sender: Any) {
        //self.dismiss(animated: true, completion: nil)
        //self.dismiss(animated: true, completion: { (parameters) -> Void in })
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.马春
    }
    
    func loadVipCustomerByUserId(userId : Int){
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "正在加载您的客户"
        
        let parameters:Parameters = ["shoppingGuideId":userId]
        
        Alamofire.request(ConstantsUtil.APP_USER_GET_VIP_URL,method:.post,parameters:parameters).responseObject { (response: DataResponse<VipUserServerModel>) in
            
            let vipUserServerModel = response.result.value
            
            if (vipUserServerModel?.resultCode == 200){
                
                if let vipUserServerModelObject = vipUserServerModel?.object{
                    
                    if (vipUserServerModelObject.count > 0){
                        hud.label.text = "加载成功"
                        hud.hide(animated: true, afterDelay: 0.5)
                        
                        for vipUser in vipUserServerModelObject{
                            self.customerNameArray.append(vipUser.vipname!)
                            self.vipUserList.append(vipUser)
                            
                        }
                        
                        let tempArray1:NSMutableArray = ChineseString.indexArray(self.customerNameArray)
                        
                        for str in tempArray1{
                            self.indexArray.append(str as! String)
                        }
                        
                        self.letterResultArr = ChineseString.letterSortArray(self.customerNameArray)
                        
                        self.tableView.reloadData()
                    }
                    else{
                        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                        hud.label.text = "您没有VIP数据"
                        hud.hide(animated: true, afterDelay: 2.0)
                    }
                }
            }
        }
    }
}
