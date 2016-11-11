//
//  CommendView.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/11.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit

class CommendView: UIView {
    var tableView:UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView = UITableView(frame: frame, style: UITableViewStyle.plain)
//        tableView.delegate = self;
        tableView.tableHeaderView = self.headerView
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    lazy var headerView:UIView = {
        
        return 
    }()
}
