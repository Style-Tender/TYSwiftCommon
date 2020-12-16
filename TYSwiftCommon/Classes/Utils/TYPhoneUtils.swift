//
//  TYPhoneUtils.swift
//  TYSwiftCommon
//
//  Created by 田宇 on 2020/12/15.
//

import UIKit
import System

class TYPhoneUtils: NSObject {
    ///拨打电话
    class func ty_call(num:String) {
        let url = "tel:\(num)"
        UIApplication.shared.open(url.ty_url!, options: [String : Any](), completionHandler: nil)
    }
    
    ///手机型号
    class var ty_phoneModel : String? {
        var systemInfo = utsname()
        uname(&systemInfo)
        let platform = withUnsafePointer(to: &systemInfo.machine.0) { ptr in
                        return String(cString: ptr)
        }
        
        let path = Bundle.init(for: self).path(forResource: "DeviceModel", ofType: "plist")
        let devices = NSDictionary.init(contentsOfFile: path!)
        
        let result = devices?.allKeys.contains(where: { (item) -> Bool in
            return item as! String == platform
        }) ?? false
        
        if result {
            return devices?.object(forKey: platform) as? String
        } else {
            return platform
        }
    }
}
