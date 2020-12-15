//
//  TYButton.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/15.
//

import UIKit

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
    
}
