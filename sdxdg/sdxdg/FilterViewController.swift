//
//  FilterViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/20.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class FilterViewController : UIViewController{
    
    @IBOutlet var innerBtn: UIButton!
    @IBOutlet var outterBtn: UIButton!
    @IBOutlet var bottomBtn: UIButton!
    @IBOutlet var businessBtn: UIButton!
    @IBOutlet var fashionBtn: UIButton!
    @IBOutlet var freedomBtn: UIButton!
    
    @IBOutlet var jackBtn: UIButton!
    @IBOutlet var singleBtn: UIButton!
    @IBOutlet var downFeatherBtn: UIButton!
    @IBOutlet var furClothBtn: UIButton!
    @IBOutlet var dustClothBtn: UIButton!
    @IBOutlet var bigClothBtn: UIButton!
    
    @IBOutlet var minPrice: UITextField!
    @IBOutlet var maxPrice: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initBtnStyle(innerBtn, outterBtn, bottomBtn, businessBtn, fashionBtn,freedomBtn,jackBtn,singleBtn,downFeatherBtn,furClothBtn,dustClothBtn,bigClothBtn)
        
        self.initBtnClickEvent(innerBtn, outterBtn, bottomBtn, businessBtn, fashionBtn,freedomBtn,jackBtn,singleBtn,downFeatherBtn,furClothBtn,dustClothBtn,bigClothBtn)
        
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
    
    @IBAction func backBtnClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func buttonTapped(sender:UIButton){
        if sender.isSelected{
            initBtnStyle(sender)
            sender.isSelected = false
        }
        else{
            changeBtnSelectStyle(sender)
            sender.isSelected = true
        }
        
        switch sender.tag{
        case 1:
            print("内搭")
        case 2:
            print("外套")
        case 3:
            print("下装")
        case 4:
            print("商务系列")
        case 5:
            print("时尚系列")
        case 6:
            print("自在系列")
        case 7:
            print("夹克")
        case 8:
            print("轻单衣")
        case 9:
            print("羽绒服")
        case 10:
            print("皮衣")
        case 11:
            print("风衣")
        case 12:
            print("大衣")
        default:
            print("0")
        }
        
    }
    
}
