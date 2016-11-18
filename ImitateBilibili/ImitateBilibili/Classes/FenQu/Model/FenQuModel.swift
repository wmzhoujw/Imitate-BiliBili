//
//  FenQuModel.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/17.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit

class FenQuModel: NSObject {
    var name:String!
    var icon:String!
    init(dict:[String:AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
     func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
    
}
