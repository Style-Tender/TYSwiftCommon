//
//  TYColor.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/15.
//

import UIKit

func rgba(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat) -> UIColor {
    return UIColor.init(red: r/255, green: g/255, blue: b/255, alpha: a)
}

func rgb(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor {
    return UIColor.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
}
