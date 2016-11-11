//
//  BannerView.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/11.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit

class BannerView: UIView {
    var itemNum:CGFloat!
    @IBOutlet weak var pageView: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    var itemList:Array<BannerModel>!{
        didSet{
            itemNum = CGFloat(itemList.count)
            scrollView.contentSize.width = ScreenWidth * itemNum
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func awakeFromNib() {
        self.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 292)
    }
    func addItems(){
        
        for (idx,item) in itemList.enumerated() {
            let imgView = UIImageView(frame: CGRect(x: CGFloat(idx) * ScreenWidth, y: 0, width: ScreenWidth, height: 292))
            imgView.image = UIImage(named: "banner6d99b4537a79")
            addSubview(imgView)
        }
    }
}
