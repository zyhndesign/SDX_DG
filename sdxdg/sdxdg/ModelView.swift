//
//  ModelView.swift
//  sdxdg
//
//  Created by lotusprize on 17/1/11.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import UIKit
import AlamofireImage

class ModelView: UIView {
    
    var modelImg:UIImageView?
    var outImg:UIImageView?
    var inImg:UIImageView?
    var trouserImg:UIImageView?
    var labelLayer:CATextLayer?
    var labelBg:CALayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        modelImg = UIImageView.init()
        modelImg?.contentMode = UIViewContentMode.scaleAspectFit
        modelImg?.image = UIImage.init(named: "model")
        
        outImg = UIImageView.init()
        outImg?.contentMode = UIViewContentMode.scaleAspectFit
        
        inImg = UIImageView.init()
        inImg?.contentMode = UIViewContentMode.scaleAspectFit
        
        trouserImg = UIImageView.init()
        trouserImg?.contentMode = UIViewContentMode.scaleAspectFit
        
        self.addSubview(modelImg!)
        self.addSubview(inImg!)
        self.addSubview(trouserImg!)
        self.addSubview(outImg!)
        
        labelLayer = CATextLayer.init()
        labelLayer?.alignmentMode = kCAAlignmentLeft
        labelLayer?.fontSize = 12
        labelLayer?.foregroundColor = UIColor.darkGray.cgColor
        
        labelBg = CALayer.init()
        labelBg?.contents = UIImage.init(named: "triangle")?.cgImage
        self.layer.addSublayer(labelBg!)
        self.layer.addSublayer(labelLayer!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = self.bounds.size.width
        let height = self.bounds.size.height
        
        self.modelImg?.frame = CGRect.init(x: 0, y: 0, width: width, height: height)
        self.outImg?.frame = CGRect.init(x: 0, y: 0, width: width, height: height)
        self.inImg?.frame = CGRect.init(x: 0, y: 0, width: width, height: height)
        self.trouserImg?.frame = CGRect.init(x: 0, y: 0, width: width, height: height)
        
        self.labelLayer?.frame = CGRect.init(x: 5, y: 0, width: width/2 - 5, height: width/2 - 5)
        self.labelBg?.frame = CGRect.init(x: 0, y: 0, width: width/2 - 5, height: width/2 - 5)
    }
    
    func initImage(outImg:String, inImg:String, trouserImg:String,label:String){
        print(outImg)
        print(inImg)
        print(trouserImg)
        self.outImg?.af_setImage(withURL: URL.init(string: outImg)!)
        self.inImg?.af_setImage(withURL: URL.init(string: inImg)!)
        self.trouserImg?.af_setImage(withURL: URL.init(string: trouserImg)!)
        
        if label.characters.count > 0{
            self.labelLayer?.string = label
        }
        else{
            labelLayer?.isHidden = true
            labelBg?.isHidden = true
        }
    }
    
    func clearModel(){
        self.outImg?.image = UIImage.init()
        self.inImg?.image = UIImage.init()
        self.trouserImg?.image = UIImage.init()
    }
    
}
