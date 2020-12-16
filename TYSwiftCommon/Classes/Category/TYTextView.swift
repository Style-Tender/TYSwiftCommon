//
//  TYTextView.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/16.
//

import UIKit

public extension UITextView {
    var ty_placeholder : String? {
        get{
            let placeHolder = objc_getAssociatedObject(self, &TYTextViewKeys.kPlaceholderKey)
            return placeHolder as? String
        }
        set{
            objc_setAssociatedObject(self, &TYTextViewKeys.kPlaceholderKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            self.update_ex_placeholder()
        }
    }
    var ty_placeholderColor : UIColor {
        get{
             return self.ex_placeholderLabel.textColor
        }
        set{
            self.ex_placeholderLabel.textColor = newValue
        }
    }
    
    var t_text : String! {
        get{
            let text = objc_getAssociatedObject(self, &TYTextViewKeys.kText)
            return text as? String ?? ""
        }
        set{
            self.text = newValue
            objc_setAssociatedObject(self, &TYTextViewKeys.kText, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            self.update_ex_placeholder()
        }
    }
}

extension UITextView : UITextViewDelegate,TYSelfAware {
    
    static func awake() {
        swizzleMethod
    }
    private static let swizzleMethod: Void = {
        let originalSelector = #selector(layoutSubviews)
        let swizzledSelector = #selector(swizzled_layoutSubviews)
        swizzlingForClass(UITextView.self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
    }()
    @objc func swizzled_layoutSubviews() {
        swizzled_layoutSubviews()
        if self.ty_placeholder != nil {
            let textContainerInset = self.textContainerInset
            let lineFragmentPadding = self.textContainer.lineFragmentPadding
            
            let x = lineFragmentPadding + textContainerInset.left + self.layer.borderWidth
            let y = textContainerInset.top + self.layer.borderWidth
            let width = self.bounds.size.width - x - textContainerInset.right - 2 * self.layer.borderWidth
            let height = self.ex_placeholderLabel.sizeThatFits(CGSize.init(width: width, height: 0)).height
            self.ex_placeholderLabel.frame = CGRect.init(x: x, y: y, width: width, height: height)
        }
    }
    
    private struct TYTextViewKeys {
        static var kPlaceholderKey = "kPlaceholderKey"
        static var kPlaceholderLabel = "kPlaceholderLabel"
        static var kText = "kText"
    }
    private var ex_placeholderLabel : UILabel {
        get{
            var ex_placeholderLabel = objc_getAssociatedObject(self, &TYTextViewKeys.kPlaceholderLabel) as? UILabel
            guard ex_placeholderLabel != nil else {
                ex_placeholderLabel = UILabel.ty_init(textColor: UIColor.lightGray,font: UIFont.systemFont(ofSize: UIFont.systemFontSize))
                ex_placeholderLabel?.numberOfLines = 0
                objc_setAssociatedObject(self, &TYTextViewKeys.kPlaceholderLabel, ex_placeholderLabel, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                self.delegate = self
                return ex_placeholderLabel!
            }
            return ex_placeholderLabel!
        }
    }
    
    @objc private func update_ex_placeholder() {
        if self.text.count > 0 {
            self.ex_placeholderLabel.removeFromSuperview()
            return
        }
        self.ex_placeholderLabel.font = self.font == nil ? UIFont.systemFont(ofSize: UIFont.systemFontSize) : self.font
        self.ex_placeholderLabel.textAlignment = self.textAlignment
        self.ex_placeholderLabel.text = self.ty_placeholder
        self.insertSubview(self.ex_placeholderLabel, at: 0)
    }
    
    public func textViewDidChange(_ textView: UITextView) {
        self.update_ex_placeholder()
    }
}
