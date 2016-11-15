//
//  CommendView.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/11.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit
import SDCycleScrollView
import Alamofire
import MJExtension
class CommendView: UIView ,SDCycleScrollViewDelegate{
    var tableView:UITableView!
    var bannaerList:NSMutableArray!
    var CommendDataList:NSMutableArray = NSMutableArray()
    static let RecommendID = "recommendCell"
    static let LiveID = "liveid"
    static let CellTitle = ["热门推荐","正在直播","番剧推荐","动画区","话题","音乐区","舞蹈区","游戏区","鬼畜区"]
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: frame.size.height), style: UITableViewStyle.plain)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = self.headerView
        tableView.register(UINib.init(nibName: "RecommendCell", bundle: nil), forCellReuseIdentifier: CommendView.RecommendID)
        tableView.register(UINib.init(nibName: "LiveCell", bundle: nil), forCellReuseIdentifier: CommendView.LiveID)
        addSubview(tableView)
        //URL图片数组
        self.headerView.imageURLStringsGroup = []
        self.headerView.clickItemOperationBlock = { tag in
            print("点击了第\(tag)张图片")
        }
        var url = URL(string: "http://app.bilibili.com/x/banner?plat=4&build=428003")
        //        http://app.bilibili.com/x/banner?plat=4&build=428003&channel=xiaomi
        // MARK: - Banner 请求
        Alamofire.request(url!).responseJSON { (DataResponse) in
            print(DataResponse.response)
            if let JSON:[String:Any] = DataResponse.result.value as! [String : Any]? {
                print("JSON: \(JSON)")
                self.bannaerList = BannerModel.mj_objectArray(withKeyValuesArray: JSON["data"])
                var imageList = [String]()
                for model in self.bannaerList.enumerated(){
                    let tm = model.element as! BannerModel
                    imageList.append(tm.image)
                }
                self.headerView.imageURLStringsGroup = imageList
            }
        }
        // MARK: - 内容请求
        url = URL(string: "http://app.bilibili.com/x/show/old?appkey=1d8b6e7d45233436&build=428003&channel=xiaomi&mobi_app=android&platform=android&screen=xxhdpi&ts=1479092399000&sign=11b9765825b38121b210ee0995238ddc")
        Alamofire.request(url!).responseJSON { (response) in
            
            let json = JSON(data: response.data!)
            if let JSON:[String:Any] = response.result.value as! [String : Any]?{
                print("===================================JSON======================")
                
                print(JSON)
                for idx in 0...19{
//                let arrayItem = tempArray[idx] as! Dictionary<String,AnyObject>
                    let arrayItem = json["result"][idx].dictionary
                    var value:Any!
                    var tkey:String!
                    switch idx % 2{
                    case 0:
                         value = RecommendModel.mj_objectArray(withKeyValuesArray: arrayItem?["body"]?.arrayObject)
                        tkey = (arrayItem?["head"]?["title"].stringValue)!
                    case 1:
                         value = LiveModel.mj_objectArray(withKeyValuesArray: arrayItem?["body"]?.arrayObject)
                         tkey = (arrayItem?["head"]?["title"].stringValue)!
                    default:
                        break
                    }
        
                    
                self.CommendDataList.add([tkey:value])
                self.tableView.reloadData()
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }

    lazy var headerView:SDCycleScrollView = {
        let cycleScrollView:SDCycleScrollView = SDCycleScrollView.init(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 100), delegate: self, placeholderImage: UIImage.init(named:"bannerplaceholder"))
        cycleScrollView.currentPageDotColor = UIColor.red
        cycleScrollView.pageDotColor = UIColor.white
        cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic
        return cycleScrollView
    }()
    
}
extension CommendView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row % 2{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CommendView.RecommendID, for: indexPath) as! RecommendCell
            cell.dataList = self.CommendDataList[0]  as! [String : [RecommendModel]]
            
            if indexPath.row < CommendView.CellTitle.count {
                cell.titleBtn.setTitle(CommendView.CellTitle[indexPath.row], for: .normal)
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: CommendView.LiveID, for: indexPath) as! LiveCell
            cell.dataList = self.CommendDataList[1]  as! [String : [LiveModel]]
            if indexPath.row < CommendView.CellTitle.count {
                cell.titleBtn.setTitle(CommendView.CellTitle[indexPath.row], for: .normal)

            }
            return cell
            
        default:
            return UITableViewCell()
            
            }
            
        }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.CommendDataList.count > 0 {
            return self.CommendDataList.count
        }else{
            return 0
        }
}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(tableView,indexPath)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RecommendCell.height 
    }

}
