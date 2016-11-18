//
//  FenQuViewCell.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/17.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit

class FenQuViewCell: UICollectionViewCell {
    
    static let FenQuViewCellID:String = "reuseid"

    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    var dataModel:FenQuModel!{
        didSet{
            setData()
        }
    }
    
    func setData(){
       icon.image = UIImage.init(named: dataModel.icon!)
        name.text = dataModel.name
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
