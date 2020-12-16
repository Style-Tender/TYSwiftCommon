//
//  TYStorageUtils.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/15.
//

import UIKit

public class TYStorageUtils: NSObject {
    ///保存对象
    public class func ty_saveObject(obj:Any,with key:String){
        if (key as NSString).length != 0 {
            UserDefaults.standard.set(obj, forKey: key)
        }
    }
    ///取出字符串
    public class func ty_stringForKey(_ key:String) -> String{
        let obj = UserDefaults.standard.string(forKey: key) ?? "";
        return obj
    }
    ///取出Int
    public class func ty_intForKey(_ key:String) -> Int{
        let obj = UserDefaults.standard.integer(forKey: key);
        return obj
    }
    ///取出字典
    public class func ty_dictionaryForKey(_ key:String) -> [String:Any]{
        guard let obj = UserDefaults.standard.dictionary(forKey: key) else { return [String:Any]()
        };
        return obj
    }
    ///取出数组
    public class func ty_arrayForKey(_ key:String) -> [Any]{
        guard let obj = UserDefaults.standard.array(forKey: key) else { return [Any]()};
        return obj
    }
    ///清空所有
    public class func ty_clearAll(){
        let dict = UserDefaults.standard.dictionaryRepresentation()
        for key in dict.keys {
            UserDefaults.standard.removeObject(forKey: key)
        }
    }
    ///清除某个Key
    public class func ty_clearObjWithKey(_ key:String){
        UserDefaults.standard.removeObject(forKey: key)
    }
    ///清除所有除了某些Keys
    public class func ty_clearObjWithoutKeys(_ keys:Array<String>){
        let dict = UserDefaults.standard.dictionaryRepresentation()
        for key in dict.keys {
            if !keys.contains(key) {
                UserDefaults.standard.removeObject(forKey: key)
            }
        }
    }
}
