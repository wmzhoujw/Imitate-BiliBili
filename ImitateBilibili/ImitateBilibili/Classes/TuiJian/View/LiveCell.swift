//
//  LiveCell.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/15.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit

class LiveCell: UITableViewCell {
    var dataList = [String:[LiveModel]](){
        didSet{
            self.setDistplay()
        }
    }
    @IBOutlet weak var titleBtn: UIButton!
    func setDistplay() {
        var view:LiveCellDetail!
        for (key,value) in dataList{
            for idx in 1...value.count{
                view = self.viewWithTag(idx)?.subviews.last as!LiveCellDetail
                
                view.dataModel = dataList[key]?[idx - 1]
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = UITableViewCellSelectionStyle.none
        for idx in [1,2,3,4]{
            
            let liveCellItem = self.viewWithTag(idx)
            let liveCellDetail = LiveCellDetail.cellWithNib()
            liveCellDetail.layer.cornerRadius = 5
            liveCellDetail.layer.masksToBounds = true
            liveCellDetail.frame = (liveCellItem?.bounds)!
            liveCellItem?.addSubview(liveCellDetail)
    }

    func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    }
}
