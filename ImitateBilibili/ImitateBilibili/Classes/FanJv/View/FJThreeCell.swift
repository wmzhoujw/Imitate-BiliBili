//
//  FJThreeCell.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/17.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit

class FJThreeCell: UITableViewCell {
    
    @IBOutlet weak var adViewheight: NSLayoutConstraint!
    @IBOutlet weak var adImgView: UIImageView!
    var hide : Bool {
        didSet{
            if hide == true {
                adViewheight.constant = 0.0
            }else{
                adViewheight.constant = 95
            }
        }
    }
    var dataList:NSArray!{
        didSet{
            if dataList.count > 0{
                self.setData()

            }
        }
    }
    required init?(coder aDecoder: NSCoder) {
        self.hide = false
            super.init(coder: aDecoder)
    }
    func setData() {
        for idx in 1...3{
          let original  = self.viewWithTag(idx)
        let detailView = FJSixCellDetail.cellWithNib()
            detailView.dataModel = (dataList[idx - 1]) as! SerializingModel
        detailView.frame = (original?.bounds)!
            original?.addSubview(detailView)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
