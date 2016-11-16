 //
//  FanJvView.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/15.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit
class FanJvView:UIScrollView {
    var headView:FJHeaderView!
    
   override init(frame: CGRect) {
        super.init(frame: frame)
    headView = FJHeaderView.viewWithNib()
    
    headView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: headView.frame.height)
    addSubview(headView)
    self.contentSize = CGSize(width: ScreenWidth, height: 900)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
