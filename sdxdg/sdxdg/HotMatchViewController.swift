//
//  HotMatchViewController.swift
//  sdxdg
//
//  Created by lotusprize on 17/1/4.
//  Copyright © 2017年 geekTeam. All rights reserved.
//


import UIKit

class HotMatchViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionView: UICollectionView!
    
    let clothIconArray:[String] = ["four1","four2","four3","four4"]
    let width = UIScreen.main.bounds.size.width//获取屏幕宽
    let height = UIScreen.main.bounds.size.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(HotMatchCell.self, forCellWithReuseIdentifier:"cell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:HotMatchCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! HotMatchCell
        let clothIconRandomNum:Int = Int(arc4random_uniform(UInt32(4)))
        cell.initImageView(imgView: clothIconArray[clothIconRandomNum], heartCount: 66)
        print(indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 36
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(10, 5, 5, 10)
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: (width - 30)/2, height: (height/2 + 15))
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

