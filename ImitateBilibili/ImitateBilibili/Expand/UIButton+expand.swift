//
//  UIButton+expand.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/15.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit
extension UIButton{
    convenience init(title:String) {
        self.init()
        self.setTitle(title, for: .normal)
    }
    convenience init(imageName:String,title:String) {
        self.init(title:title)
        self.setImage(UIImage.init(named: imageName), for: UIControlState.normal)
    }

}
