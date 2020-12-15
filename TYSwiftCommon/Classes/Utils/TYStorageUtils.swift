//
//  TYStorageUtils.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/15.
//

import UIKit

class TYStorageUtils: NSObject {
    ///保存对象
    class func ty_saveObject(obj:Any,with key:String){
        if (key as NSString).length != 0 {
            UserDefaults.standard.set(obj, forKey: key)
        }
    }
    ///取出字符串
    class func ty_stringForKey(_ key:String) -> String{
        let obj = UserDefaults.standard.string(forKey: key) ?? "";
        return obj
    }
    ///清空所有
    class func ty_clearAll(){
        let dict = UserDefaults.standard.dictionaryRepresentation()
        for key in dict.keys {
            UserDefaults.standard.removeObject(forKey: key)
        }
    }
    ///清除某个Key
    class func ty_clearObjWithKey(_ key:String){
        UserDefaults.standard.removeObject(forKey: key)
    }
    ///清除所有除了某些Keys
    class func ty_clearObjWithoutKeys(_ keys:Array<String>){
        let dict = UserDefaults.standard.dictionaryRepresentation()
        for key in dict.keys {
            if !keys.contains(key) {
                UserDefaults.standard.removeObject(forKey: key)
            }
        }
    }
}
