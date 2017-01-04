//
//  MyMatchViewController.swift
//  sdxdg
//
//  Created by lotusprize on 17/1/3.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import UIKit

class MyMatchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var pushBtn: UIButton!
    @IBOutlet var backBtn: UIButton!
    @IBOutlet var draftBtn: UIButton!
    @IBOutlet var tableView: UITableView!
    
    let screenWidth = UIScreen.main.bounds.width
    let fbIconArray:[String] = ["fb1","fb2","fb3","fb4","fb5","fb6","fb7","fb8","fb9","fb10"]
    
    var btnInitTag:Int = 0
    
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
        
        if btnInitTag == 0{
            pushBtn.isSelected = true
        }
        else if btnInitTag == 1{
            pushBtn.isSelected = true
        }
        else if btnInitTag == 2{
            backBtn.isSelected = true
        }
        else if btnInitTag == 3{
            draftBtn.isSelected = true
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexCellName:String = "MatchCell"
        let matchCell:MyMatchTableViewCell = tableView.dequeueReusableCell(withIdentifier: indexCellName, for: indexPath) as! MyMatchTableViewCell
        let iconRandomNum1:Int = Int(arc4random_uniform(UInt32(fbIconArray.count)))
        let iconRandomNum2:Int = Int(arc4random_uniform(UInt32(fbIconArray.count)))
        let iconRandomNum3:Int = Int(arc4random_uniform(UInt32(fbIconArray.count)))
        let iconRandomNum4:Int = Int(arc4random_uniform(UInt32(fbIconArray.count)))
        matchCell.initCellData(titleLable: "SUNDANCE 商务男装造型", timeLabel: "16:25 2016-12-26", model1: fbIconArray[iconRandomNum1], model2: fbIconArray[iconRandomNum2], model3: fbIconArray[iconRandomNum3], model4: fbIconArray[iconRandomNum4])
        return matchCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (screenWidth - 50)/4 + 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pushBtnClick(_ sender: Any) {
        pushBtn.isSelected = true
        backBtn.isSelected = false
        draftBtn.isSelected = false
    }
    
    @IBAction func backBtnClick(_ sender: Any) {
        pushBtn.isSelected = false
        backBtn.isSelected = true
        draftBtn.isSelected = false
    }
    
    @IBAction func draftBtnClick(_ sender: Any) {
        pushBtn.isSelected = false
        backBtn.isSelected = false
        draftBtn.isSelected = true
    }
    
}
