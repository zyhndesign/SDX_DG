//
//  MineViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/14.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import Charts

class MineViewController: UIViewController {
    
    @IBOutlet var userInfoPanel: UIView!
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var userName: UILabel!
    @IBOutlet var userIcon: UIImageView!
    
    
    let userId = LocalDataStorageUtil.getUserIdFromUserDefaults()
    
    var backDataIcon:UIImageView?
    var backDataLabel:UILabel?
    var timeSegmentControl:UISegmentedControl?
    var chartView:UIImageView?
    
    var myMatchViewIcon:UIImageView?
    var myMatchViewLabel:UILabel?
    var myMatchAllLabel:UILabel?
    var myMatchArrowImageView:UIImageView?
    
    var myMatchPushImageView:UIImageView?
    var myMatchPushLabel:UILabel?
    var myMatchFeedbackImageView:UIImageView?
    var myMatchFeedbackLabel:UILabel?
    var myMatchDraftImageView:UIImageView?
    var myMatchDraftLabel:UILabel?
    
    var hotMatchImageView:UIImageView?
    var hotMatchLabel:UILabel?
    var hotMatchALLLabel:UILabel?
    var hotMatchArrowImageView:UIImageView?
    
    var top3ImageView1:UIImageView?
    var top3ImageView2:UIImageView?
    var top3ImageView3:UIImageView?
    
    var feedbackModels:[FeedbackModel] = []
    
    let lineChart =  LineChartView()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let screenWidth:CGFloat = UIScreen.main.bounds.width
        //let screenHeight:CGFloat = UIScreen.main.bounds.height
        userName.text = LocalDataStorageUtil.getUserInfoByKey(key: "username")
        let userInfoPanelGesture:UIGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(panelTapped(sender:)))
        userInfoPanel.addGestureRecognizer(userInfoPanelGesture)
        
        backDataIcon = UIImageView.init(frame: CGRect.init(x: 10, y: 15, width: 20, height: 20))
        backDataIcon?.image = UIImage.init(named: "backDataIcon")
        scrollView.addSubview(backDataIcon!)
        
        backDataLabel = UILabel.init(frame: CGRect.init(x: 40, y: 15, width: 100, height: 30))
        backDataLabel?.text = "反馈数据"
        backDataLabel?.font = UIFont.init(name: "Helvetica", size: 12)
        scrollView.addSubview(backDataLabel!)
       
        let graphView:UIView = UIView.init(frame: CGRect.init(x: 0, y: 50, width: screenWidth, height: 230))
        graphView.backgroundColor = UIColor.white
        let items = ["周", "月", "年"]
        timeSegmentControl = UISegmentedControl(items:items)
        timeSegmentControl?.frame = CGRect.init(x: 30, y: 15, width: screenWidth - 60, height: 30)
        timeSegmentControl?.selectedSegmentIndex = 0
        timeSegmentControl?.tintColor = UIColor.init(red: 209/255.0, green: 214/255.0, blue: 218/255.0, alpha: 1)
        timeSegmentControl?.addTarget(self, action: #selector(segmentControlClick(sender:)), for: UIControlEvents.valueChanged)
        graphView.addSubview(timeSegmentControl!)
        
        lineChart.frame = CGRect.init(x: 30, y: 55, width: screenWidth - 60, height: 160)
        graphView.addSubview(lineChart)
        loadStatisticsData(cycle:1)
        
        /*
        chartView = UIImageView.init(frame: CGRect.init(x: 30, y: 55, width: screenWidth - 60, height: 160))
        chartView?.image = UIImage.init(named: "chartWeek")
        graphView.addSubview(chartView!)
        */
        
        scrollView.addSubview(graphView)
        
        myMatchViewIcon = UIImageView.init(frame: CGRect.init(x: 10, y: 290, width: 20, height: 20))
        myMatchViewIcon?.image = UIImage.init(named: "myMatchIcon")
        scrollView.addSubview(myMatchViewIcon!)
        
        myMatchViewLabel = UILabel.init(frame: CGRect.init(x: 40, y: 290, width: 100, height: 20))
        myMatchViewLabel?.text = "我的搭配"
        myMatchViewLabel?.font = UIFont.init(name: "Helvetica", size: 12)
        scrollView.addSubview(myMatchViewLabel!)
        
        let myAllMatchGesture1:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(myMatchAllClick(sender:)))
        myMatchAllLabel = UILabel.init(frame: CGRect.init(x: screenWidth - 70, y: 290, width: 30, height: 20))
        myMatchAllLabel?.text = "全部"
        myMatchAllLabel?.font = UIFont.init(name: "Helvetica", size: 12)
        myMatchAllLabel?.addGestureRecognizer(myAllMatchGesture1)
        myMatchAllLabel?.isUserInteractionEnabled = true
        scrollView.addSubview(myMatchAllLabel!)
        
        let myAllMatchGesture2:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(myMatchAllClick(sender:)))
        myMatchArrowImageView = UIImageView.init(frame: CGRect.init(x: screenWidth - 30, y: 293, width: 10, height: 15))
        myMatchArrowImageView?.image = UIImage.init(named: "rightArrow")
        myMatchArrowImageView?.addGestureRecognizer(myAllMatchGesture2)
        myMatchArrowImageView?.isUserInteractionEnabled = true
        scrollView.addSubview(myMatchArrowImageView!)
        
        let myMatchView:UIView = UIView.init(frame: CGRect.init(x: 0, y: 320, width: screenWidth, height: 65))
        myMatchView.backgroundColor = UIColor.white
        
        let pushGesture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(pushImageClick(sender:)))
        pushGesture.numberOfTapsRequired = 1
        
        myMatchPushImageView = UIImageView.init(frame: CGRect.init(x: screenWidth / 3 / 2 - 25, y: 5, width: 30, height: 30))
        myMatchPushImageView?.image = UIImage.init(named: "push")
        myMatchPushImageView?.isUserInteractionEnabled = true
        myMatchPushImageView?.addGestureRecognizer(pushGesture)
        myMatchView.addSubview(myMatchPushImageView!)
        
        myMatchPushLabel = UILabel.init(frame: CGRect.init(x: screenWidth / 3 / 2 - 30, y: 45, width: 40, height: 20))
        myMatchPushLabel?.text = "推送"
        myMatchPushLabel?.textAlignment = NSTextAlignment.center
        myMatchPushLabel?.font = UIFont.init(name: "Helvetica", size: 12)
        myMatchView.addSubview(myMatchPushLabel!)
        
        let backGesture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(backImageClick(sender:)))
        backGesture.numberOfTapsRequired = 1
        myMatchFeedbackImageView = UIImageView.init(frame: CGRect.init(x: screenWidth / 3 + screenWidth / 3 / 2 - 25, y: 5, width: 30, height: 30))
        myMatchFeedbackImageView?.image = UIImage.init(named: "feedback")
        myMatchFeedbackImageView?.isUserInteractionEnabled = true
        myMatchFeedbackImageView?.addGestureRecognizer(backGesture)
        myMatchView.addSubview(myMatchFeedbackImageView!)
        
        myMatchFeedbackLabel = UILabel.init(frame: CGRect.init(x: screenWidth / 3 + screenWidth / 3 / 2 - 30, y: 45, width: 40, height: 20))
        myMatchFeedbackLabel?.text = "反馈"
        myMatchFeedbackLabel?.textAlignment = NSTextAlignment.center
        myMatchFeedbackLabel?.font = UIFont.init(name: "Helvetica", size: 12)
        myMatchView.addSubview(myMatchFeedbackLabel!)
        
        let draftGesture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(draftImageClick(sender:)))
        draftGesture.numberOfTapsRequired = 1
        myMatchDraftImageView = UIImageView.init(frame: CGRect.init(x: screenWidth / 3 * 2 + screenWidth / 3 / 2 - 25, y: 5, width: 30, height: 30))
        myMatchDraftImageView?.image = UIImage.init(named: "draftbox")
        myMatchDraftImageView?.isUserInteractionEnabled = true
        myMatchDraftImageView?.addGestureRecognizer(draftGesture)
        myMatchView.addSubview(myMatchDraftImageView!)
        
        myMatchDraftLabel = UILabel.init(frame: CGRect.init(x: screenWidth / 3 * 2 + screenWidth / 3 / 2 - 30, y: 45, width: 40, height: 20))
        myMatchDraftLabel?.text = "草稿箱"
        myMatchDraftLabel?.textAlignment = NSTextAlignment.center
        myMatchDraftLabel?.font = UIFont.init(name: "Helvetica", size: 12)
        myMatchView.addSubview(myMatchDraftLabel!)
        
        scrollView.addSubview(myMatchView)
        
        hotMatchImageView = UIImageView.init(frame: CGRect.init(x: 10, y: 395, width: 20, height: 20))
        hotMatchImageView?.image = UIImage.init(named: "hotMatchIcon")
        scrollView.addSubview(hotMatchImageView!)
        
        hotMatchLabel = UILabel.init(frame: CGRect.init(x: 40, y: 395, width: 60, height: 20))
        hotMatchLabel?.text = "热门搭配"
        hotMatchLabel?.font = UIFont.init(name: "Helvetica", size: 12)
        scrollView.addSubview(hotMatchLabel!)
        
        let hotMatchGesture1:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(hotMatchAllClick(sender:)))
       
        hotMatchALLLabel = UILabel.init(frame: CGRect.init(x: screenWidth - 70, y: 395, width: 30, height: 20))
        hotMatchALLLabel?.text = "全部"
        hotMatchALLLabel?.font = UIFont.init(name: "Helvetica", size: 12)
        hotMatchALLLabel?.isUserInteractionEnabled = true
        hotMatchALLLabel?.addGestureRecognizer(hotMatchGesture1)
        scrollView.addSubview(hotMatchALLLabel!)
        
        let hotMatchGesture2:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(hotMatchAllClick(sender:)))
        hotMatchArrowImageView = UIImageView.init(frame: CGRect.init(x: screenWidth - 30, y: 398, width: 10, height: 15))
        hotMatchArrowImageView?.image = UIImage.init(named: "rightArrow")
        hotMatchArrowImageView?.isUserInteractionEnabled = true
        hotMatchArrowImageView?.addGestureRecognizer(hotMatchGesture2)
        scrollView.addSubview(hotMatchArrowImageView!)
        
        let hotView:UIView = UIView.init(frame: CGRect.init(x: 0, y: 425, width: screenWidth, height: 130))
         let borderColor:CGColor = UIColor.init(red: 253/255.0, green: 220/255.0, blue: 56/255.0, alpha: 1.0).cgColor
        top3ImageView1 = UIImageView.init(frame: CGRect.init(x: 10, y: 10, width: (screenWidth - 60) / 3, height: (screenWidth - 60) / 3))
        top3ImageView1?.layer.borderWidth = 1.0
        top3ImageView1?.layer.borderColor = borderColor
        top3ImageView1?.tag = 1
        top3ImageView1?.isUserInteractionEnabled = true
        top3ImageView1?.contentMode = .scaleAspectFit
        top3ImageView1?.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(hotDetailViewClick(sender:))))
        hotView.addSubview(top3ImageView1!)
        
       
        top3ImageView2 = UIImageView.init(frame: CGRect.init(x: screenWidth / 2 - ((screenWidth - 60) / 3) / 2, y: 10, width: (screenWidth - 60) / 3, height: (screenWidth - 60) / 3))
        top3ImageView2?.layer.borderWidth = 1.0
        top3ImageView2?.layer.borderColor = borderColor
        top3ImageView2?.tag = 2
        top3ImageView2?.isUserInteractionEnabled = true
        top3ImageView2?.contentMode = .scaleAspectFit
        top3ImageView2?.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(hotDetailViewClick(sender:))))
        hotView.addSubview(top3ImageView2!)
        
        top3ImageView3 = UIImageView.init(frame: CGRect.init(x: ((screenWidth - 60) / 3) * 2 + 50, y: 10, width: (screenWidth - 60) / 3, height: (screenWidth - 60) / 3))
        top3ImageView3?.layer.borderWidth = 1.0
        top3ImageView3?.layer.borderColor = borderColor
        top3ImageView3?.tag = 3
        top3ImageView3?.isUserInteractionEnabled = true
        top3ImageView3?.contentMode = .scaleAspectFit
        top3ImageView3?.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(hotDetailViewClick(sender:))))
        hotView.addSubview(top3ImageView3!)
        
        scrollView.addSubview(hotView)
        scrollView.contentSize = CGSize.init(width: screenWidth, height: 580)
        
        self.initHotImage()
        
        NotificationCenter.default.addObserver(self, selector:#selector(self.updateHeaderIcon(notifaction:)), name: NSNotification.Name(rawValue: "HeadIcon"), object: nil)
        
        let headIcon:String = LocalDataStorageUtil.getUserInfoByKey(key: "headicon")
        if !(headIcon == ""){
            userIcon.af_setImage(withURL: URL.init(string: headIcon)!)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        NotificationCenter.default.removeObserver(self)
    }
    
    func updateHeaderIcon(notifaction: NSNotification){
        let headicon:UIImage = (notifaction.object as? UIImage)!
        userIcon.image = headicon
    }

    @IBAction func settingBtnClick(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "settingView")
        self.navigationController?.pushViewController(view!, animated: true)
    }
    
    func panelTapped(sender:UITapGestureRecognizer){
        let view = self.storyboard?.instantiateViewController(withIdentifier: "PersonalInfoView")
        self.navigationController?.pushViewController(view!, animated: true)
    }
    
    func segmentControlClick(sender:UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0:
            //let weeks = ["1周", "2周", "3周", "4周", "5周", "6周"]
            //let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0]
            //setChart(weeks, values: unitsSold)
            loadStatisticsData(cycle:1)
        case 1:
            loadStatisticsData(cycle:2)
        case 2:
            loadStatisticsData(cycle:3)
        default:
            loadStatisticsData(cycle:1)
        }
    }
    
    func myMatchAllClick(sender: Any){
        print("click...")
        let view:MyMatchViewController = self.storyboard?.instantiateViewController(withIdentifier: "MyMatchView") as! MyMatchViewController
        view.btnInitTag = 0
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func hotMatchAllClick(sender: Any){
        let view = self.storyboard?.instantiateViewController(withIdentifier: "HotMatchView")
        self.navigationController?.pushViewController(view!, animated: true)
    }
    
    func pushImageClick(sender:Any){
        let view:MyMatchViewController = self.storyboard?.instantiateViewController(withIdentifier: "MyMatchView") as! MyMatchViewController
        view.btnInitTag = 1
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func backImageClick(sender:Any){
        let view:MyMatchViewController = self.storyboard?.instantiateViewController(withIdentifier: "MyMatchView") as! MyMatchViewController
        view.btnInitTag = 2
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func draftImageClick(sender:Any){
        let view:MyMatchViewController = self.storyboard?.instantiateViewController(withIdentifier: "MyMatchView") as! MyMatchViewController
        view.btnInitTag = 3
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func hotDetailViewClick(sender:UITapGestureRecognizer){
        let tag:Int = sender.view!.tag
        var feedbackModel:FeedbackModel?
        if (tag == 1){
            if feedbackModels.count > 0{
                feedbackModel = feedbackModels[0]
            }
        }
        else if (tag == 2){
            if feedbackModels.count > 1{
                feedbackModel = feedbackModels[1]
            }
            
        }
        else if (tag == 3){
            if feedbackModels.count > 2{
                feedbackModel = feedbackModels[2]
            }
        }
        
        if let feedbackModelObject = feedbackModel{
            let view:HotMatchDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "HotMatchDetailView") as! HotMatchDetailViewController
            view.feedbackModel = feedbackModelObject
            self.navigationController?.pushViewController(view, animated: true)
        }
        
    }
    
    func loadStatisticsData(cycle:Int){
        let parameters:Parameters = ["userId":userId]
        var url = "";
        
        if (cycle == 1){
            url = ConstantsUtil.APP_GET_STATISTICS_WEEK_DATA;
        }
        else if (cycle == 2){
            url = ConstantsUtil.APP_GET_STATISTICS_MONTH_DATA;
        }
        else if (cycle == 3){
            url = ConstantsUtil.APP_GET_STATISTICS_YEAR_DATA;
        }
        
        Alamofire.request(url,method:.get,parameters:parameters).responseJSON { response in
            
            if let JSON = response.result.value{
                let result =  JSON as! NSDictionary
                let dict:NSDictionary = result["object"] as! NSDictionary
                var cycle:[String] = []
                var unitsSold:[Double] = []
                
                for (key, value) in dict {
                    cycle.append(key as! String)
                    print(value)
                    unitsSold.append((value as! NSNumber).doubleValue)
                }
                
                self.setChart(cycle, values: unitsSold)
            }
        }
       
    }
    
    func initHotImage(){
        let parameters:Parameters = ["userId":userId]
        
        Alamofire.request(ConstantsUtil.APP_MATCH_THREE_HOT_FEEDBACK_URL,method:.post,parameters:parameters).responseObject { (response: DataResponse<FeedbackServerModel>) in
            
            let feedbackServerModel = response.result.value
            
            if (feedbackServerModel?.resultCode == 200){
                
                if let feedbackServerModelObject = feedbackServerModel?.object{
                    
                    if (feedbackServerModelObject.count > 0){
                        if (feedbackServerModelObject.count == 1){
                            if let model1Url = feedbackServerModelObject[0].modelurl{
                                self.top3ImageView1?.af_setImage(withURL: URL.init(string: model1Url)!)
                                self.feedbackModels.append(feedbackServerModelObject[0])
                            }
                        }
                        else if (feedbackServerModelObject.count == 2){
                            if let model1Url = feedbackServerModelObject[0].modelurl{
                                self.top3ImageView1?.af_setImage(withURL: URL.init(string: model1Url)!)
                                self.feedbackModels.append(feedbackServerModelObject[0])
                            }
                            if let model2Url = feedbackServerModelObject[1].modelurl{
                                self.top3ImageView2?.af_setImage(withURL: URL.init(string: model2Url)!)
                                self.feedbackModels.append(feedbackServerModelObject[1])
                            }
                        }
                        else if (feedbackServerModelObject.count == 3){
                            if let model1Url = feedbackServerModelObject[0].modelurl{
                                self.top3ImageView1?.af_setImage(withURL: URL.init(string: model1Url)!)
                                self.feedbackModels.append(feedbackServerModelObject[0])
                            }
                            if let model2Url = feedbackServerModelObject[1].modelurl{
                                self.top3ImageView2?.af_setImage(withURL: URL.init(string: model2Url)!)
                                self.feedbackModels.append(feedbackServerModelObject[1])
                            }
                            if let model3Url = feedbackServerModelObject[2].modelurl{
                                self.top3ImageView3?.af_setImage(withURL: URL.init(string: model3Url)!)
                                self.feedbackModels.append(feedbackServerModelObject[2])
                            }
                        }
                        
                    }
                    else{
                        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                        hud.label.text = "无热门数据"
                        hud.hide(animated: true, afterDelay: 2.0)
                    }
                }
            }
        }
    }
    
    func setChart(_ dataPoints: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let lineChartDataSet = LineChartDataSet(values: dataEntries, label: "单位：人次")
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        
        lineChart.data = lineChartData
        //右下角图标描述
        lineChart.chartDescription?.text = ""
        
        lineChart.legend.textColor = UIColor.darkGray
        
        //设置X轴坐标
        lineChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: dataPoints)
        lineChart.xAxis.granularity = 1.0
        lineChart.xAxis.labelPosition = .bottom
        lineChart.xAxis.drawGridLinesEnabled = false
        lineChart.xAxis.axisLineColor = UIColor.brown
        lineChart.xAxis.labelTextColor = UIColor.lightGray
        
        lineChart.rightAxis.drawAxisLineEnabled = false
        //不显示右侧Y轴数字
        lineChart.rightAxis.enabled = false
        lineChart.leftAxis.axisLineColor = UIColor.darkGray
        lineChart.leftAxis.gridColor = UIColor.lightGray
        lineChart.leftAxis.labelTextColor = UIColor.lightGray
        
        //设置双击坐标轴是否能缩放
        lineChart.scaleXEnabled = false
        lineChart.scaleYEnabled = false
        
        //外圆
        lineChartDataSet.setCircleColor(UIColor.init(red: 198/255.0, green: 198/255.0, blue: 198/255.0, alpha: 0.5))
        
        lineChartDataSet.circleHoleColor = UIColor.init(red: 255/255.0, green: 200/255.0, blue: 10/255.0, alpha: 1)
        
        lineChartDataSet.colors = [UIColor.init(red: 255/255.0, green: 200/255.0, blue: 10/255.0, alpha: 1)]
        
        //线条上的文字
        lineChartDataSet.valueColors = [UIColor.darkGray]
        
        //添加显示动画
        lineChart.animate(xAxisDuration: 1)
    }
    
}
