//
//  TYAppInfoUtils.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/15.
//

import UIKit

class TYAppInfoUtils: NSObject {
    ///版本号
    class var appVersion:String {
        let dict = Bundle.main.infoDictionary
        let version:String = dict?["CFBundleShortVersionString"] as! String
        return version
    }
}
