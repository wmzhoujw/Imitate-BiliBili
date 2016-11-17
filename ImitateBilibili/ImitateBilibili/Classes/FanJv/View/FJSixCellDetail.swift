//
//  FJSixCellDetail.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/17.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit

class FJSixCellDetail: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var watchingCount: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subTitleLabel: UILabel!
    var dataModel:SerializingModel!{
        didSet{
            setData()
        }
    }
    func setData() {
        imageView.sd_setImage(with: URL.init(string: dataModel.cover))
        if let watch = dataModel.watchingCount {
         watchingCount.text = "\(watch)人在看"
        }
       
        titleLabel.text = dataModel.title
        if let newsIndex = dataModel.newestEpIndex{
            subTitleLabel.text = "更新至第\(newsIndex)话"
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
    static func cellWithNib() ->FJSixCellDetail{
    
    return UINib(nibName: "FJSixCellDetail", bundle: nil).instantiate(withOwner: nil, options: nil).last as! FJSixCellDetail
    }
}
