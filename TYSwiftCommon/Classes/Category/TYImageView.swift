//
//  TYImageView.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/15.
//

import UIKit

extension UIImageView {
    class func ty_icon() -> UIImageView {
        let icon = UIImageView.init()
        icon.contentMode = .scaleAspectFill
        icon.clipsToBounds = true
        return icon
    }
    
    class func ty_icon(with radius:CGFloat) -> UIImageView {
        let icon = UIImageView.init()
        icon.contentMode = .scaleAspectFill
        icon.layer.cornerRadius = radius
        icon.clipsToBounds = true
        return icon
    }
}
