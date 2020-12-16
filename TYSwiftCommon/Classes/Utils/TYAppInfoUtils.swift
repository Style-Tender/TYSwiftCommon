//
//  TYAppInfoUtils.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/15.
//

import UIKit

public class TYAppInfoUtils: NSObject {
    ///App名称
    public class var appName:String? {
        let dict = Bundle.main.infoDictionary
        let name = dict?["CFBundleName"]
        return name as? String
    }
    ///版本号
    public class var appVersion:String? {
        let dict = Bundle.main.infoDictionary
        let version = dict?["CFBundleShortVersionString"]
        return version as? String
    }
    ///跳转AppStore信息页面
    public class func ty_jump2AppStore_APPinfo(appid:String){
        let url = "itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=\(appid)"
        UIApplication.shared.open(url.ty_url!, options: [String:Any](), completionHandler: nil)
    }
    ///跳转AppStore评价页面
    public class func ty_jump2AppStore_APPComment(appid:String){
        let url = "itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=\(appid)"
        UIApplication.shared.open(url.ty_url!, options: [String:Any](), completionHandler: nil)
    }
}
