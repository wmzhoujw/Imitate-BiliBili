//
//  XCCycleScrollView.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/17.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit
import SDCycleScrollView
class XCCycleScrollView: SDCycleScrollView {
    func setURLString(withArray array: [JSON]){
       var imgArr = [Any]()
        for value in array{
           imgArr.append(value["img"].stringValue)
        }
        self.imageURLStringsGroup = imgArr
    }
}
