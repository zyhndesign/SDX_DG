//
//  MatchListViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/20.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class MatchListViewController : UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    @IBOutlet var innerClothBtn: UIButton!
    @IBOutlet var outterClothBtn: UIButton!
    @IBOutlet var bottomClothBtn: UIButton!
    
    @IBOutlet var matchCollectionView: UICollectionView!
    
    
    let screenWidth = UIScreen.main.bounds.size.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(matchCollectionView)
        matchCollectionView.register(MatchListCell.self, forCellWithReuseIdentifier:"cell")
        
        matchCollectionView.delegate = self;
        matchCollectionView.dataSource = self;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //返回多少个组
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //返回多少个cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    //返回自定义的cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! MatchListCell
        
        cell.imgView?.image = UIImage.init(named: "inCloth1")
        cell.layer.borderWidth = 0.3;
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.titleLabel!.text = "商务男士套头衫"
        cell.priceLabel!.text = "￥131"
        cell.customerLabel1?.text = "郭智"
        cell.customerLabel2?.text = "江河湖"
        cell.customerLabel3?.text = "李开基"
        cell.customerLabel4?.text = "胡凯凯"
        cell.customerLabel5?.text = "何志文"
        cell.customerLabel6?.text = "杰克鲍尔"
        return cell
    }
    
    //返回cell 上下左右的间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(5, 5, 5, 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.bounds.width*0.47, height: collectionView.bounds.height/2 - 30)
    }
    
    
    @IBAction func filterBtnClick(_ sender: Any) {
        //self.dismiss(animated: true, completion: {() -> Void in ( print("complete"))})
        //self.performSegue(withIdentifier: "filterView", sender: self)
        let view = self.storyboard?.instantiateViewController(withIdentifier: "filterView")
        self.navigationController?.pushViewController(view!, animated: true)
    }
    
    @IBAction func saveBtnClick(_ sender: Any) {
        
    }
    
    
    @IBAction func innerClothBtn(_ sender: Any) {
        innerClothBtn.setBackgroundImage(UIImage.init(named: "selectedBtn"), for: UIControlState.normal)
        outterClothBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        bottomClothBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
    }
    
    @IBAction func outterClothBtn(_ sender: Any) {
        outterClothBtn.setBackgroundImage(UIImage.init(named: "selectedBtn"), for: UIControlState.normal)
        innerClothBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        bottomClothBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
    }
    
    @IBAction func bottomClothBtn(_ sender: Any) {
        bottomClothBtn.setBackgroundImage(UIImage.init(named: "selectedBtn"), for: UIControlState.normal)
        innerClothBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        outterClothBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
    }
    
}
