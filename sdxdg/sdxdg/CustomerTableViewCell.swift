//
//  CustomerTableViewCell.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/19.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class CustomerTableViewCell : UITableViewCell{

    var radioBtn:UIButton?
    var iconImageUrl:String?
    var nameLabel:UILabel?
    var iconImageView:UIImageView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        let view:UIView = UIView()
        self.accessoryView = view
        
        self.selectionStyle = UITableViewCellSelectionStyle.none
        
        self.iconImageView = UIImageView()
        self.contentView.addSubview(iconImageView!)
        
        self.radioBtn = UIButton()
        self.contentView.addSubview(radioBtn!)
        self.radioBtn!.setImage(UIImage.init(named: "radioBtnNormal"), for: UIControlState.normal)
        
        self.nameLabel = UILabel()
        self.contentView.addSubview(nameLabel!)
        
        self.iconImageView?.translatesAutoresizingMaskIntoConstraints = false
        self.radioBtn?.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        self.addYCenterConstraintForView(iconImageView!)
        self.addYCenterConstraintForView(radioBtn!)
        self.addYCenterConstraintForView(nameLabel!)
        
        addWidthAndHeightConstraintForView(radioBtn!,width: 30,height: 30)
        addWidthAndHeightConstraintForView(iconImageView!, width: 40, height: 40)
        
        let constraint1:NSLayoutConstraint = NSLayoutConstraint(item:radioBtn!, attribute: .left, relatedBy: .equal, toItem:self.contentView, attribute: .left, multiplier:1.0, constant:10)
        let constraint2:NSLayoutConstraint = NSLayoutConstraint(item:iconImageView!, attribute: .left, relatedBy: .equal, toItem:radioBtn!, attribute: .right, multiplier:1.0, constant:10)
        let constraint3:NSLayoutConstraint = NSLayoutConstraint(item:nameLabel!, attribute: .left, relatedBy: .equal, toItem:iconImageView!, attribute: .right, multiplier:1.0, constant:10)
        let constraint4:NSLayoutConstraint = NSLayoutConstraint(item:nameLabel!, attribute: .right, relatedBy: .equal, toItem:self.contentView, attribute: .right, multiplier:1.0, constant:-10)
        
        self.contentView.addConstraint(constraint1);
        self.contentView.addConstraint(constraint2);
        self.contentView.addConstraint(constraint3);
        self.contentView.addConstraint(constraint4);
        
        
        radioBtn!.addTarget(self, action: #selector(buttonTapped(sender:)), for: UIControlEvents.touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addYCenterConstraintForView(_ view: UIView) {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item: view, attribute: .centerY, relatedBy: .equal,
            toItem: self.contentView, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        self.contentView.addConstraint(constraint)
    }
    
    func addWidthAndHeightConstraintForView(_ view: UIView, width: CGFloat, height: CGFloat) {
        let width:NSLayoutConstraint = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.width, relatedBy:NSLayoutRelation.equal, toItem:nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier:0.0, constant:width)
        self.contentView.addConstraint(width)
        
        let height:NSLayoutConstraint = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.height, relatedBy:NSLayoutRelation.equal, toItem:nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier:0.0, constant:height)
        self.contentView.addConstraint(height)
    }
    
    func buttonTapped(sender: UIButton) {
        var customerNum:Int = 0
        if (sender.isSelected){
            sender.isSelected = false
            sender.setImage(UIImage.init(named: "radioBtnNormal"), for: UIControlState.normal)
            customerNum = -1
        }
        else{
            sender.isSelected = true
            sender.setImage(UIImage.init(named: "radioBtnSelect"), for: UIControlState.normal)
            customerNum = 1
        }
    
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "customerCount"), object: customerNum)
    }
    
    func initListData(imageUrl: String, name: String){
        iconImageView?.image = UIImage.init(named: imageUrl)
        nameLabel?.text = name
    }
}
