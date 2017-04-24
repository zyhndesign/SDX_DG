//
//  FilterViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/20.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FilterViewController : UIViewController{
    
    @IBOutlet var innerBtn: UIButton!
    @IBOutlet var outterBtn: UIButton!
    @IBOutlet var bottomBtn: UIButton!
    @IBOutlet var businessBtn: UIButton!
    @IBOutlet var fashionBtn: UIButton!
    @IBOutlet var freedomBtn: UIButton!
    @IBOutlet var categoryLabel: UILabel!
    
    var innerPanel:UIView?
    
    var outterPanel:UIView?
    
    var trouserPanel:UIView?
    
    @IBOutlet var minPrice: UITextField!
    @IBOutlet var maxPrice: UITextField!
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var brandList:[Int] = []
    var categoryList:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //let panelY = categoryLabel.bounds.origin.y + 30
        innerPanel = UIView.init(frame: CGRect.init(x: 0, y: 270, width: screenWidth, height: 100))
        self.view.addSubview(innerPanel!)
        
        outterPanel = UIView.init(frame: CGRect.init(x: 0, y: 260, width: screenWidth, height: 100))
        self.view.addSubview(outterPanel!)
       
        trouserPanel = UIView.init(frame: CGRect.init(x: 0, y: 270, width: screenWidth, height: 100))
        self.view.addSubview(trouserPanel!)
        
       
        self.innerPanel?.isHidden = false
        self.outterPanel?.isHidden = true
        self.trouserPanel?.isHidden = true
        
        self.initBtnStyle(innerBtn, outterBtn, bottomBtn, businessBtn, fashionBtn,freedomBtn)
        
        self.initBtnClickEvent(innerBtn, outterBtn, bottomBtn, businessBtn, fashionBtn, freedomBtn)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initBtnClickEvent(_ buttons : UIButton...){
        for button in buttons{
            button.addTarget(self, action: #selector(buttonTapped(sender:)), for: UIControlEvents.touchUpInside)
        }
    }
    
    func initCategoryBtnClickEvent(_ buttons : UIButton...){
        for button in buttons{
            button.addTarget(self, action: #selector(buttonCategoryTapped(sender:)), for: UIControlEvents.touchUpInside)
        }
    }
    
    func initBtnStyle(_ buttons : UIButton...){
        for button in buttons{
            button.layer.cornerRadius = 7.0
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.init(colorLiteralRed: 59.0/255.0, green: 59.0/255.0, blue: 59.0/255.0, alpha: 1.0).cgColor
            button.backgroundColor = UIColor.white
        }
    }
    
    func changeBtnSelectStyle(_ button : UIButton){
        let color:UIColor = UIColor.init(colorLiteralRed: 253.0/255.0, green: 220.0/255.0, blue: 56.0/255.0, alpha: 1.0)
        button.layer.cornerRadius = 7.0
        button.layer.borderWidth = 1
        button.layer.borderColor = color.cgColor
        button.backgroundColor = color
    }
    
    @IBAction func filterBtnClick(_ sender: Any) {
        
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "筛选中..."
        hud.hide(animated: true, afterDelay: 0.8)
        
        /*
        let time: TimeInterval = 1.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            
            self.navigationController?.popViewController(animated: true)
            
        }
         */
        
        var brand:String = ""
        for i in brandList{
            brand.append(String(i))
            brand.append(",")
        }
        print("brand:")
        print(brand)
        
        var category:String = ""
        for i in categoryList{
            category.append(String(i))
            category.append(",")
        }
        print("category:")
        print(category)
        
    }
    
    func buttonCategoryTapped(sender:UIButton){
        if sender.isSelected{
            initBtnStyle(sender)
            sender.isSelected = false
            self.removeDataFromArray(tag: 2, result: sender.tag)
        }
        else{
            changeBtnSelectStyle(sender)
            sender.isSelected = true
            categoryList.append(sender.tag)
        }
        
    }
    
    func buttonTapped(sender:UIButton){
        if sender.isSelected{
            initBtnStyle(sender)
            sender.isSelected = false
            if sender.tag == 4{
                self.removeDataFromArray(tag: 1, result: 2)
            }
            else if sender.tag == 5{
                self.removeDataFromArray(tag: 1, result: 4)
            }
            else if sender.tag == 6{
                self.removeDataFromArray(tag: 1, result: 3)
            }
        }
        else{
            changeBtnSelectStyle(sender)
            sender.isSelected = true
            if sender.tag == 4{
                brandList.append(2)
            }
            else if sender.tag == 5{
                brandList.append(4)
            }
            else if sender.tag == 6{
                brandList.append(3)
            }
        }
        
        switch sender.tag{
        case 1:
            self.innerPanel?.isHidden = false
            self.outterPanel?.isHidden = true
            self.trouserPanel?.isHidden = true
            initBtnStyle(outterBtn)
            outterBtn.isSelected = false
            initBtnStyle(bottomBtn)
            bottomBtn.isSelected = false
            self.loadCategory(category: 1)
            //3
        case 2:
            self.innerPanel?.isHidden = true
            self.outterPanel?.isHidden = false
            self.trouserPanel?.isHidden = true
            initBtnStyle(innerBtn)
            initBtnStyle(bottomBtn)
            innerBtn.isSelected = false
            bottomBtn.isSelected = false
            self.loadCategory(category: 0)
            //2
        case 3:
            self.innerPanel?.isHidden = true
            self.outterPanel?.isHidden = true
            self.trouserPanel?.isHidden = false
            initBtnStyle(innerBtn)
            initBtnStyle(outterBtn)
            innerBtn.isSelected = false
            outterBtn.isSelected = false
            self.loadCategory(category: 2)
            //1
        default:
            print("0")
        }
        
    }
    
    func loadCategory(category:Int){
        var id:Int = 0
        if category == 0{  // 外套
            id = 2   //此处id的值是后台绑定的
        }
        else if category == 1{ //内搭
            id = 3
        }
        else if category == 2{ //裤装
            id = 1
        }
        let parameters:Parameters = ["id":id]
        
        Alamofire.request(ConstantsUtil.APP_HPGL_CATEGORY,method:.get,parameters:parameters).responseJSON{
            response in
            
            switch response.result{
            case .success:
                if let jsonResult = response.result.value {
                    let json = JSON(jsonResult)
                    let resultCode = json["resultCode"]
                    
                    if resultCode == 200{
                        let btnWidth = (self.screenWidth - 70)/4
                        print(json["object"])
                        for i in 0...json["object"].count-1{
                            var btn:UIButton?
                            
                            if i >= 0 && i <= 3{
                                btn = UIButton.init(frame: CGRect.init(x: (btnWidth * CGFloat(i)) + 20 + (CGFloat(i) * 10), y: 10, width: btnWidth, height: 35))
                                btn?.setTitle(String(describing: json["object"][i]["name"]), for: UIControlState.normal)
                                btn?.setTitleColor(UIColor.black, for: UIControlState.normal)
                                btn?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
                                btn?.tag = Int.init(String(describing:json["object"][i]["id"]))!
                                self.initBtnStyle(btn!)
                                self.initCategoryBtnClickEvent(btn!)
                            }
                            else if i >= 4 && i <= 7{
                                btn = UIButton.init(frame: CGRect.init(x: (btnWidth * CGFloat(i - 4)) + 20 + (CGFloat(i - 4) * 10), y: 50, width: btnWidth, height: 35))
                                btn?.setTitle(String(describing: json["object"][i]["name"]), for: UIControlState.normal)
                                btn?.setTitleColor(UIColor.black, for: UIControlState.normal)
                                btn?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
                                btn?.tag = Int.init(String(describing:json["object"][i]["id"]))!
                                self.initBtnStyle(btn!)
                                self.initCategoryBtnClickEvent(btn!)
                            }
                            else if i >= 8 && i <= 11{
                                btn = UIButton.init(frame: CGRect.init(x: (btnWidth * CGFloat(i - 8)) + 20 + (CGFloat(i - 8) * 10), y: 90, width: btnWidth, height: 35))
                                btn?.setTitle(String(describing: json["object"][i]["name"]), for: UIControlState.normal)
                                btn?.setTitleColor(UIColor.black, for: UIControlState.normal)
                                btn?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
                                btn?.tag = Int.init(String(describing:json["object"][i]["id"]))!
                                self.initBtnStyle(btn!)
                                self.initCategoryBtnClickEvent(btn!)
                            }
                            if (i <= 11){
                                if category == 0{ //外套
                                    self.outterPanel?.addSubview(btn!)
                                }
                                else if (category == 1){ //内搭
                                    self.innerPanel?.addSubview(btn!)
                                }
                                else if (category == 2){ //裤装
                                    self.trouserPanel?.addSubview(btn!)
                                }
                            }
                            
                        }
                        
                    }
                    else{
                        print(json["message"])
                        MessageUtil.showMessage(view: self.view, message: json["message"].string!)
                    }
                }
            case .failure(let error):
                print(error)
                MessageUtil.showMessage(view: self.view, message: error.localizedDescription)
            }
            
        }
    }
    
    func removeDataFromArray(tag:Int, result:Int){
        
        
        if tag == 1{
            var i = 0
            for data in brandList{
                if result == data{
                    brandList.remove(at: i)
                }
                i = i + 1
            }
            
        }
        else if tag == 2{
            var i = 0
            for data in categoryList{
                if result == data{
                    categoryList.remove(at: i)
                }
                i = i + 1
            }
            
        }
        
    }
}
