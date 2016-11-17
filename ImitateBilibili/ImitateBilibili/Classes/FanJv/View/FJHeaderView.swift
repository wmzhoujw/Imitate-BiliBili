//
//  FJHeaderView.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/16.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit
import SDCycleScrollView
class FJHeaderView: UIView {
    var btnTitleImageDic = ["连载动画":"bangumi_unfinished","完结动画":"bangumi_finished","国产动画":"hd_bangumi_hot","官方延伸":"home_search_icon_bangumi"]
    var scrollView:XCCycleScrollView!
    override func awakeFromNib() {
        super.awakeFromNib()

        var count:CGFloat = 0
        // MARK: - 处理navbar
        for (title,imgStr) in btnTitleImageDic{
            let item = FJNavItem.itemWithNib()
            item.setTitle(title: title, image: UIImage.init(named: imgStr)!)
            let navbar = self.viewWithTag(4)
            navbar?.addSubview(item)
            navbar?.snp_makeConstraints { (make) in
                make.height.equalTo(ScreenWidth / 4)
            }
            item.snp_makeConstraints(closure: { (make) in
             make.width.height.equalTo(ScreenWidth/4)
                make.left.equalTo(ScreenWidth/4*count)
                make.bottom.equalTo(navbar!)
            })
            count += 1
        }
        
    self.scrollView = self.viewWithTag(10) as! XCCycleScrollView
    scrollView.delegate = self
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    class func viewWithNib() ->FJHeaderView{
        return UINib.init(nibName: "FJHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).last as! FJHeaderView
    }
}
extension FJHeaderView:SDCycleScrollViewDelegate{
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        print("点击了第\(index)张图")
    }
}
