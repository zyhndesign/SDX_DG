//
//  ClientViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/14.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class ClientViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var tableView: UITableView!
    
    var customerNum:Int = 0
    
    var adHeaders:[String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
    let customerIconArray:[String] = ["customerIcon1","customerIcon2","customerIcon3","customerIcon4","customerIcon5"]
    let customerNameArray:[String] = ["Aaron","Lyndon","Dempsey","Baldwin","Eric","Clark","Harlan","Chapman","Goddard","Donald","Julius","Abraham","Felix","Geoffrey","Elmer","Blake","Franklin","Clarence","Lewis","Bartholomew","Gabriel"]
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //创建一个重用的单元格
        self.tableView.register(ClientTableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        //self.tableView.register(UINib.init(nibName: <#T##String#>, bundle: nil), forCellReuseIdentifier: "SwiftCell")
        self.automaticallyAdjustsScrollViewInsets = false
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
        return adHeaders
    }
    
    
    //点击索引，移动TableView的组位置
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        var tpIndex:Int = 0
        //遍历索引值
        for character in adHeaders{
            //判断索引值和组名称相等，返回组坐标
            if character == title{
                return tpIndex
            }
            tpIndex += 1
        }
        return 0
    }
    
    //设置分区数
    func numberOfSections(in tableView: UITableView) -> Int {
        return adHeaders.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // UITableViewDataSource协议中的方法，该方法的返回值决定指定分区的头部
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var headers =  self.adHeaders;
        return headers[section];
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
        self.navigationController?.pushViewController(view, animated: true)
    }
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //为了提供表格显示性能，已创建完成的单元需重复使用
        let identify:String = "SwiftCell"
        //同一形式的单元格重复使用，在声明时已注册
        let cell:ClientTableViewCell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath) as! ClientTableViewCell;
        let customerIconRandomNum:Int = Int(arc4random_uniform(UInt32(customerIconArray.count)))
        let customerNameRandomNum:Int = Int(arc4random_uniform(UInt32(customerNameArray.count)))
        cell.initListData(imageUrl: customerIconArray[customerIconRandomNum], name: customerNameArray[customerNameRandomNum],storyBoard: self.storyboard!, navigationController:self.navigationController!)
        
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
        // Dispose of any resources that can be recreated.
    }
    
    
}
