//
//  MatchListViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/20.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON
import AlamofireObjectMapper

class MatchListViewController : UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var innerClothList:[GarmentModel] = []
    var outterClothList:[GarmentModel] = []
    var trouserClothList:[GarmentModel] = []
    
    @IBOutlet var innerClothBtn: UIButton!
    @IBOutlet var outterClothBtn: UIButton!
    @IBOutlet var bottomClothBtn: UIButton!
    
    @IBOutlet var matchCollectionView: UICollectionView!
    
    @IBOutlet var modelView: UIImageView!
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    let clothLayer:UIImageView = UIImageView();
    let trousersLayer:UIImageView = UIImageView();
    let outClothLayer:UIImageView = UIImageView();
    
    var inClothObject:GarmentModel?
    var outClothObject:GarmentModel?
    var trouserObject:GarmentModel?
    
    var garmentType:Int = 0
    
    var selectGarmentModelList:[GarmentModel] = []
    
    let refresh = UIRefreshControl.init()
    let pageLimit:Int = 10
    var inClothPageNum:Int = 0
    var outClotPageNum:Int = 0
    var trouserPageNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        matchCollectionView.register(MatchListCell.self, forCellWithReuseIdentifier:"cell")
        
        matchCollectionView.delegate = self;
        matchCollectionView.dataSource = self;
        
        clothLayer.frame = CGRect.init(x: 0, y:0, width: 100, height: 240)
        clothLayer.contentMode = UIViewContentMode.scaleAspectFit
        outClothLayer.frame = CGRect.init(x: 0, y: 0, width: 100, height: 240)
        outClothLayer.contentMode = UIViewContentMode.scaleAspectFit
        trousersLayer.frame = CGRect.init(x: 0, y: 00, width: 100, height: 240)
        trousersLayer.contentMode = UIViewContentMode.scaleAspectFit
        modelView.addSubview(clothLayer)
        modelView.addSubview(trousersLayer)
        modelView.addSubview(outClothLayer)
        
        refresh.backgroundColor = UIColor.white
        refresh.tintColor = UIColor.lightGray
        refresh.attributedTitle = NSAttributedString(string:"下拉刷新")
        refresh.addTarget(self, action: #selector(refreshLoadingData), for: UIControlEvents.valueChanged)
        self.matchCollectionView.addSubview(refresh)
        
        loadCostumeData(category: 0,limit: 10,offset: 0)
        
        NotificationCenter.default.addObserver(self, selector:#selector(self.updateMatchModel(notifaction:)), name: NSNotification.Name(rawValue: "modelMatch"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector:#selector(self.filterMatch(notifaction:)), name: NSNotification.Name(rawValue: "filterMatch"), object: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("disppear...")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear...")
    }
    
    func refreshLoadingData(){
        if garmentType == 0{
            loadCostumeData(category: 0,limit: pageLimit,offset: pageLimit * inClothPageNum)
        }
        else if garmentType == 1{
            loadCostumeData(category: 1,limit: pageLimit,offset: pageLimit * outClotPageNum)
        }
        else if garmentType == 2{
            loadCostumeData(category: 2,limit: pageLimit,offset: pageLimit * trouserPageNum)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        NotificationCenter.default.removeObserver(self)
    }

    func updateMatchModel(notifaction: NSNotification){
        let garmentModel:GarmentModel = (notifaction.object as? GarmentModel)!
        if garmentType == 0{
            clothLayer.af_setImage(withURL: URL.init(string: garmentModel.imageUrl1!)!)
            inClothObject = garmentModel
        }
        else if garmentType == 1{
            outClothLayer.af_setImage(withURL: URL.init(string: garmentModel.imageUrl1!)!)
            outClothObject = garmentModel
            
        }
        else if garmentType == 2{
            trousersLayer.af_setImage(withURL: URL.init(string: garmentModel.imageUrl1!)!)
            trouserObject = garmentModel
        }
    }

    func filterMatch(notifaction: NSNotification){
        let garmentDataResultModel:GarmentDataResultModel = (notifaction.object as? GarmentDataResultModel)!
        if garmentDataResultModel.resultCode == 1{ //内搭
            self.innerClothList.removeAll()
            let list:[GarmentModel] = garmentDataResultModel.object!
            for garmentModel in list{
                self.innerClothList.append(garmentModel)
            }
            self.innerClothSelect()
        }
        else if garmentDataResultModel.resultCode == 2{ //外套
            self.outterClothList.removeAll()
            let list:[GarmentModel] = garmentDataResultModel.object!
            for garmentModel in list{
                self.outterClothList.append(garmentModel)
            }
            self.outterClothSelect()
        }
        else if garmentDataResultModel.resultCode == 3{ //下装
            self.trouserClothList.removeAll()
            let list:[GarmentModel] = garmentDataResultModel.object!
            for garmentModel in list{
                self.trouserClothList.append(garmentModel)
            }
            self.bottomClothSelect()
        }
        
        self.matchCollectionView.reloadData()
    }
    
    //返回多少个组马春
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //返回多少个cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if garmentType == 0{
            return innerClothList.count
        }
        else if garmentType == 1{
            return outterClothList.count
        }
        else if garmentType == 2{
            return trouserClothList.count
        }
        return 0
    }
    //返回自定义的cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! MatchListCell
        var garmentModel:GarmentModel?
        if garmentType == 0{
            garmentModel = innerClothList[indexPath.row]
        }
        else if garmentType == 1{
            garmentModel = outterClothList[indexPath.row]
        }
        else if garmentType == 2{
            garmentModel = trouserClothList[indexPath.row]
        }
        
        cell.imgView?.af_setImage(withURL: URL.init(string: (garmentModel?.imageUrl3)!)!)
        
        cell.layer.borderWidth = 0.3
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.titleLabel!.text = garmentModel?.hpName
        cell.priceLabel!.text = garmentModel?.price
        cell.garmentModel = garmentModel
        cell.backgroundColor = UIColor.white
        return cell
    }
    
    //返回cell 上下左右的间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(5, 5, 5, 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: (screenWidth - 30)/2, height: screenHeight / 2 - 110)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "MerchandiseDetailView")
        self.navigationController?.pushViewController(view!, animated: true)
    }
    
    @IBAction func filterBtnClick(_ sender: Any) {
        //self.dismiss(animated: true, completion: {() -> Void in ( print("complete"))})
        //self.performSegue(withIdentifier: "filterView", sender: self)
        let view = self.storyboard?.instantiateViewController(withIdentifier: "filterView")
        self.navigationController?.pushViewController(view!, animated: true)
    }
    
    @IBAction func saveBtnClick(_ sender: Any) {
        
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "处理中..."
        hud.hide(animated: true, afterDelay: 0.8)
        
        
        if let cloth = inClothObject{
            selectGarmentModelList.append(cloth)
        }
        else{
            hud.label.text = "内搭未选择"
            hud.hide(animated: true, afterDelay: 0.8)
            return
        }
        if let cloth = outClothObject{
            selectGarmentModelList.append(cloth)
        }
        else{
            hud.label.text = "外套未选择"
            hud.hide(animated: true, afterDelay: 0.8)
            return
        }
        if let cloth = trouserObject{
            selectGarmentModelList.append(cloth)
        }
        else{
            hud.label.text = "裤子未选择"
            hud.hide(animated: true, afterDelay: 0.8)
            return
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "BigModelMatch"), object: selectGarmentModelList)
        
        let time: TimeInterval = 1.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    @IBAction func innerClothBtn(_ sender: Any) {
        self.innerClothSelect()
        loadCostumeData(category: 0,limit: 10,offset: 0)
        
        matchCollectionView.reloadData()
    }
    
    @IBAction func outterClothBtn(_ sender: Any) {
        self.outterClothSelect()
        loadCostumeData(category: 1,limit: 10,offset: 0)
        matchCollectionView.reloadData()
    }
    
    @IBAction func bottomClothBtn(_ sender: Any) {
        self.bottomClothSelect()
        loadCostumeData(category: 2,limit: 10,offset: 0)
        matchCollectionView.reloadData()
    }
    
    func innerClothSelect(){
        innerClothBtn.setBackgroundImage(UIImage.init(named: "selectedBtn"), for: UIControlState.normal)
        outterClothBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        bottomClothBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        garmentType = 0
    }
    
    func outterClothSelect(){
        outterClothBtn.setBackgroundImage(UIImage.init(named: "selectedBtn"), for: UIControlState.normal)
        innerClothBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        bottomClothBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        garmentType = 1
    }
    
    func bottomClothSelect(){
        bottomClothBtn.setBackgroundImage(UIImage.init(named: "selectedBtn"), for: UIControlState.normal)
        innerClothBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        outterClothBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        garmentType = 2
    }
    
    func loadCostumeData(category:Int, limit:Int, offset:Int){
        print("loading data.......")
        let parameters:Parameters = ["categoryId":category,"limit":limit,"offset":offset]
        
        Alamofire.request(ConstantsUtil.APP_MATCH_LIST_BY_CATEGORY,method:.get, parameters:parameters).responseObject { (response: DataResponse<GarmentDataResultModel>) in
            
            let garmentResponse = response.result.value
            
            if (garmentResponse?.resultCode == 200){
                if (category == 0){
                    if let garmentModelList = garmentResponse?.object {
                        for garmentModel in garmentModelList{
                            self.innerClothList.insert(garmentModel, at: 0)
                            self.inClothPageNum = self.inClothPageNum + 1
                        }
                    }
                }
                else if (category == 1){
                    if let garmentModelList = garmentResponse?.object {
                        for garmentModel in garmentModelList{
                            self.outterClothList.insert(garmentModel, at: 0)
                            self.outClotPageNum = self.outClotPageNum + 1
                        }
                    }
                }
                else if (category == 2){
                    if let garmentModelList = garmentResponse?.object {
                        for garmentModel in garmentModelList{
                            self.trouserClothList.insert(garmentModel, at: 0)
                            self.trouserPageNum = self.trouserPageNum + 1
                        }
                    }
                }
                self.matchCollectionView.reloadData()
                self.refresh.endRefreshing()
            }
        }
    }
}
