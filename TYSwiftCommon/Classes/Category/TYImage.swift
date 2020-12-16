//
//  TYImage.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/15.
//

import UIKit

public func tyImageNamed(_ name:String) -> UIImage? {
    return UIImage.init(named: name)
}

public extension UIImage {
    func ty_originalImage() -> UIImage {
        return self.withRenderingMode(RenderingMode.alwaysOriginal)
    }
    
    var ty_roundImage:UIImage? {
        let rect = CGRect.init(x: 0, y: 0, width: self.size.width, height: self.size.height)
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0)
        let path = UIBezierPath.init(ovalIn: rect)
        path.addClip()
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
    
    class func ty_imageFrom(color:UIColor,size:CGSize) -> UIImage? {
        let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
}
