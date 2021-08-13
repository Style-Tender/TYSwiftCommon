//
//  TYCommon.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/15.
//

import UIKit

public extension NSObjectProtocol {
    static func tylog<T>(_ message:T, fileName: String = #file, lineNum : Int = #line) {
    #if DEBUG
        let file = (fileName as NSString).lastPathComponent
        print("[\(Date.init()) \(file)-\(lineNum)]:\(message)")
    #endif
    }
    
    func tylog<T>(_ message:T, fileName: String = #file, lineNum : Int = #line) {
        Self.tylog(message, fileName: fileName, lineNum: lineNum)
    }
}

internal func TYLog<T>(message:T, fileName: String = #file, lineNum : Int = #line) {
#if DEBUG
    let file = (fileName as NSString).lastPathComponent
    print("[\(Date.init()) \(file)-\(lineNum)]:\(message)")
#endif
}

public class TYCommon : NSObject {
    public class func ty_init(enable:Bool){
        if enable {
            UIApplication.runOnce
        }
    }
}
