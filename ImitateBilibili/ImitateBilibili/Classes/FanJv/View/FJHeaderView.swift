//
//  FJHeaderView.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/16.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit

class FJHeaderView: UIView {
    var btnTitleImageDic = ["连载动画":"bangumi_unfinished","完结动画":"bangumi_finished","国产动画":"hd_bangumi_hot","官方延伸":"home_search_icon_bangumi"]


    override func awakeFromNib() {
        super.awakeFromNib()
        var count:CGFloat = 0
        for (title,imgStr) in btnTitleImageDic{
            let btn = UIButton.init(imageName: imgStr, title: title)
            let view = self.viewWithTag(4)
            view?.addSubview(btn)
//            let label = UILabel()
//            label.text = btn.titleLabel?.text
//            label.sizeToFit()
//            let labelWidth = label.frame.width
////            btn.imageEdgeInsets = UIEdgeInsetsMake(0,labelWidth,0,-labelWidth)
////            btn.titleEdgeInsets = UIEdgeInsetsMake(0,labelWidth,0,-labelWidth)
            btn.snp_makeConstraints(closure: { (make) in
              let _ =  make.width.equalTo(ScreenWidth/4)
                make.height.equalTo(view!)
                make.left.equalTo(ScreenWidth/4*count)
                make.bottom.equalTo(view!)
            })
            count += 1
        }
       
        
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
