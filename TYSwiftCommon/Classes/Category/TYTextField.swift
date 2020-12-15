//
//  TYTextField.swift
//  TYSwiftCommon
//
//  Created by 田宇 on 2020/12/15.
//

import UIKit

extension UITextField {
    func ty_setPlaceHolder(_ placeholder:String,color:UIColor?){
        var pColor = rgba(0, 0, 0, 0.29);
        if color != nil {
            pColor = color!
        }
        self.attributedPlaceholder = NSAttributedString.init(string: placeholder, attributes: [NSAttributedStringKey.foregroundColor:pColor])
    }
}
