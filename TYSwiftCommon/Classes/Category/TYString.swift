//
//  TYString.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/15.
//

import UIKit

extension String {
    var notEmpty : Bool {
        return (self as NSString).length != 0
    }
    
    var ty_url : URL? {
        return URL.init(string: self)
    }
    
    func ty_height(width:CGFloat,font:UIFont) -> CGFloat {
        let attribute = [NSAttributedString.Key.font:font]
        let text = self as NSString
        let size = text.boundingRect(with: CGSize.init(width: width, height: CGFloat.greatestFiniteMagnitude), options:.usesLineFragmentOrigin, attributes: attribute, context: nil).size
        return ceil(size.height)
    }
    
    func ty_width(height:CGFloat,font:UIFont) -> CGFloat {
        let attribute = [NSAttributedString.Key.font:font]
        let text = self as NSString
        let size = text.boundingRect(with: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: height), options:.usesLineFragmentOrigin, attributes: attribute, context: nil).size
        return ceil(size.height)
    }
}
