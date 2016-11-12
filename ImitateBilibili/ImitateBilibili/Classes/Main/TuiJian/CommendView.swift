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
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: frame.size.height), style: UITableViewStyle.plain)
//        tableView.delegate = self;
        tableView.tableHeaderView = self.headerView
        addSubview(tableView)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }

    lazy var headerView:BannerView = {
        let nib:BannerView = UINib.init(nibName: "BannerView", bundle: nil).instantiate(withOwner: nil, options: nil).last as! BannerView
        return nib
    }()
}
