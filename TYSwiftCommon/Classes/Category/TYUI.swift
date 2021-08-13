//
//  TYFloat.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2021/8/13.
//

import UIKit

// MARK: - 字体
public extension UIFont {
    static func ty_font(_ size:CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .regular)
    }

    static func ty_font_medium(_ size:CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .medium)
    }

    static func ty_font_semibold(_ size:CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .semibold)
    }

    static func ty_font_bold(_ size:CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .bold)
    }
}

public extension CGFloat {
    /// 屏幕宽度
    static var tkScreenW : CGFloat {
        return UIScreen.main.bounds.size.width
    }
    /// 屏幕高度
    static var tkScreenH : CGFloat {
        return UIScreen.main.bounds.size.height
    }

    /// 屏幕分辨率
    static var tkScreenScale : CGFloat {
        return UIScreen.main.scale
    }
    
    /// 标签栏高度
    static var tkTabbarH : CGFloat {
        return Bool.tkIsFullScreenIphone ? 83 : 49
    }

    /// 顶部间距
    static var tkTopMaigin : CGFloat {
        return Bool.tkIsFullScreenIphone ? 44 : 20
    }

    /// 底部间距
    static var tkBottomMargin : CGFloat {
        return Bool.tkIsFullScreenIphone ? 34 : 0
    }

    /// 状态栏高度
    static var tkStatusBarH : CGFloat {
        return Bool.tkIsFullScreenIphone ? 44 : 20
    }

    /// 导航栏高度
    static var tkNavBarH : CGFloat = 44

    /// 导航栏 + 状态栏高度
    static var tkNav_StatusBarH : CGFloat {
        return tkStatusBarH + tkNavBarH
    }
}

public extension Bool {
    /// 是否iphone5屏幕
    static var tkIphone5 : Bool {
        return CGFloat.tkScreenH == 568 && CGFloat.tkScreenScale == 2
    }

    /// 是否iphone6屏幕
    static var tkIphone6 : Bool {
        return CGFloat.tkScreenH == 667 && CGFloat.tkScreenScale == 2
    }

    /// 是否iphone6p屏幕
    static var tkIphone6P : Bool {
        return CGFloat.tkScreenH == 736 && CGFloat.tkScreenScale == 3
    }

    /// 是否iphoneX屏幕
    static var tkIphoneX : Bool {
        return CGFloat.tkScreenH == 812 && CGFloat.tkScreenScale == 3
    }

    /// 是否iphoneMax屏幕
    static var tkIphoneXS_MAX : Bool {
        return CGFloat.tkScreenH == 896 && CGFloat.tkScreenScale == 3
    }

    /// 是否iphoneXR屏幕
    static var tkIphoneXR : Bool {
        return CGFloat.tkScreenH == 896 && CGFloat.tkScreenScale == 2
    }

    /// 是否全面屏手机
    static var tkIsFullScreenIphone : Bool {
        return tkIphoneXR || tkIphoneXS_MAX || tkIphoneX
    }
}
