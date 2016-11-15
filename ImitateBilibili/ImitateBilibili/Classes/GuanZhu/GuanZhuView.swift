//
//  FenQuView.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/15.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit

class GuanZhuView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.brown
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
