//
//  TYString.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/15.
//

import UIKit
import CommonCrypto

public extension String {
    var notEmpty : Bool {
        return (self as NSString).length != 0
    }
    
    var ty_url : URL? {
        return URL.init(string: self)
    }
    
    var ty_encode : String? {
        return self.addingPercentEncoding(withAllowedCharacters:.urlQueryAllowed)
    }
    
    var ty_md5 : String? {
        let utf8 = self.cString(using: .utf8)
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(utf8, CC_LONG(utf8!.count - 1), &digest)
        return digest.reduce("") { $0 + String(format:"%02x", $1) }
    }
    
    var ty_MD5 : String? {
        let utf8 = self.cString(using: .utf8)
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(utf8, CC_LONG(utf8!.count - 1), &digest)
        return digest.reduce("") { $0 + String(format:"%02X", $1) }
    }
    
    var ty_sha1:String? {
        let data = self.data(using: .utf8)!
        var digest = [UInt8](repeating: 0, count:Int(CC_SHA1_DIGEST_LENGTH))
        let newData = NSData.init(data: data)
        CC_SHA1(newData.bytes, CC_LONG(data.count), &digest)
        let output = NSMutableString(capacity: Int(CC_SHA1_DIGEST_LENGTH))
        for byte in digest {
            output.appendFormat("%02x", byte)
        }
        return output as String
    }
    
    var ty_SHA1:String? {
        let data = self.data(using: .utf8)!
        var digest = [UInt8](repeating: 0, count:Int(CC_SHA1_DIGEST_LENGTH))
        let newData = NSData.init(data: data)
        CC_SHA1(newData.bytes, CC_LONG(data.count), &digest)
        let output = NSMutableString(capacity: Int(CC_SHA1_DIGEST_LENGTH))
        for byte in digest {
            output.appendFormat("%02X", byte)
        }
        return output as String
    }
    
    var ty_isPhoneNumber:Bool {
        let regex = "^[1][3456789]\\d{9}$"
        let predicate = NSPredicate.init(format: "SELF MATCHES \(regex)")
        let isValid = predicate.evaluate(with: self)
        return isValid
    }
    
    var ty_isEmail:Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate.init(format: "SELF MATCHES \(regex)")
        let isValid = predicate.evaluate(with: self)
        return isValid
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
