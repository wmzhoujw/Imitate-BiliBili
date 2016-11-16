//
//  XCButton.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/16.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit
class XCButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 3
        self.layer.masksToBounds = true
    }
}
