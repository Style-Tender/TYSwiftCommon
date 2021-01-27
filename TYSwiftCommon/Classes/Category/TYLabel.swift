//
//  TYLabel.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/15.
//

import UIKit

public extension UILabel {
    class func ty_init(title:String? = "",
                       textColor:UIColor? = .black,
                       backgroundColor:UIColor? = .clear,
                       font:UIFont? = UIFont.systemFont(ofSize: UIFont.systemFontSize)) -> UILabel {
        let label = UILabel.init()
        label.text = title
        label.textColor = textColor
        label.font = font
        label.backgroundColor = backgroundColor
        return label
    }
    
    func ty_setLineHeight(_ height:CGFloat) {
        if self.text != nil {
            let paragraphStyle = NSMutableParagraphStyle.init()
            paragraphStyle.lineSpacing = height - (self.font.lineHeight - self.font.pointSize)
            let attributes = [NSAttributedString.Key.paragraphStyle:paragraphStyle]
            self.attributedText = NSAttributedString.init(string: self.text!, attributes: attributes)
            self.lineBreakMode = .byTruncatingTail
        }
    }
    
    func ty_addCenterLine() {
        if self.text != nil {
            
            let attributes = [
                NSAttributedString.Key.strikethroughStyle:1,
                NSAttributedString.Key.foregroundColor:rgba(153, 153, 153, 1)
            ] as [NSAttributedString.Key : Any]
            self.attributedText = NSAttributedString.init(string: self.text!, attributes: attributes)
            self.lineBreakMode = .byTruncatingTail
            
        }
    }
}
