//
//  MatchListViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/20.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit

class MatchListViewController : UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    let innerClothImageArray:[String] = ["inCloth1","inCloth2","inCloth3","inCloth4","inCloth5","inCloth6"]
    let outterClothImageArray:[String] = ["outCloth1","outCloth2","outCloth3","outCloth4","outCloth5","outCloth6"]
    let trouserImageArray:[String] = ["trouserImage1","trouserImage2","trouserImage3","trouserImage4","trouserImage5","trouserImage6"]
    let customerName:[String] = ["郭智","江河湖","李开基","胡凯凯","何志文","杰克鲍尔","茅子俊","葛民辉","杰克·昆卡","杰森·贝尔","莱昂·杰可逊","野狼","杰·凯","赛尔顿·梅罗","伊丽莎·杜什库","泰格·伍兹","黄诗杰","露茜·彭奇","艾莉·古尔丁","泰瑞斯·吉布森","张赫"]
    let priceArray:[String] = ["¥56","¥563","¥321","¥123","¥178","¥432","¥678","¥864","¥239","¥757","¥890","¥831","¥886","¥790","¥991","¥965","¥199","¥132","¥131","¥12","¥299","¥399","¥599","¥987","¥996","¥796","¥998","¥171","¥155"]
    let titleArray:[String] = ["商务男士套头衫","商务男士衬衫"]
    let trouserTitleArray:[String] = ["商务男士休闲库","商务男士西裤"]
    
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
        self.getRandomDataToGarmentList(tag: 0)
        matchCollectionView.register(MatchListCell.self, forCellWithReuseIdentifier:"cell")
        
        matchCollectionView.delegate = self;
        matchCollectionView.dataSource = self;
        
        clothLayer.frame = CGRect.init(x: 0, y:0, width: 100, height: 240)
        clothLayer.contentMode = UIViewContentMode.scaleAspectFit
        outClothLayer.frame = CGRect.init(x: 0, y: 0, width: 100, height: 240)
        outClothLayer.contentMode = UIViewContentMode.scaleAspectFit
        trousersLayer.frame = CGRect.init(x: 0, y: 50, width: 100, height: 240)
        trousersLayer.contentMode = UIViewContentMode.scaleAspectFit
        modelView.addSubview(clothLayer)
        modelView.addSubview(trousersLayer)
        modelView.addSubview(outClothLayer)
        
        
        bgPanel = UIView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight))
        contentPanel = UIView.init(frame: CGRect.init(x: 0, y: 20 + (self.navigationController?.navigationBar.bounds.height)!, width: screenWidth, height: screenHeight))
        bgPanel?.backgroundColor = UIColor.darkGray
        bgPanel?.alpha = 0.6
        self.view.addSubview(bgPanel!)
        contentPanel?.backgroundColor = UIColor.clear
        modelView1 = ModelView.init(frame: CGRect.init(x:screenWidth/2 - (screenWidth - 40)/4, y: 15, width:(screenWidth - 40)/2, height:(screenHeight - 30)/2))
        
        let tapGesture1:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tapGestureClick(sender:)))
        let tapGesture2:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tapGestureClick(sender:)))
        let tapGesture3:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tapGestureClick(sender:)))
        let tapGesture4:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tapGestureClick(sender:)))
        
        modelView2 = ModelView.init(frame: CGRect.init(x: 10, y: (screenHeight - 30)/2 + 25, width: (screenWidth - 50) / 4, height: (screenHeight - 30)/4))
        modelView2?.tag = 1
        modelView2?.isUserInteractionEnabled = true
        modelView2?.addGestureRecognizer(tapGesture1)
        
        modelView3 = ModelView.init(frame: CGRect.init(x: (screenWidth - 50) / 4 + 20, y: (screenHeight - 30)/2 + 25, width: (screenWidth - 50) / 4, height: (screenHeight - 30)/4))
        modelView3?.tag = 2
        modelView3?.addGestureRecognizer(tapGesture2)
        modelView3?.isUserInteractionEnabled = true
        modelView4 = ModelView.init(frame: CGRect.init(x: (screenWidth - 50) / 4 * 2 + 30, y: (screenHeight - 30)/2 + 25, width: (screenWidth - 50) / 4, height: (screenHeight - 30)/4))
        modelView4?.tag = 3
        modelView4?.isUserInteractionEnabled = true
        modelView4?.addGestureRecognizer(tapGesture3)
        modelView5 = ModelView.init(frame: CGRect.init(x: (screenWidth - 50) / 4 * 3 + 40, y: (screenHeight - 30)/2 + 25, width: (screenWidth - 50) / 4, height: (screenHeight - 30)/4))
        modelView5?.tag = 4
        modelView5?.isUserInteractionEnabled = true
        modelView5?.addGestureRecognizer(tapGesture4)
        
        modelView1?.backgroundColor = UIColor.white
        modelView2?.backgroundColor = UIColor.white
        modelView3?.backgroundColor = UIColor.white
        modelView4?.backgroundColor = UIColor.white
        modelView5?.backgroundColor = UIColor.white
        
        contentPanel?.addSubview(modelView1!)
        contentPanel?.addSubview(modelView2!)
        contentPanel?.addSubview(modelView3!)
        contentPanel?.addSubview(modelView4!)
        contentPanel?.addSubview(modelView5!)
        
        let cancelBtn:UIButton = UIButton.init(frame: CGRect.init(x: screenWidth/2 - 120 , y: screenHeight - 130, width: 100, height: 40))
        cancelBtn.setTitle("取消", for: UIControlState.normal)
        cancelBtn.backgroundColor = UIColor.darkGray
        cancelBtn.layer.cornerRadius = 8
        cancelBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        cancelBtn.addTarget(self, action: #selector(cancelBtnClick(sender:)), for: UIControlEvents.touchUpInside)
        let postBtn:UIButton = UIButton.init(frame: CGRect.init(x: screenWidth/2 + 20, y: screenHeight - 130, width: 100, height: 40))
        postBtn.setTitle("确定", for: UIControlState.normal)
        postBtn.backgroundColor = UIColor.darkGray
        postBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        postBtn.layer.cornerRadius = 8
        postBtn.addTarget(self, action: #selector(postBtnClick(sender:)), for: UIControlEvents.touchUpInside)
        contentPanel?.addSubview(cancelBtn)
        contentPanel?.addSubview(postBtn)
        
        self.view.addSubview(contentPanel!)
        
        bgPanel?.isHidden = true
        contentPanel?.isHidden = true
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
            inClothPath = modelImgName.appending("_f")
            clothLayer.image = UIImage.init(named: inClothPath!)
        }
        else if garmentType == 1{
            outClothPath = modelImgName.appending("_f")
            outClothLayer.image = UIImage.init(named: outClothPath!)
        }
        else if garmentType == 2{
            trouserPath = modelImgName.appending("_f")
            trousersLayer.image = UIImage.init(named: modelImgName)!
        }
    }

    
    //返回多少个组
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
        
        cell.imgView?.image = UIImage.init(named: (garmentModel?.imageName)!)
        cell.imgName = garmentModel?.imageName
        cell.layer.borderWidth = 0.3
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.titleLabel!.text = garmentModel?.title
        cell.priceLabel!.text = garmentModel?.price
        cell.customerLabel1?.text = garmentModel?.customerName1
        cell.customerLabel2?.text = garmentModel?.customerName2
        cell.customerLabel3?.text = garmentModel?.customerName3
        cell.customerLabel4?.text = garmentModel?.customerName4
        cell.customerLabel5?.text = garmentModel?.customerName5
        cell.customerLabel6?.text = garmentModel?.customerName6
        return cell
    }
    
    //返回cell 上下左右的间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(5, 5, 5, 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.bounds.width*0.47, height: collectionView.bounds.height/2 - 15)
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
        hud.label.text = "保存中..."
        hud.hide(animated: true, afterDelay: 0.8)
 
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
        
        if bgPanel!.isHidden{
            bgPanel?.isHidden = false
            contentPanel?.isHidden = false
            
            modelView1?.initImage(outImg: outClothPath!, inImg: inClothPath!, trouserImg: trouserPath!,label: "")
            modelView2?.initImage(outImg: "", inImg: "", trouserImg: "",label: "A")
            modelView3?.initImage(outImg: "", inImg: "", trouserImg: "",label: "B")
            modelView4?.initImage(outImg: "", inImg: "", trouserImg: "",label: "C")
            modelView5?.initImage(outImg: "", inImg: "", trouserImg: "",label: "D")
        }
        else{
            bgPanel?.isHidden = true
            contentPanel?.isHidden = true
        }
        
    }
    
    func cancelBtnClick(sender:UIButton){
        if !bgPanel!.isHidden{
            bgPanel?.isHidden = true
            contentPanel?.isHidden = true
        }
    }
    
    func postBtnClick(sender:UIButton){
        let image:[String] = imgName.components(separatedBy: "|")
        print(image.count)
        if image.count != 4{
            let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
            hud.label.text = "服装未选全"
            hud.hide(animated: true, afterDelay: 0.8)
        }
        else{
            imgName.append(String(modelSequenceNum))
            let time: TimeInterval = 1.0
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
                self.navigationController?.popViewController(animated: true)
            }
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "BigModelMatch"), object: imgName)
        }
        
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
        self.getRandomDataToGarmentList(tag: 0)
        matchCollectionView.reloadData()
    }
    
    @IBAction func outterClothBtn(_ sender: Any) {
        outterClothBtn.setBackgroundImage(UIImage.init(named: "selectedBtn"), for: UIControlState.normal)
        innerClothBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        bottomClothBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        garmentType = 1
        self.getRandomDataToGarmentList(tag: 1)
        matchCollectionView.reloadData()
    }
    
    @IBAction func bottomClothBtn(_ sender: Any) {
        bottomClothBtn.setBackgroundImage(UIImage.init(named: "selectedBtn"), for: UIControlState.normal)
        innerClothBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        outterClothBtn.setBackgroundImage(UIImage.init(named: "normalBtn"), for: UIControlState.normal)
        garmentType = 2
        self.getRandomDataToGarmentList(tag: 2)
        matchCollectionView.reloadData()
    }
    
    func getRandomDataToGarmentList(tag:Int){
        if tag == 0{
            for _ in 1...10{
                let title:String = titleArray[Int(arc4random_uniform(UInt32(titleArray.count)))]
                let imageName:String = innerClothImageArray[Int(arc4random_uniform(UInt32(innerClothImageArray.count)))]
                let price:String = priceArray[Int(arc4random_uniform(UInt32(priceArray.count)))]
                let customerName1:String = customerName[Int(arc4random_uniform(UInt32(customerName.count)))]
                let customerName2:String = customerName[Int(arc4random_uniform(UInt32(customerName.count)))]
                let customerName3:String = customerName[Int(arc4random_uniform(UInt32(customerName.count)))]
                let customerName4:String = customerName[Int(arc4random_uniform(UInt32(customerName.count)))]
                let customerName5:String = customerName[Int(arc4random_uniform(UInt32(customerName.count)))]
                let customerName6:String = customerName[Int(arc4random_uniform(UInt32(customerName.count)))]
                
                let dic = ["title":title,"price":price,"imageName":imageName,"customerName1":customerName1,"customerName2":customerName2,"customerName3":customerName3,"customerName4":customerName4,"customerName5":customerName5,"customerName6":customerName6] as [String : Any]
                let garment:GarmentModel = GarmentModel.init(dic: dic)
                
                innerClothList.append(garment)
            }
        }
        else if (tag == 1){
            for _ in 1...10{
                let title:String = titleArray[Int(arc4random_uniform(UInt32(titleArray.count)))]
                let imageName:String = outterClothImageArray[Int(arc4random_uniform(UInt32(outterClothImageArray.count)))]
                let price:String = priceArray[Int(arc4random_uniform(UInt32(priceArray.count)))]
                let customerName1:String = customerName[Int(arc4random_uniform(UInt32(customerName.count)))]
                let customerName2:String = customerName[Int(arc4random_uniform(UInt32(customerName.count)))]
                let customerName3:String = customerName[Int(arc4random_uniform(UInt32(customerName.count)))]
                let customerName4:String = customerName[Int(arc4random_uniform(UInt32(customerName.count)))]
                let customerName5:String = customerName[Int(arc4random_uniform(UInt32(customerName.count)))]
                let customerName6:String = customerName[Int(arc4random_uniform(UInt32(customerName.count)))]
                
                let dic = ["title":title,"price":price,"imageName":imageName,"customerName1":customerName1,"customerName2":customerName2,"customerName3":customerName3,"customerName4":customerName4,"customerName5":customerName5,"customerName6":customerName6] as [String : Any]
                let garment:GarmentModel = GarmentModel.init(dic: dic)
                
                outterClothList.append(garment)
            }
        }
        else if (tag == 2){
            for _ in 1...10{
                let title:String = trouserTitleArray[Int(arc4random_uniform(UInt32(trouserTitleArray.count)))]
                let imageName:String = trouserImageArray[Int(arc4random_uniform(UInt32(trouserImageArray.count)))]
                let price:String = priceArray[Int(arc4random_uniform(UInt32(priceArray.count)))]
                let customerName1:String = customerName[Int(arc4random_uniform(UInt32(customerName.count)))]
                let customerName2:String = customerName[Int(arc4random_uniform(UInt32(customerName.count)))]
                let customerName3:String = customerName[Int(arc4random_uniform(UInt32(customerName.count)))]
                let customerName4:String = customerName[Int(arc4random_uniform(UInt32(customerName.count)))]
                let customerName5:String = customerName[Int(arc4random_uniform(UInt32(customerName.count)))]
                let customerName6:String = customerName[Int(arc4random_uniform(UInt32(customerName.count)))]
                
                let dic = ["title":title,"price":price,"imageName":imageName,"customerName1":customerName1,"customerName2":customerName2,"customerName3":customerName3,"customerName4":customerName4,"customerName5":customerName5,"customerName6":customerName6] as [String : Any]
                let garment:GarmentModel = GarmentModel.init(dic: dic)
                
                trouserClothList.append(garment)
            }
        }
        
        
    }
}
