//
//  FenQuView.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/15.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit

class FenQuView: UIView {
    var collectionView:UICollectionView!
    var collectionViewFlowLayout:UICollectionViewFlowLayout!
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionViewFlowLayout = UICollectionViewFlowLayout.init()
        collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenSize.height), collectionViewLayout: collectionViewFlowLayout)
        collectionViewFlowLayout.itemSize = CGSize(width: 100, height: 100)
        collectionViewFlowLayout.minimumInteritemSpacing = 30
        collectionViewFlowLayout.minimumLineSpacing = 10
        collectionView.backgroundColor = UIColor.white
        addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "FenQuViewCell", bundle: nil), forCellWithReuseIdentifier: FenQuViewCell.FenQuViewCellID)
    }
    lazy var modelArray: [FenQuModel] = {
        let path = Bundle.main.path(forResource: "SaCell.plist", ofType: nil)
        let arr = NSArray.init(contentsOfFile: path!)
        var tempArr:[FenQuModel] = []
        for item in arr!{
          tempArr.append(FenQuModel.init(dict: (item as! [String : AnyObject])))
        }
        return tempArr
    }()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension FenQuView:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.modelArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FenQuViewCell.FenQuViewCellID, for: indexPath) as! FenQuViewCell
        cell.dataModel = modelArray[indexPath.row]
        return cell
    }
}
