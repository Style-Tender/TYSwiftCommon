//
//  TYCommon.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/15.
//

import UIKit

// MARK: - 字体
func ty_font(_ size:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: .regular)
}

func ty_font_medium(_ size:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: .medium)
}

func ty_font_semibold(_ size:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: .semibold)
}

func ty_font_bold(_ size:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: .bold)
}

// MARK: - 常用常量
/// 状态栏高度
var tkStatusBarH : CGFloat {
    return UIApplication.shared.statusBarFrame.size.height
}

/// 导航栏高度
var tkNavBarH : CGFloat = 44

/// 导航栏 + 状态栏高度
var tkNav_StatusBarH : CGFloat {
    return tkStatusBarH + tkNavBarH
}

/// 屏幕宽度
var tkScreenW : CGFloat {
    return UIScreen.main.bounds.size.width
}

/// 屏幕高度
var tkScreenH : CGFloat {
    return UIScreen.main.bounds.size.height
}

/// 屏幕分辨率
var tkScreenScale : CGFloat {
    return UIScreen.main.scale
}

/// 是否iphone5屏幕
var tkIphone5 : Bool {
    return tkScreenH == 568 && tkScreenScale == 2
}

/// 是否iphone6屏幕
var tkIphone6 : Bool {
    return tkScreenH == 667 && tkScreenScale == 2
}

/// 是否iphone6p屏幕
var tkIphone6P : Bool {
    return tkScreenH == 736 && tkScreenScale == 3
}

/// 是否iphoneX屏幕
var tkIphoneX : Bool {
    return tkScreenH == 812 && tkScreenScale == 3
}

/// 是否iphoneMax屏幕
var tkIphoneXS_MAX : Bool {
    return tkScreenH == 896 && tkScreenScale == 3
}

/// 是否iphoneXR屏幕
var tkIphoneXR : Bool {
    return tkScreenH == 896 && tkScreenScale == 2
}

/// 是否全面屏手机
var tkIsFullScreenIphone : Bool {
    return tkIphoneXR || tkIphoneXS_MAX || tkIphoneX
}

/// 标签栏高度
var tkTabbarH : CGFloat {
    return tkIsFullScreenIphone ? 83 : 49
}

/// 顶部间距
var tkTopMaigin : CGFloat {
    return tkIsFullScreenIphone ? 44 : 20
}

/// 底部间距
var tkBottomMargin : CGFloat {
    return tkIsFullScreenIphone ? 34 : 0
}

func TYLog<T>(message : T, file : String? = #file, lineNum : Int? = #line) {
#if DEBUG
    let fileName = (file! as NSString).lastPathComponent
    print("\(fileName):(\(lineNum!))-\(message)")
#endif
}

