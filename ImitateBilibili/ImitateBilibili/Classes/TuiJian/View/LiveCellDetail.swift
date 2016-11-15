//
//  LiveCellDetail.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/15.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit
import SDWebImage
class LiveCellDetail: UIView {
    var dataModel:LiveModel!{
        didSet{
            self.setData()
        }
    }
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var title: UILabel!

    @IBOutlet weak var up: UILabel!
    @IBOutlet weak var online: UILabel!
    func setData(){
        self.coverImage.sd_setImage(with: URL(string: (self.dataModel?.cover)!))
        self.title.text = self.dataModel.title
        up.text = dataModel.up
//        online.text = dataModel.param
    }
    static func cellWithNib()->LiveCellDetail{
        return UINib.init(nibName: "LiveCellDetail", bundle: nil).instantiate(withOwner: nil, options: nil).last as! LiveCellDetail
    }
}
