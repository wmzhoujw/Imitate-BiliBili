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
        
        for idx in 0...4{
            
        let tframe = CGRect(x: CGFloat(idx) * ScreenWidth, y: 0, width: ScreenWidth, height:ScreenSize.height - 114)
            switch idx {
            case 0:
                addSubview(CommendView(frame: tframe))
            case 1:
                addSubview(FanJvView(frame: tframe))
            case 2:
                addSubview(FenQuView(frame: tframe))
            case 3:
                addSubview(GuanZhuView(frame: tframe))
            case 4:
                addSubview(FaXianView(frame: tframe))
                self.contentSize = CGSize(width: 5 * ScreenWidth, height: tframe.height)
            default:break
            }
        }
        
    }
}
