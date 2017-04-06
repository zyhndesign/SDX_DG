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
    
    var inClothPath:String?
    var outClothPath:String?
    var trouserPath:String?
    
    var garmentType:Int = 0
    
    var bgPanel:UIView?
    var contentPanel:UIView?
    
    var modelView1:ModelView?
    var modelView2:ModelView?
    var modelView3:ModelView?
    var modelView4:ModelView?
    var modelView5:ModelView?
    var imgName:String = ""
    var modelSequenceNum:Int = 0
    
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
        
        
        loadCostumeData(category: 0,limit: 10,offset: 0)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector:#selector(self.updateMatchModel(notifaction:)), name: NSNotification.Name(rawValue: "modelMatch"), object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("disppear...")
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateMatchModel(notifaction: NSNotification){
        let modelImgName:String = (notifaction.object as? String)!
        print(modelImgName)
        
        if garmentType == 0{
            clothLayer.af_setImage(withURL: URL.init(string: modelImgName)!)
        }
        else if garmentType == 1{
            outClothLayer.af_setImage(withURL: URL.init(string: modelImgName)!)
        }
        else if garmentType == 2{
            trousersLayer.af_setImage(withURL: URL.init(string: modelImgName)!)
        }
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
        
        cell.frontImgName = garmentModel?.imageUrl1
        
        cell.imgView?.af_setImage(withURL: URL.init(string: (garmentModel?.imageUrl3)!)!)
        
        cell.layer.borderWidth = 0.3
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.titleLabel!.text = garmentModel?.hpName
        cell.priceLabel!.text = garmentModel?.price
        
        return cell
    }
    
    //返回cell 上下左右的间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(5, 5, 5, 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: (screenWidth - 30)/2, height: screenHeight / 2 - 58)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(indexPath.row)
        
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
        
        /*
        if let cloth = inClothPath{
            imgName.append(cloth)
            imgName.append("|")
        }
        else{
            hud.label.text = "内搭未选择"
            hud.hide(animated: true, afterDelay: 0.8)
            return
        }
        if let cloth = outClothPath{
            imgName.append(cloth)
            imgName.append("|")
        }
        else{
            hud.label.text = "外套未选择"
            hud.hide(animated: true, afterDelay: 0.8)
            return
        }
        if let cloth = trouserPath{
            imgName.append(cloth)
            imgName.append("|")
        }
        else{
            hud.label.text = "裤子未选择"
            hud.hide(animated: true, afterDelay: 0.8)
            return
        }
        */
        //保存模型图片
        
        let modelImage:UIImage = modelView.image!
        let clothLayerImage:UIImage = clothLayer.image!
        let trousersLayerImage:UIImage = trousersLayer.image!
        let outClothLayerImage:UIImage = outClothLayer.image!
        let size:CGSize = self.modelView.frame.size;
        
        UIGraphicsBeginImageContext(size);
        UIColor.white.setFill()
        modelImage.draw(in: CGRect.init(x: 0, y: 0, width: size.width, height: size.height))
        clothLayerImage.draw(in: CGRect.init(x: 0, y: 0, width: size.width, height: size.height))
        trousersLayerImage.draw(in: CGRect.init(x: 0, y: 0, width: size.width, height: size.height))
        outClothLayerImage.draw(in: CGRect.init(x: 0, y: 0, width: size.width, height: size.height))
        
        let resultingImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        Alamofire.request(ConstantsUtil.APP_QINIU_TOKEN).responseJSON { (response) in
            
            if let data = response.result.value {
                let responseResult = JSON(data)
                
                let resultCode = responseResult["resultCode"].intValue
                print(resultCode)
                if resultCode == 200{
                    let token = responseResult["uptoken"].string!
                    print(token)
                    
                    self.upLoadImageRequest(urlString: ConstantsUtil.APP_QINIU_UPLOAD_URL, params: ["token" : token], data:UIImagePNGRepresentation(resultingImage)!, success: { (success) in
                        
                    }, failture: { (error) in
                        
                    })
                }
            }
            
        }
    }
    
    
    func postBtnClick(sender:UIButton){
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        let image:[String] = imgName.components(separatedBy: "|")
        
        if image.count != 4{
            hud.label.text = "服装未选全"
        }
        else{
            hud.label.text = "处理中..."
            imgName.append(String(modelSequenceNum))
            let time: TimeInterval = 1.0
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
                self.navigationController?.popViewController(animated: true)
            }
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "BigModelMatch"), object: imgName)
        }
        hud.hide(animated: true, afterDelay: 0.8)
    }
    
    func tapGestureClick(sender:UITapGestureRecognizer){
        let modelView:ModelView = sender.view as! ModelView
        modelSequenceNum = modelView.tag
        
        if (modelView.tag == 1){
            modelView2?.initImage(outImg: outClothPath!, inImg: inClothPath!, trouserImg: trouserPath!,label: "A")
            modelView3?.clearModel()
            modelView4?.clearModel()
            modelView5?.clearModel()
        }
        else if (modelView.tag == 2){
            modelView3?.initImage(outImg: outClothPath!, inImg: inClothPath!, trouserImg: trouserPath!,label: "B")
            modelView2?.clearModel()
            modelView4?.clearModel()
            modelView5?.clearModel()
        }
        else if (modelView.tag == 3){
            modelView4?.initImage(outImg: outClothPath!, inImg: inClothPath!, trouserImg: trouserPath!,label: "C")
            modelView2?.clearModel()
            modelView3?.clearModel()
            modelView5?.clearModel()
        }
        else if (modelView.tag == 4){
            modelView5?.initImage(outImg: outClothPath!, inImg: inClothPath!, trouserImg: trouserPath!,label: "D")
            modelView3?.clearModel()
            modelView4?.clearModel()
            modelView2?.clearModel()
        }
    }
    
    @IBAction func innerClothBtn(_ sender: Any) {
        innerClothBtn.setBackgroundImage(UIImage.init(named: "selectedBtn"), for: UIControlState.normal)
        outterClothBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        bottomClothBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        garmentType = 0
        loadCostumeData(category: 0,limit: 10,offset: 0)
        
        matchCollectionView.reloadData()
    }
    
    @IBAction func outterClothBtn(_ sender: Any) {
        outterClothBtn.setBackgroundImage(UIImage.init(named: "selectedBtn"), for: UIControlState.normal)
        innerClothBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        bottomClothBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        garmentType = 1
        loadCostumeData(category: 1,limit: 10,offset: 0)
        matchCollectionView.reloadData()
    }
    
    @IBAction func bottomClothBtn(_ sender: Any) {
        bottomClothBtn.setBackgroundImage(UIImage.init(named: "selectedBtn"), for: UIControlState.normal)
        innerClothBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        outterClothBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        garmentType = 2
        loadCostumeData(category: 2,limit: 10,offset: 0)
        matchCollectionView.reloadData()
    }
    
    func loadCostumeData(category:Int, limit:Int, offset:Int){
        print("loading data.......")
        let parameters:Parameters = ["categoryId":category,"limit":limit,"offset":offset]
        
        Alamofire.request(ConstantsUtil.APP_MATCH_LIST_BY_CATEGORY,method:.get,parameters:parameters).responseObject { (response: DataResponse<GarmentDataResultModel>) in
            
            let garmentResponse = response.result.value
            
            if (garmentResponse?.resultCode == 200){
                if (category == 0){
                    if let garmentModelList = garmentResponse?.object {
                        for garmentModel in garmentModelList{
                            self.innerClothList.append(garmentModel)
                        }
                    }
                }
                else if (category == 1){
                    if let garmentModelList = garmentResponse?.object {
                        for garmentModel in garmentModelList{
                            self.outterClothList.append(garmentModel)
                        }
                    }
                }
                else if (category == 2){
                    if let garmentModelList = garmentResponse?.object {
                        for garmentModel in garmentModelList{
                            self.trouserClothList.append(garmentModel)
                        }
                    }
                }
                self.matchCollectionView.reloadData()
            }
            
        }
        
        
    }
    
    
    func upLoadImageRequest(urlString : String, params:[String:String], data: Data,success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()){
        
        let headers = ["content-type":"multipart/form-data"]
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                let flag = params["token"]
                let filename = (UIDevice.current.identifierForVendor?.uuidString)!
                multipartFormData.append((flag?.data(using: String.Encoding.utf8)!)!, withName: "token")
                multipartFormData.append(data, withName: "file", fileName: filename, mimeType: "image/png")
                
        },
            to: urlString,
            headers: headers,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        if let value = response.result.value as? [String: AnyObject]{
                            
                            let json = JSON(value)
                            print(json)
                            
                        }
                    }
                case .failure(let encodingError):
                    failture(encodingError)
                }
        }
        )
    }

}
