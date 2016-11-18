//
//  MainViewController.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/15.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit
import SnapKit
class MainViewController: UIViewController {
    @IBOutlet weak var navgationBar: FakeNavigationBar!
    @IBOutlet weak var mainScrollView: MainScrollView!

    override func loadView() {
        super.loadView()
        //设置启动动画
        self.initialAnimation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //切换subView
        navgationBar.btnClickClosure = { (tag)  in
            self.mainScrollView.contentOffset = CGPoint(x: tag * ScreenWidth, y: 0)
        }
        mainScrollView.delegate = self
        // Do any additional setup after loading the view.
        
    }
    // MARK: - 设置启动动画
    private func initialAnimation(){
        let imgView = UIImageView.init(image: UIImage.init(named: "bilibili_splash_default"))
       
        let newSize = imgView.bounds.size
        imgView.frame.size = CGSize(width: 0, height: 0)
        let bgView = UIImageView.init(image: UIImage.init(named: "bilibili_splash_iphone_bg"))
        bgView.frame = view.frame
        view.addSubview(bgView)
         bgView.addSubview(imgView)
        
         imgView.center = view.center
        UIView.animate(withDuration: 0.5, animations: {
            imgView.bounds.size = newSize
        }, completion: {(bool) in
            UIView.animate(withDuration: 2, animations: {
                bgView.alpha = 0
                bgView.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.2, 1.2, 1);

            }, completion: { (bool) in
                bgView.removeFromSuperview()
            })
        })
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
// MARK: - UIScrollViewDelegate
extension MainViewController:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(mainScrollView.contentOffset.x)
//        print(mainScrollView.contentOffset.x / 5.0)
        navgationBar.line.transform = CGAffineTransform.init(translationX: mainScrollView.contentOffset.x / 5.0, y: 0)
    }
    //Tells the delegate that the scroll view has ended decelerating the scrolling movement.
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        navgationBar.changeColor(tag:Int(mainScrollView.contentOffset.x / ScreenWidth + 1))
    }
}
