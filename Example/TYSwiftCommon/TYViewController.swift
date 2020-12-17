//
//  ViewController.swift
//  TYSwiftCommon
//
//  Created by 785072254@qq.com on 12/15/2020.
//  Copyright (c) 2020 785072254@qq.com. All rights reserved.
//

import UIKit
import TYSwiftCommon

class TYViewController: UIViewController {
    var textView : UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "首页"
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13, *) {
            return .darkContent
        } else {
            return .default
        }
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let string = "11778778203"
        if string.ty_isPhoneNumber {
            print("aaaa")
        }else {
            print("bbb")
        }
    }
}

