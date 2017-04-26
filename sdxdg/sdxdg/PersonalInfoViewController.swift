//
//  PersonalInfoViewController.swift
//  sdxdg
//
//  Created by lotusprize on 16/12/24.
//  Copyright © 2016年 geekTeam. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PersonalInfoViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var userIconImageView: UIImageView!
    @IBOutlet var postBtn: UIButton!
    
    var newIcon:Bool = false
    
    let userId = LocalDataStorageUtil.getUserIdFromUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postBtn.layer.cornerRadius = 6
        
        let tapImage:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(fromAlbum(sender:)))
        userIconImageView.isUserInteractionEnabled = true
        userIconImageView.addGestureRecognizer(tapImage)
    }
    
    func fromAlbum(sender:Any){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.present(picker, animated: true, completion: { 
                
            })
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        let size:CGSize = CGSize.init(width: 200, height: 200)
        
        var newImage:UIImage?
        UIGraphicsBeginImageContext(size)
        image.draw(in: CGRect.init(x: 0, y: 0, width: size.width, height: size.height))
        newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        userIconImageView.image = newImage
        newIcon = true
        picker.dismiss(animated: true) { 
            
        }
    }
    
    
    @IBAction func postDataBtnClick(_ sender: Any) {
        
        if !newIcon && (usernameTextField.text?.isEmpty)!{
            MessageUtil.showMessage(view: self.view, message: "无任何修改")
            return
        }
        
        var phone:String = ""
        if !(usernameTextField.text?.isEmpty)!{
            phone = usernameTextField.text!
        }
        
        print(phone)
        if newIcon{
            let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
            hud.label.text = "提交中..."
            let headers = ["content-type":"multipart/form-data"]
            
            Alamofire.request(ConstantsUtil.APP_QINIU_TOKEN).responseJSON { (response) in
                
                if let data = response.result.value {
                    let responseResult = JSON(data)
                    
                    let resultCode = responseResult["resultCode"].intValue
                    
                    if resultCode == 200{
                        let token = responseResult["uptoken"].string!
                        
                        Alamofire.upload(
                            multipartFormData: { multipartFormData in
                                multipartFormData.append((token.data(using: String.Encoding.utf8)!), withName: "token")
                                let filename = (UIDevice.current.identifierForVendor?.uuidString)!
                                multipartFormData.append(UIImagePNGRepresentation(self.userIconImageView.image!)!, withName: "file", fileName: filename, mimeType: "image/png")
                                
                        },
                            to: ConstantsUtil.APP_QINIU_UPLOAD_URL,
                            headers: headers,
                            encodingCompletion: { encodingResult in
                                switch encodingResult {
                                case .success(let upload, _, _):
                                    upload.responseJSON { response in
                                        
                                        if let value = response.result.value as? [String: AnyObject]{
                                            let json = JSON(value)
                                            let headicon = ConstantsUtil.APP_QINIU_IMAGE_URL_PREFIX + json["key"].string!
                                            
                                            hud.hide(animated: true)
                                            self.postUpdateData(phone: phone, headicon: headicon)
                                        }
                                    }
                                case .failure(let encodingError):
                                    hud.label.text = "操作失败"
                                    hud.hide(animated: true, afterDelay: 1.0)
                                    
                                }
                            }
                        )
                    }
                }
            }
        }
        else if (!phone.isEmpty){
            self.postUpdateData(phone: phone, headicon: "")
        }
    }
    
    func postUpdateData(phone:String, headicon:String){
        let parameters:Parameters = ["phone":phone,"headicon":headicon,"userId":userId]
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "提交中..."
        Alamofire.request(ConstantsUtil.APP_USER_UPDATE_DATA_URL,method:.post,parameters:parameters).responseJSON { (response) in
            
            if let data = response.result.value {
                let responseResult = JSON(data)
                
                let resultCode = responseResult["resultCode"].intValue
                
                if resultCode == 200{
                    hud.label.text = "操作成功"
                    hud.hide(animated: true, afterDelay: 1.0)
                    
                    if (!phone.isEmpty){
                        LocalDataStorageUtil.saveUserInfoToUserDefault(suiteName: "currentUser", key: "phone", value: phone)
                    }
                    
                    if (!headicon.isEmpty){
                        LocalDataStorageUtil.saveUserInfoToUserDefault(suiteName: "currentUser", key: "headicon", value: headicon)
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "HeadIcon"), object: self.userIconImageView.image!)
                    }
                    self.navigationController?.popViewController(animated: true)
                    
                   
                }
                else{
                    hud.label.text = "操作失败"
                    hud.hide(animated: true, afterDelay: 1.0)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
