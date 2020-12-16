//
//  ViewController.swift
//  TYSwiftCommon
//
//  Created by 785072254@qq.com on 12/15/2020.
//  Copyright (c) 2020 785072254@qq.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var textView : UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView = UITextView.init(frame: CGRect.init(x: 10, y: 90, width: 200, height: 200));
        textView?.backgroundColor = UIColor.red
        textView?.ty_placeholder = "测试"
        self.view.addSubview(textView!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView?.t_text = "hahahaha";
    }
}

