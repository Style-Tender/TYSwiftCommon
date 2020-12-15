//
//  TYView.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/15.
//

import UIKit

func adaptatifHeight(width:CGFloat,uiw:CGFloat,uih:CGFloat) -> CGFloat{
    return width * (uih / uiw)
}

extension UIView{
    var ty_width : CGFloat {
        return self.bounds.size.width
    }
    
    var ty_height : CGFloat {
        return self.bounds.size.height
    }
    
    class func ty_view(with color:UIColor) -> UIView {
        let view = UIView.init()
        view.backgroundColor = color
        return view
    }
    
    func ty_addAction(with target:Any, action:Selector) {
        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: target, action: action)
        self.addGestureRecognizer(tap)
    }
    
    func ty_addShadow(color:UIColor?,offset:CGSize,radius:CGFloat,opacity:CGFloat) {
        self.layer.shadowColor = color?.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = Float(opacity > 1 ? opacity / 255 : opacity)
    }
}

