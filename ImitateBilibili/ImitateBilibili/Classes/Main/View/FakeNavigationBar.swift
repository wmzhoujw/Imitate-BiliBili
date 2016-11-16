//
//  FakeNavigationBar.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/15.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit
import SnapKit
class FakeNavigationBar: UIView {
    var line:UIView!
    //btn点击的执行的闭包
    var btnClickClosure:((CGFloat)->Void)?
    
    static let subViewTitle = ["推荐","番剧","分区","关注","发现"]
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpSubTitle()
    }
    private func setUpSubTitle(){
        var count:CGFloat = 0.0
        for item in FakeNavigationBar.subViewTitle{
            
            let btn = UIButton.init(title: item)
            btn.setTitleColor(count == 0.0 ? UIColor.red : UIColor.white, for: UIControlState.normal)
            btn.tag = Int(count)+1
            addSubview(btn)
            //            btn.addTarget(self, action: Selector("btnClick:"), for: .touchUpInside)
            btn.addTarget(self, action: #selector(btnClick(sender:)), for: .touchUpInside)
            btn.snp_makeConstraints(closure: { (make) in
                make.width.equalTo(ScreenWidth/5)
                make.height.equalTo(40)
                //👇加 let _ 是为了处理警告⚠️
                let _ =  make.left.equalTo(ScreenWidth/5*count)
                let _ =  make.bottom.equalTo(self.snp_bottom).offset(-5)
            })
            count += 1
        }
        self.line = UIView()
        line.backgroundColor = UIColor.white
        addSubview(line)
        self.line.snp_makeConstraints { (make) in
            let _ = make.width.equalTo(ScreenWidth/5-CGFloat(20))
            let _ = make.height.equalTo(5)
            let _ = make.bottom.equalTo(self.snp_bottom)
            let _ = make.centerX.equalTo(self.viewWithTag(1)!.snp_centerX)
        }
    }
    func btnClick(sender:UIButton){
        
        print("22222")
        UIView.animate(withDuration: 0.25, animations: {
            self.line.transform = CGAffineTransform.init(translationX: ScreenWidth / 5.0, y: 0)
            if self.btnClickClosure != nil { self.btnClickClosure!(CGFloat(sender.tag - 1))}
        })
        self.changeColor(tag: sender.tag)

        
    }
    func changeColor(tag:Int){
        let btn = self.viewWithTag(tag) as! UIButton
        btn.setTitleColor(UIColor.gray, for: .normal)
        for bt in self.subviews{
            if bt.classForCoder is UIButton.Type{
                if bt === btn{
                    (bt as! UIButton).setTitleColor(UIColor.red, for: .normal)
                }else{
                    (bt as! UIButton).setTitleColor(UIColor.white, for: .normal)
                }
            }
        }
    }
    
}

