//
//  TYView.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/15.
//

import UIKit

public func adaptatifHeight(width:CGFloat,uiw:CGFloat,uih:CGFloat) -> CGFloat{
    return width * (uih / uiw)
}

public extension UIView{
    var ty_width : CGFloat {
        get{
            return self.bounds.size.width
        }
        set{
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame;
        }
    }
    
    var ty_height : CGFloat {
        get{
            return self.bounds.size.height
        }
        set{
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame;
        }
    }
    
    var ty_x : CGFloat {
        get{
            return self.frame.origin.x
        }
        set{
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame;
        }
    }
    
    var ty_y : CGFloat {
        get{
            return self.frame.origin.y
        }
        set{
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame;
        }
    }
    
    var ty_centerX : CGFloat {
        get{
            return self.center.x
        }
        set{
            var center = self.center
            center.x = newValue
            self.center = center;
        }
    }
    
    var ty_centerY : CGFloat {
        get{
            return self.center.y
        }
        set{
            var center = self.center
            center.y = newValue
            self.center = center;
        }
    }
    
    class func ty_view(with color:UIColor) -> UIView {
        let view = UIView.init()
        view.backgroundColor = color
        return view
    }
    
    func ty_setBackground(image:UIImage) {
        self.layer.contents = image
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
    
    func ty_clipRound(size:CGSize,round:CGFloat,corner:UIRectCorner) {
        let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        let maskPath = UIBezierPath.init(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize.init(width: round, height: round))
        let maskLayer = CAShapeLayer.init()
        maskLayer.frame = rect
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
}

