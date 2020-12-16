//
//  TYNavigationBarManager.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/15.
//

import UIKit

public class TYNavigationBarManager: NSObject {
    
    private struct TYNavigationBarManagerKeys {
        static var kTYClassPresfixKey = "kTYClassPresfixKey"
        static var kTYDefaultBarBackgroundColorKey = "kTYDefaultBarBackgroundColorKey"
        static var kTYDefaultNavigationBarTintColorKey = "kTYDefaultNavigationBarTintColorKey"
        static var kTYDefaultNavigationBarTitleTextColorKey = "kTYDefaultNavigationBarTitleTextColorKey"
        static var kTYDefaultNavigationBarBackgroundAlphaKey = "kTYDefaultNavigationBarBackgroundAlphaKey"
        static var kTYDefaultNavigationBarShadowImageHiddenKey = "kTYDefaultNavigationBarShadowImageHiddenKey"
    }
    
    /// 需要处理的类前缀
    class var ty_classPrefix: String {
        get {
            let str = objc_getAssociatedObject(self, &TYNavigationBarManagerKeys.kTYClassPresfixKey)
            guard str != nil else {
                return ""
            }
            return str as! String
        }
        set {
            objc_setAssociatedObject(self, &TYNavigationBarManagerKeys.kTYClassPresfixKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    /// 默认导航栏背景颜色
    class var ty_default_navigationbar_background_color : UIColor {
        get {
            let color = objc_getAssociatedObject(self, &TYNavigationBarManagerKeys.kTYDefaultBarBackgroundColorKey)
            guard color != nil else {
                return .white
            }
            return color as! UIColor
        }
        set {
            objc_setAssociatedObject(self, &TYNavigationBarManagerKeys.kTYDefaultBarBackgroundColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 默认导航栏的Tint颜色
    class var ty_default_navigationbar_tint_color : UIColor {
        get {
            let color = objc_getAssociatedObject(self, &TYNavigationBarManagerKeys.kTYDefaultNavigationBarTintColorKey)
            guard color != nil else {
                return .black
            }
            return color as! UIColor
        }
        set {
            objc_setAssociatedObject(self, &TYNavigationBarManagerKeys.kTYDefaultNavigationBarTintColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 默认导航栏标题的字体颜色
    class var ty_default_navigationbar_title_text_color : UIColor {
        get {
            let color = objc_getAssociatedObject(self, &TYNavigationBarManagerKeys.kTYDefaultNavigationBarTitleTextColorKey)
            guard color != nil else {
                return .black
            }
            return color as! UIColor
        }
        set {
            objc_setAssociatedObject(self, &TYNavigationBarManagerKeys.kTYDefaultNavigationBarTitleTextColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 默认导航栏背景透明度
    class var ty_default_navigationbar_background_alpha : CGFloat {
        get {
            let value = objc_getAssociatedObject(self, &TYNavigationBarManagerKeys.kTYDefaultNavigationBarBackgroundAlphaKey)
            guard value != nil else {
                return 1
            }
            return value as! CGFloat
        }
        set {
            objc_setAssociatedObject(self, &TYNavigationBarManagerKeys.kTYDefaultNavigationBarBackgroundAlphaKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 默认导航栏横线的隐藏
    class var ty_default_navigationbar_shadow_image_hidden : Bool {
        get {
            let value = objc_getAssociatedObject(self, &TYNavigationBarManagerKeys.kTYDefaultNavigationBarShadowImageHiddenKey)
            guard value != nil else {
                return false
            }
            return value as! Bool
        }
        set {
            objc_setAssociatedObject(self, &TYNavigationBarManagerKeys.kTYDefaultNavigationBarShadowImageHiddenKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

//MARK: - TYNavigationBar公共方法
public extension UIViewController{
    /// 背景图片
    var ty_navigationbar_background_image : UIImage? {
        get {
            let value = objc_getAssociatedObject(self, &TYViewControllerKeys.kTYNavigationBarBackgroundImageKey)
            return value as? UIImage
        }
        set {
            objc_setAssociatedObject(self, &TYViewControllerKeys.kTYNavigationBarBackgroundImageKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            updateNavigationBarBackgroundImage(image: newValue)
        }
    }
    
    /// 背景颜色
    var ty_navigationbar_background_color : UIColor {
        get {
            let value = objc_getAssociatedObject(self, &TYViewControllerKeys.kTYBarBackgroundColorKey)
            guard value != nil else {
                return TYNavigationBarManager.ty_default_navigationbar_background_color
            }
            return value as! UIColor
        }
        set {
            objc_setAssociatedObject(self, &TYViewControllerKeys.kTYBarBackgroundColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            updateNavigationBarBackgroundColor(color: newValue)
        }
    }
    
    /// Tint颜色
    var ty_navigationbar_tint_color : UIColor {
        get {
            let value = objc_getAssociatedObject(self, &TYViewControllerKeys.kTYNavigationBarTintColorKey)
            guard value != nil else {
                return TYNavigationBarManager.ty_default_navigationbar_tint_color
            }
            return value as! UIColor
        }
        set {
            objc_setAssociatedObject(self, &TYViewControllerKeys.kTYNavigationBarTintColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            updateNavigationBarTintColor(color: newValue)
        }
    }
    
    /// 标题的字体颜色
    var ty_navigationbar_title_text_color : UIColor {
        get {
            let value = objc_getAssociatedObject(self, &TYViewControllerKeys.kTYNavigationBarTitleTextColorKey)
            guard value != nil else {
                return TYNavigationBarManager.ty_default_navigationbar_title_text_color
            }
            return value as! UIColor
        }
        set {
            objc_setAssociatedObject(self, &TYViewControllerKeys.kTYNavigationBarTitleTextColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            updateNavigationBarTitleColor(color: newValue)
        }
    }
    
    /// 导航栏背景透明度
    var ty_navigationbar_alpha : CGFloat {
        get {
            let value = objc_getAssociatedObject(self, &TYViewControllerKeys.kTYNavigationBarBackgroundAlphaKey)
            guard value != nil else {
                return TYNavigationBarManager.ty_default_navigationbar_background_alpha
            }
            return value as! CGFloat
        }
        set {
            objc_setAssociatedObject(self, &TYViewControllerKeys.kTYNavigationBarBackgroundAlphaKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            updateNavigationBarBackgroundAlpha(alpha: newValue)
        }
    }
    
    /// 导航栏横线的隐藏
    var ty_navigationbar_shadow_image_hidden : Bool {
        get {
            let value = objc_getAssociatedObject(self, &TYViewControllerKeys.kTYNavigationBarShadowImageHiddenKey)
            guard value != nil else {
                return TYNavigationBarManager.ty_default_navigationbar_shadow_image_hidden
            }
            return value as! Bool
        }
        set {
            objc_setAssociatedObject(self, &TYViewControllerKeys.kTYNavigationBarShadowImageHiddenKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            updateNavigationBarShadowImageHidden(hidden: newValue)
        }
    }
    
    /// 导航栏隐藏
    var ty_navigationbar_hidden : Bool {
        get {
            let value = objc_getAssociatedObject(self, &TYViewControllerKeys.kTYNavigationBarHiddenKey)
            guard value != nil else {
                return false
            }
            return value as! Bool
        }
        set {
            objc_setAssociatedObject(self, &TYViewControllerKeys.kTYNavigationBarHiddenKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.navigationController?.navigationBar.isHidden = newValue
        }
    }
}

//MARK: - TYNavigationBar私有方法
extension UIViewController : TYSelfAware{
    static func awake() {
        swizzleMethod
    }
    static let swizzleMethod: Void = {
        let originalSelector = #selector(viewWillAppear(_:))
        let swizzledSelector = #selector(swizzled_viewWillAppear(_:))
        swizzlingForClass(UIViewController.self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
    }()
    @objc func swizzled_viewWillAppear(_ animated: Bool) {
        swizzled_viewWillAppear(animated)
        refresh(animated)
    }
    
    private struct TYViewControllerKeys {
        static var kTYBarBackgroundColorKey = "kTYBarBackgroundColorKey"
        static var kTYNavigationBarTintColorKey = "kTYNavigationBarTintColorKey"
        static var kTYNavigationBarTitleTextColorKey = "kTYNavigationBarTitleTextColorKey"
        static var kTYNavigationBarBackgroundAlphaKey = "kTYNavigationBarBackgroundAlphaKey"
        static var kTYNavigationBarShadowImageHiddenKey = "kTYNavigationBarShadowImageHiddenKey"
        static var kTYNavigationBarBackgroundImageKey = "kTYNavigationBarBackgroundImageKey"
        static var kTYNavigationBarHiddenKey = "kTYNavigationBarHiddenKey"
    }
    
    ///刷新导航栏
    func refresh(_ animated:Bool) {
        let classPrefix = TYNavigationBarManager.ty_classPrefix
        let selfClass = String(describing: type(of: self))
        if (classPrefix as NSString).length != 0 && !selfClass.hasPrefix(classPrefix){
            return
        }
        
        guard self.navigationController != nil else {
            return
        }
        
        self.navigationController?.setNavigationBarHidden(self.ty_navigationbar_hidden, animated: animated)
        
        if self.ty_navigationbar_hidden {
            return
        }
        
        let image = self.ty_navigationbar_background_image
        if image == nil {
            updateNavigationBarBackgroundColor(color: self.ty_navigationbar_background_color)
        }else {
            updateNavigationBarBackgroundImage(image: image)
        }
        
        updateNavigationBarTintColor(color: self.ty_navigationbar_tint_color)
        
        updateNavigationBarTitleColor(color: self.ty_navigationbar_title_text_color)
        
        updateNavigationBarBackgroundAlpha(alpha: self.ty_navigationbar_alpha)
        
        updateNavigationBarShadowImageHidden(hidden: self.ty_navigationbar_shadow_image_hidden)
    }
    
    /// 设置背景图片
    func updateNavigationBarBackgroundImage(image : UIImage?) {
        guard image != nil else {
            return
        }
        let navImg = image!.resizableImage(withCapInsets: .zero, resizingMode: .stretch)
        self.navigationController?.navigationBar.setBackgroundImage(navImg, for: .default)
    }
    
    /// 设置导航栏背景颜色
    func updateNavigationBarBackgroundColor(color : UIColor) {
        let aplha = self.ty_navigationbar_alpha
        let image = getImageWithColor(color: color, alpha: aplha)
        guard image != nil else {
            return
        }
        self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
    }
    
    /// 修改导航栏Tint颜色
    func updateNavigationBarTintColor(color : UIColor) {
        self.navigationController?.navigationBar.tintColor = color
    }
    
    /// 修改标题栏字体的颜色
    func updateNavigationBarTitleColor(color : UIColor) {
        var titleTextAttributes = self.navigationController?.navigationBar.titleTextAttributes
        
        guard titleTextAttributes != nil else {
            return
        }
        
        titleTextAttributes![NSAttributedString.Key.foregroundColor] = color
        self.navigationController?.navigationBar.titleTextAttributes = titleTextAttributes
    }
    
    /// 修改导航栏背景透明度
    func updateNavigationBarBackgroundAlpha(alpha : CGFloat) {
        let color = self.ty_navigationbar_background_color
        let image = getImageWithColor(color: color, alpha: alpha)
        guard image != nil else {
            return
        }
        self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
    }
    
    //// 修改分割线显示
    func updateNavigationBarShadowImageHidden(hidden : Bool) {
        self.navigationController?.navigationBar.shadowImage = hidden ? UIImage.init() : nil
    }
    
    ///获取图片
    func getImageWithColor(color:UIColor,alpha:CGFloat) -> UIImage? {
        let width = UIScreen.main.bounds.size.width
        let height = UIApplication.shared.statusBarFrame.size.height
        
        let newColor = color.withAlphaComponent(alpha).cgColor
        
        let rect = CGRect.init(x: 0, y: 0, width: width, height: height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(newColor)
        context.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
}
