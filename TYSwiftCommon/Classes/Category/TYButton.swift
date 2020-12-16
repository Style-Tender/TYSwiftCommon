//
//  TYButton.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/15.
//

import UIKit

enum TYButtonLocation : Int {
    case titleTop = 0
    case titleLeft
    case titleBottom
}

extension UIButton {
    class func ty_init(normalTitle:String? = nil,
                       selectTitle:String? = nil,
                       normalTextColor:UIColor? = nil,
                       selectTextColor:UIColor? = nil,
                       normalImage:UIImage? = nil,
                       selectImage:UIImage? = nil,
                       backgroundColor:UIColor? = nil,
                       normalBackgroundImage:UIImage? = nil,
                       selectBackgroundImage:UIImage? = nil,
                       font:UIFont? = UIFont.systemFont(ofSize: UIFont.systemFontSize)) -> UIButton {
        
        let button = UIButton.init()
        
        button.setTitle(normalTitle, for: .normal)
        button.setTitle(selectTitle, for: .selected)
        button.setTitleColor(normalTextColor, for: .normal)
        button.setTitleColor(selectTextColor, for: .selected)
        button.setImage(normalImage, for: .normal)
        button.setImage(selectImage, for: .selected)
        button.backgroundColor = backgroundColor
        button.setBackgroundImage(normalBackgroundImage, for: .normal)
        button.setBackgroundImage(selectBackgroundImage, for: .selected)
        button.titleLabel?.font = font
        
        return button
    }
    
    func ty_changeTitleLocation(location:TYButtonLocation, margin:CGFloat) {
        let imageW = self.imageView?.intrinsicContentSize.width ?? 0
        let imageH = self.imageView?.intrinsicContentSize.height ?? 0
        
        let titleW = self.titleLabel?.intrinsicContentSize.width ?? 0
        let titleH = self.titleLabel?.intrinsicContentSize.height ?? 0
        
        switch location {
            case .titleTop:
                self.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: -imageW, bottom: (imageH + margin/2), right: 0)
                self.imageEdgeInsets = UIEdgeInsets.init(top: (titleH + margin/2), left: 0, bottom: 0, right: -titleW)
            case .titleLeft:
                self.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: -(imageW + margin/2), bottom: 0, right:  (imageW + margin/2))
                self.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: (titleW + margin/2), bottom: 0, right: -(titleW + margin/2))
            case .titleBottom:
                self.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: -imageW, bottom: -(imageH + margin/2), right: 0)
                self.imageEdgeInsets = UIEdgeInsets.init(top: -(titleH + margin/2), left: 0, bottom: 0, right: -titleW)
        }
    }
}
