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
        collectionViewFlowLayout.itemSize = CGSize(width: ScreenWidth / 4, height: ScreenWidth / 4)
        collectionViewFlowLayout.minimumInteritemSpacing = 10
        collectionViewFlowLayout.minimumLineSpacing = 20
        collectionView.backgroundColor = UIColor.white
        addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "FenQuViewCell", bundle: nil), forCellWithReuseIdentifier: FenQuViewCell.FenQuViewCellID)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension FenQuView:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: FenQuViewCell.FenQuViewCellID, for: indexPath)
    }
}
