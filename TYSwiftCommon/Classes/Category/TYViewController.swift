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
    
    ///模态出半透明的控制器
    func ty_presentTransparent(vc:UIViewController,animate:Bool,completion:(()->Void)?){
        vc.view.backgroundColor = rgba(0, 0, 0, 0.5)
        vc.modalPresentationStyle = .overCurrentContext
        self.modalPresentationStyle = .currentContext
        self.present(vc, animated: animate, completion: completion)
    }
    
    ///pop自己
    func ty_popSelf() {
        if self.navigationController?.viewControllers.count >= 3 {
            var vcs = self.navigationController?.viewControllers
            vcs?.remove(at: vcs?.index(of: self) ?? 0)
            self.navigationController?.setViewControllers(vcs, animated: false)
        }
    }
}
