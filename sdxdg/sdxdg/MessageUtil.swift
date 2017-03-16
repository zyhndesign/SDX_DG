//
//  MessageUtil.swift
//  sdxdg
//
//  Created by lotusprize on 17/3/16.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import Foundation
import UIKit

class MessageUtil: NSObject {
    
    static func showMessage(view : UIView, message: String){
        let messageToast = MBProgressHUD.init()
        messageToast.label.text = message
        messageToast.mode = MBProgressHUDMode.text
        messageToast.show(animated: true)
        messageToast.hide(animated: true, afterDelay: 2.0)
        view.addSubview(messageToast)
    }
    
}
