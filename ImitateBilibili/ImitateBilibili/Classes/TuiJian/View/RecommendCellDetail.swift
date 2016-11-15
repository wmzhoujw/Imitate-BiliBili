//
//  RecommendCellDetail.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/14.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit
import SDWebImage
class RecommendCellDetail: UIView {
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var playCount: UILabel!
    @IBOutlet weak var danmuku: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    var dataModel:RecommendModel?{
        didSet{
            setData()
        }
    }
    // MARK: - 设置数据
    func setData(){
        self.coverImage.sd_setImage(with: URL(string: (self.dataModel?.cover)!))
        self.title.text = self.dataModel?.title
        self.playCount.text = self.dataModel?.play
        self.danmuku.text = self.dataModel?.danmaku
    }
    static func cellWithNib()->RecommendCellDetail{
        return UINib.init(nibName: "RecommendCellDetail", bundle: nil).instantiate(withOwner: nil, options: nil).last as! RecommendCellDetail
    }
}
