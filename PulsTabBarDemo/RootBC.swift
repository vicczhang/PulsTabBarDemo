//
//  RootBC.swift
//  PulsTabBarDemo
//
//  Created by Apple on 2017/2/8.
//  Copyright © 2017年 Vic. All rights reserved.
//

import UIKit

class RootBC: UITabBarController,VCDelegate {

    override class func initialize(){
        
        let tabBarItem = UITabBarItem.appearance(whenContainedInInstancesOf: [self])
        tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.gray,NSFontAttributeName:UIFont.systemFont(ofSize: 11)], for: .normal)
        tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.darkGray,NSFontAttributeName:UIFont.systemFont(ofSize: 11)], for: .selected)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let msgVC = MsgVC()
        configVC(vc: msgVC, titleString: "消息", defImg: "message_normal", selImg: "message_highlight")
        
        let cityVC = CityVC()
        configVC(vc: cityVC, titleString: "位置", defImg: "city_normal", selImg: "city_highlight")
        
        let tabbar = VCTabBar(frame: self.tabBar.frame, titleText: "发布", index: 1, itemCount: 3)
        tabbar.cDelegate = self
        self.setValue(tabbar, forKey: "tabBar")
    }

    func configVC(vc:UIViewController, titleString:String, defImg:String,selImg:String){
        
        vc.tabBarItem.title = titleString
        vc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3)
        vc.automaticallyAdjustsScrollViewInsets = false
        
        vc.tabBarItem.image = UIImage(named: defImg)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: selImg)?.withRenderingMode(.alwaysOriginal)
        
        let navi = RootNC(rootViewController: vc)
        navi.navigationBar.isTranslucent = false
        navi.navigationBar.shadowImage = UIImage()
        navi.navigationBar.tintColor = UIColor.black
        self.addChildViewController(navi)
    }
    
    func tabBarCenterBtnClick(){
        NSLog("---CenterButtonClick---");
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
