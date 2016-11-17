//
//  FJSixCell.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/17.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit

class FJSixCell: UITableViewCell {
    var dataList = NSArray(){
        didSet{
            self.setData()
        }
    }
    private func setData(){
        for tag in 1...6{
            let original = self.viewWithTag(tag)?.subviews.last as!FJSixCellDetail
            original.dataModel = dataList[tag - 1] as!SerializingModel
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        for tag in 1...6 {
            let detailCell = FJSixCellDetail.cellWithNib()
            let original = self.viewWithTag(tag)
            detailCell.frame = (original?.bounds)!
            original?.addSubview(detailCell)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static var height:CGFloat{
        get{
            let a = UINib.init(nibName: "FJSixCell", bundle: nil).instantiate(withOwner: nil, options: nil).last as! FJSixCell
            
            return a.frame.height
        }
    }
    
}
