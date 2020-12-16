//
//  TYCommon.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/15.
//

import UIKit

// MARK: - 字体
public func ty_font(_ size:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: .regular)
}

public func ty_font_medium(_ size:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: .medium)
}

public func ty_font_semibold(_ size:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: .semibold)
}

public func ty_font_bold(_ size:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: .bold)
}

// MARK: - 常用常量
/// 状态栏高度
public var tkStatusBarH : CGFloat {
    return UIApplication.shared.statusBarFrame.size.height
}

/// 导航栏高度
public var tkNavBarH : CGFloat = 44

/// 导航栏 + 状态栏高度
public var tkNav_StatusBarH : CGFloat {
    return tkStatusBarH + tkNavBarH
}

/// 屏幕宽度
public var tkScreenW : CGFloat {
    return UIScreen.main.bounds.size.width
}

/// 屏幕高度
public var tkScreenH : CGFloat {
    return UIScreen.main.bounds.size.height
}

/// 屏幕分辨率
public var tkScreenScale : CGFloat {
    return UIScreen.main.scale
}

/// 是否iphone5屏幕
public var tkIphone5 : Bool {
    return tkScreenH == 568 && tkScreenScale == 2
}

/// 是否iphone6屏幕
public var tkIphone6 : Bool {
    return tkScreenH == 667 && tkScreenScale == 2
}

/// 是否iphone6p屏幕
public var tkIphone6P : Bool {
    return tkScreenH == 736 && tkScreenScale == 3
}

/// 是否iphoneX屏幕
public var tkIphoneX : Bool {
    return tkScreenH == 812 && tkScreenScale == 3
}

/// 是否iphoneMax屏幕
public var tkIphoneXS_MAX : Bool {
    return tkScreenH == 896 && tkScreenScale == 3
}

/// 是否iphoneXR屏幕
public var tkIphoneXR : Bool {
    return tkScreenH == 896 && tkScreenScale == 2
}

/// 是否全面屏手机
public var tkIsFullScreenIphone : Bool {
    return tkIphoneXR || tkIphoneXS_MAX || tkIphoneX
}

/// 标签栏高度
public var tkTabbarH : CGFloat {
    return tkIsFullScreenIphone ? 83 : 49
}

/// 顶部间距
public var tkTopMaigin : CGFloat {
    return tkIsFullScreenIphone ? 44 : 20
}

/// 底部间距
public var tkBottomMargin : CGFloat {
    return tkIsFullScreenIphone ? 34 : 0
}

public func TYLog<T>(message:T) {
#if DEBUG
    let fileName = (#file as NSString).lastPathComponent
    print("\(fileName):(\(#line))-\(message)")
#endif
}

public class TYCommon : NSObject {
    public class func ty_init(enable:Bool){
        if enable {
            UIApplication.runOnce
        }
    }
    
//    static var kEnableKey = "kEnableKey"
//    public class var enable : Bool {
//        get {
//            let result = objc_getAssociatedObject(self, &kEnableKey) as! Bool
//            return result
//        }
//        set{
//            objc_setAssociatedObject(self, &kEnableKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//            if newValue {
//                UIApplication.runOnce
//            }
//        }
//    }
}
