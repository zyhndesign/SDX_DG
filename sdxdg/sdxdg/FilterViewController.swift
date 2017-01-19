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
    @IBOutlet var categoryLabel: UILabel!
    
    var inBtn1: UIButton?
    var inBtn2: UIButton?
    var inBtn3: UIButton?
    var inBtn4: UIButton?
    var innerPanel:UIView?
    
    var outterPanel:UIView?
    var outBtn1: UIButton?
    var outBtn2: UIButton?
    var outBtn3: UIButton?
    var outBtn4: UIButton?
    var outBtn5: UIButton?
    var outBtn6: UIButton?
    var outBtn7: UIButton?
    var outBtn8: UIButton?
    
    var trouserPanel:UIView?
    var trouserBtn1:UIButton?
    var trouserBtn2:UIButton?
    var trouserBtn3:UIButton?
    
    @IBOutlet var minPrice: UITextField!
    @IBOutlet var maxPrice: UITextField!
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //let panelY = categoryLabel.bounds.origin.y + 30
        innerPanel = UIView.init(frame: CGRect.init(x: 0, y: 270, width: screenWidth, height: 100))
        
        let inBtnWidth = (screenWidth - 70)/4
        inBtn1 = UIButton.init(frame: CGRect.init(x: 20, y: 10, width: inBtnWidth, height: 35))
        inBtn1?.setTitle("毛衫", for: UIControlState.normal)
        inBtn1?.setTitleColor(UIColor.black, for: UIControlState.normal)
        inBtn1?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        inBtn2 = UIButton.init(frame: CGRect.init(x: inBtnWidth + 30, y: 10, width: inBtnWidth, height: 35))
        inBtn2?.setTitle("T恤", for: UIControlState.normal)
        inBtn2?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        inBtn2?.setTitleColor(UIColor.black, for: UIControlState.normal)
        
        inBtn3 = UIButton.init(frame: CGRect.init(x: inBtnWidth * 2 + 40, y: 10, width: inBtnWidth, height: 35))
        inBtn3?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        inBtn3?.setTitle("衬衫", for: UIControlState.normal)
        inBtn3?.setTitleColor(UIColor.black, for: UIControlState.normal)
        inBtn4 = UIButton.init(frame: CGRect.init(x: inBtnWidth * 3 + 50, y: 10, width: inBtnWidth, height: 35))
        inBtn4?.setTitleColor(UIColor.black, for: UIControlState.normal)
        inBtn4?.setTitle("棉背心", for: UIControlState.normal)
        inBtn4?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        innerPanel?.addSubview(inBtn1!)
        innerPanel?.addSubview(inBtn2!)
        innerPanel?.addSubview(inBtn3!)
        innerPanel?.addSubview(inBtn4!)
        self.view.addSubview(innerPanel!)
        
        outterPanel = UIView.init(frame: CGRect.init(x: 0, y: 260, width: screenWidth, height: 100))
        
        outBtn1 = UIButton.init(frame: CGRect.init(x: 20, y: 10, width: inBtnWidth, height: 35))
        outBtn1?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        outBtn1?.setTitle("夹克", for: UIControlState.normal)
        outBtn1?.setTitleColor(UIColor.black, for: UIControlState.normal)
        outBtn2 = UIButton.init(frame: CGRect.init(x: inBtnWidth + 30, y: 10, width: inBtnWidth, height: 35))
        outBtn2?.setTitle("风衣", for: UIControlState.normal)
        outBtn2?.setTitleColor(UIColor.black, for: UIControlState.normal)
        outBtn2?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        outBtn3 = UIButton.init(frame: CGRect.init(x: inBtnWidth * 2 + 40, y: 10, width: inBtnWidth, height: 35))
        outBtn3?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        outBtn3?.setTitle("大衣", for: UIControlState.normal)
        outBtn3?.setTitleColor(UIColor.black, for: UIControlState.normal)
        outBtn4 = UIButton.init(frame: CGRect.init(x: inBtnWidth * 3 + 50, y: 10, width: inBtnWidth, height: 35))
        outBtn4?.setTitle("棉服", for: UIControlState.normal)
        outBtn4?.setTitleColor(UIColor.black, for: UIControlState.normal)
        outBtn4?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        outBtn5 = UIButton.init(frame: CGRect.init(x: 20, y: 10, width: inBtnWidth, height: 35))
        outBtn5?.setTitle("羽绒服", for: UIControlState.normal)
        outBtn5?.setTitleColor(UIColor.black, for: UIControlState.normal)
        outBtn5?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        outBtn6 = UIButton.init(frame: CGRect.init(x: inBtnWidth + 30, y: 10, width: inBtnWidth, height: 35))
        outBtn6?.setTitle("马夹", for: UIControlState.normal)
        outBtn6?.setTitleColor(UIColor.black, for: UIControlState.normal)
        outBtn6?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        outBtn7 = UIButton.init(frame: CGRect.init(x: inBtnWidth * 2 + 40, y: 10, width: inBtnWidth, height: 35))
        outBtn7?.setTitle("尼克服", for: UIControlState.normal)
        outBtn7?.setTitleColor(UIColor.black, for: UIControlState.normal)
        outBtn7?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        outBtn8 = UIButton.init(frame: CGRect.init(x: inBtnWidth * 3 + 50, y: 10, width: inBtnWidth, height: 35))
        outBtn8?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        outBtn8?.setTitleColor(UIColor.black, for: UIControlState.normal)
        outBtn8?.setTitle("西服", for: UIControlState.normal)
        outterPanel?.addSubview(outBtn1!)
        outterPanel?.addSubview(outBtn2!)
        outterPanel?.addSubview(outBtn3!)
        outterPanel?.addSubview(outBtn4!)
        outterPanel?.addSubview(outBtn5!)
        outterPanel?.addSubview(outBtn6!)
        outterPanel?.addSubview(outBtn7!)
        outterPanel?.addSubview(outBtn8!)
        self.view.addSubview(outterPanel!)
        
        let trouserBtnWidth = (screenWidth - 60) / 3
        trouserPanel = UIView.init(frame: CGRect.init(x: 0, y: 270, width: screenWidth, height: 100))
        
        trouserBtn1 = UIButton.init(frame: CGRect.init(x: 20, y: 10, width: trouserBtnWidth, height: 35))
        trouserBtn1?.setTitle("休闲裤", for: UIControlState.normal)
        trouserBtn1?.setTitleColor(UIColor.black, for: UIControlState.normal)
        trouserBtn1?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        trouserBtn2 = UIButton.init(frame: CGRect.init(x: trouserBtnWidth + 30, y: 10, width: trouserBtnWidth, height: 35))
        trouserBtn2?.setTitle("中裤", for: UIControlState.normal)
        trouserBtn2?.setTitleColor(UIColor.black, for: UIControlState.normal)
        trouserBtn2?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        trouserBtn3 = UIButton.init(frame: CGRect.init(x: trouserBtnWidth * 2 + 40, y: 10, width: trouserBtnWidth, height: 35))
        trouserBtn3?.setTitle("西裤", for: UIControlState.normal)
        trouserBtn3?.setTitleColor(UIColor.black, for: UIControlState.normal)
        trouserBtn3?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        trouserPanel?.addSubview(trouserBtn1!)
        trouserPanel?.addSubview(trouserBtn2!)
        trouserPanel?.addSubview(trouserBtn3!)
        self.view.addSubview(trouserPanel!)
        
        self.initBtnStyle(innerBtn, outterBtn, bottomBtn, businessBtn, fashionBtn,freedomBtn,inBtn1!,inBtn2!,inBtn3!,inBtn4!,outBtn1!,outBtn2!,outBtn3!,outBtn4!,outBtn5!,outBtn6!,outBtn7!,outBtn8!,trouserBtn1!,trouserBtn2!,trouserBtn3!)
        
        self.initBtnClickEvent(innerBtn, outterBtn, bottomBtn, businessBtn, fashionBtn,freedomBtn,inBtn1!,inBtn2!,inBtn3!,inBtn4!,outBtn1!,outBtn2!,outBtn3!,outBtn4!,outBtn5!,outBtn6!,outBtn7!,outBtn8!,trouserBtn1!,trouserBtn2!,trouserBtn3!)
        
        self.innerPanel?.isHidden = false
        self.outterPanel?.isHidden = true
        self.trouserPanel?.isHidden = true
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
    
    @IBAction func filterBtnClick(_ sender: Any) {
        
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "筛选中..."
        hud.hide(animated: true, afterDelay: 0.8)
        
        let time: TimeInterval = 1.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            
            self.navigationController?.popViewController(animated: true)
            
        }
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
            self.innerPanel?.isHidden = false
            self.outterPanel?.isHidden = true
            self.trouserPanel?.isHidden = true
            initBtnStyle(outterBtn)
            outterBtn.isSelected = false
            initBtnStyle(bottomBtn)
            bottomBtn.isSelected = false
        case 2:
            print("外套")
            self.innerPanel?.isHidden = true
            self.outterPanel?.isHidden = false
            self.trouserPanel?.isHidden = true
            initBtnStyle(innerBtn)
            initBtnStyle(bottomBtn)
            innerBtn.isSelected = false
            bottomBtn.isSelected = false
        case 3:
            print("下装")
            self.innerPanel?.isHidden = true
            self.outterPanel?.isHidden = true
            self.trouserPanel?.isHidden = false
            initBtnStyle(innerBtn)
            initBtnStyle(outterBtn)
            innerBtn.isSelected = false
            outterBtn.isSelected = false
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
