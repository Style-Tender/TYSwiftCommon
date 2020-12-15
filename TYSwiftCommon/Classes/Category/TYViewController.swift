//
//  TYViewController.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/15.
//

import UIKit

extension UIViewController {
    
    ///注册通知
    func ty_registerNotification(name : String ,selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: Notification.Name.init(name), object: nil)
    }
    
    ///发送通知
    func ty_postNotificationWith(name : String ,params : [String:Any]) {
        let notification = Notification.init(name: Notification.Name.init(name), object: nil, userInfo: params)
        NotificationCenter.default.post(notification)
    }
    
    ///反注册通知
    func ty_unregisterNotification() {
        NotificationCenter.default.removeObserver(self)
    }
    
}
