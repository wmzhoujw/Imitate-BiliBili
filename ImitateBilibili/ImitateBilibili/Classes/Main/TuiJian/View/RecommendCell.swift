//
//  RecommendCell.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/12.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit

class RecommendCell: UITableViewCell {
    var dataList = [String:[RecommendModel]](){
        didSet{
            self.setDistplay()
        }
    }
    func setDistplay() {
        var view:RecommendCellDetail!
            for (key,value) in dataList{
                for idx in 1...value.count{
                view = self.viewWithTag(idx)?.subviews.last as!RecommendCellDetail

                view.dataModel = dataList[key]?[idx - 1]
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = UITableViewCellSelectionStyle.none
        for idx in [1,2,3,4]{
            let recommendCell = self.viewWithTag(idx)
            let recommendCellDetail = RecommendCellDetail.cellWithNib()
            recommendCell?.frame = recommendCellDetail.bounds
            recommendCell?.addSubview(recommendCellDetail)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   static var height:CGFloat {
        get{
            return ScreenSize.height / 2
        }
    }
    
}
