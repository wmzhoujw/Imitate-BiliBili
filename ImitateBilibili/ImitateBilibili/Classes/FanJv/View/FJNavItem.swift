//
//  FJNavItem.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/17.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit

class FJNavItem: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setTitle(title:String,image:UIImage) {
        imageView.image = image
        titleLabel.text = title
    }
    @IBAction func btnClick(_ sender: UIButton) {
        print("xxxx")
    }
    static func itemWithNib()->FJNavItem{
        let temp = UINib(nibName: "FJNavItem", bundle: nil).instantiate(withOwner: nil, options: nil)
        return temp.last as! FJNavItem
    }


}
