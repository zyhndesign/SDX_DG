//
//  MatchViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/14.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit
import Spring

class MatchViewController: UIViewController {
    
    @IBOutlet var modelView: UIImageView!
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    var fourViewPanel:SpringView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let gesture:UIGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(imageTapped(sender:)))
        modelView.addGestureRecognizer(gesture)
        
        fourViewPanel = SpringView.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 44), size: CGSize.init(width: screenWidth, height: screenHeight)))
        fourViewPanel?.backgroundColor = UIColor.white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageTapped(sender: UIGestureRecognizer){
        let view = self.storyboard?.instantiateViewController(withIdentifier: "MatchCollectionView")
        self.present(view!, animated: true, completion: {() -> Void in (print("complete"))})
    }
    
    @IBAction func addClientBtnClick(_ sender: Any) {
        self.performSegue(withIdentifier: "CustomerListSegue", sender: self)
    }
    
    @IBAction func fourViewBtnClick(_ sender: UIButton) {
        
        print(sender.isSelected)
        if (sender.isSelected){
            sender.isSelected = false
            fourViewPanel?.removeFromSuperview()
            print("remove")
        }
        else{
            sender.isSelected = true
            
            let layer1:CALayer = CALayer()
            layer1.frame = CGRect.init(origin: CGPoint.init(x: 20, y: 0), size: CGSize.init(width: screenWidth/2 - 30, height: screenHeight/2 - 30))
            
            layer1.contents = UIImage.init(named: "four1")?.cgImage
            fourViewPanel?.layer.addSublayer(layer1)
            
            let layer2:CALayer = CALayer()
            layer2.frame = CGRect.init(origin: CGPoint.init(x: screenWidth/2 + 10, y: 0), size: CGSize.init(width: screenWidth/2 - 30, height: screenHeight/2 - 30))
            layer2.contents = UIImage.init(named: "four2")?.cgImage
            fourViewPanel?.layer.addSublayer(layer2)
            
            let layer3:CALayer = CALayer()
            layer3.frame = CGRect.init(origin: CGPoint.init(x: 20, y: screenHeight/2 - 50), size: CGSize.init(width: screenWidth/2 - 30, height: screenHeight/2 - 30))
            layer3.contents = UIImage.init(named: "four3")?.cgImage
            fourViewPanel?.layer.addSublayer(layer3)
            
            let layer4:CALayer = CALayer()
            layer4.frame = CGRect.init(origin: CGPoint.init(x: screenWidth/2 + 10, y: screenHeight/2 - 50), size: CGSize.init(width: screenWidth/2 - 30, height: screenHeight/2 - 30))
            layer4.contents = UIImage.init(named: "four4")?.cgImage
            fourViewPanel?.layer.addSublayer(layer4)
            self.view.addSubview(fourViewPanel!)
            fourViewPanel?.animation = "squeeze"
            fourViewPanel?.curve = "easeInOut"
            fourViewPanel?.duration = 2.0
            fourViewPanel?.animateToNext(completion: { () -> () in
                
            })
        }
    }
    
    @IBAction func moreBtnClick(_ sender: Any) {
        
    }

}
