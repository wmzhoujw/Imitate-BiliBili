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
        
        let tframe = CGRect(x: 0, y: 0, width: frame.width, height:ScreenSize.height - 114)
        addSubview(CommendView(frame: tframe))
    }
}
