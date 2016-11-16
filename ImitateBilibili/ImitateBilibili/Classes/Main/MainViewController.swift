//
//  MainViewController.swift
//  ImitateBilibili
//
//  Created by xiaochao on 2016/11/15.
//  Copyright © 2016年 godchao. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var navgationBar: FakeNavigationBar!
    @IBOutlet weak var mainScrollView: MainScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //切换subView
        navgationBar.btnClickClosure = { (tag)  in
            self.mainScrollView.contentOffset = CGPoint(x: tag * ScreenWidth, y: 0)
        }
        mainScrollView.delegate = self
        // Do any additional setup after loading the view.
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
