//
//  TYImage.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/15.
//

import UIKit

func tyImageNamed(_ name:String) -> UIImage? {
    return UIImage.init(named: name)
}

extension UIImage {
    func ty_originalImage() -> UIImage {
        return self.withRenderingMode(RenderingMode.alwaysOriginal)
    }
}
