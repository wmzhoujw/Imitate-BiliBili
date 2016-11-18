 //
 //  FanJvView.swift
 //  ImitateBilibili
 //
 //  Created by xiaochao on 2016/11/15.
 //  Copyright © 2016年 godchao. All rights reserved.
 //
 
 import UIKit
 import Alamofire
 import SDWebImage
 class FanJvView:UIView {
    var headView:FJHeaderView!
    var tableView:UITableView!
    var adURL:String!
    var result = NSMutableDictionary()
    static let SixCellID = "six"
    static let ThreeCellID = "three"
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        self.tableView = UITableView(frame: CGRect(x: 0, y:0, width: ScreenWidth, height: ScreenSize.height - 114), style: .plain)
        self.tableView.register(UINib.init(nibName: "FJSixCell", bundle: nil),forCellReuseIdentifier:FanJvView.SixCellID)
        self.tableView.register(UINib.init(nibName: "FJThreeCell", bundle: nil), forCellReuseIdentifier: FanJvView.ThreeCellID)
        headView = FJHeaderView.viewWithNib()

        let headHeight = ScreenWidth == 320 ? 230 :(ScreenWidth == 375 ? 250 : 270)
        headView.frame = CGRect(x: 0, y: 0, width: Int(ScreenWidth), height: headHeight)
        self.tableView.tableHeaderView = headView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.clear
        addSubview(tableView)
        self.requestNetwork()
        
    }
    //http://bangumi.bilibili.com/api/app_index_page_v4?build=3970&device=phone&mobi_app=iphone&platform=ios
    private func requestNetwork(){
        let url = URL(string: "http://bangumi.bilibili.com/api/app_index_page_v4?build=3970&device=phone&mobi_app=iphone&platform=ios")
        Alamofire.request(url!).responseJSON { (response) in
            let json = JSON(data: response.data!)
            var values = SerializingModel.modelArray(KeysValues: json["result"]["serializing"].array)
            self.result.addEntries(from: ["serializing":values])
            values = SerializingModel.modelArray(KeysValues: json["result"]["previous"]["list"].array)
            self.result.addEntries(from: ["previous":values])
            self.headView.scrollView.setURLString(withArray: json["result"]["ad"]["head"].array!)
            self.adURL = json["result"]["ad"]["body"][0]["img"].stringValue
            
            self.tableView.reloadData()
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 }
 extension FanJvView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count > 0 ? result.count : 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: FanJvView.SixCellID, for: indexPath)
            if let arr = self.result["serializing"]{
                (cell as!FJSixCell).dataList = arr as! NSArray
            }
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: FanJvView.ThreeCellID, for: indexPath)
            (cell as! FJThreeCell).adImgView.sd_setImage(with: URL.init(string: self.adURL)!)
            if let arr = self.result["previous"]{
                (cell as! FJThreeCell).dataList = arr as! NSArray
            }
        default:
            return UITableViewCell()
        }
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return FJSixCell.height
    }
 }
