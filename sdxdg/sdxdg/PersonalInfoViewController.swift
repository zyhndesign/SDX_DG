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
        userIconImageView.image = image
        newIcon = true
        picker.dismiss(animated: true) { 
            
        }
    }
    
    
    
    @IBAction func postDataBtnClick(_ sender: Any) {
        
        if !newIcon && !(usernameTextField.text?.isEmpty)!{
            MessageUtil.showMessage(view: self.view, message: "无任何修改")
            return
        }
        
        var parameters:Parameters?
        if !(usernameTextField.text?.isEmpty)!{
            parameters = ["phone":usernameTextField.text]
        }
        
        if newIcon{
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
                                            var modelUrl = ConstantsUtil.APP_QINIU_IMAGE_URL_PREFIX + json["key"].string!
                                            
                                        }
                                    }
                                case .failure(let encodingError):
                                    print(encodingError)
                                    
                                }
                        }
                        )
                    }
                }
            }
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
