//
//  UIButton+expand.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/15.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit
extension UIButton{
    convenience init(name:String) {
        self.init()
        self.setTitle(name, for: .normal)
    }

}
