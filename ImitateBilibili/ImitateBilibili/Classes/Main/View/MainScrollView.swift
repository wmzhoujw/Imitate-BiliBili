//
//  MainScrollView.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/11.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit
class MainScrollView:UIScrollView  {
    override func awakeFromNib() {
        addSubview(CommendView(frame: self.bounds))
    }
}
