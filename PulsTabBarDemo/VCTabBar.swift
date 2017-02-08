//
//  VCTabBar.swift
//  PulsTabBarDemo
//
//  Created by Apple on 2017/2/8.
//  Copyright © 2017年 Vic. All rights reserved.
//

import UIKit

@objc protocol VCDelegate {
    @objc optional func tabBarCenterBtnClick()
}

class VCTabBar: UITabBar {

    var cenBtn : UIButton?
    var cDelegate : VCDelegate?
    var titleText : String?
    var index : CGFloat?
    var itemCount : CGFloat?
    
    
    /// 重写初始化方法
    ///
    /// - Parameters:
    ///   - frame: frame
    ///   - titleText: 中间文字/（Optional）
    ///   - index: 中间按钮的位置 / 0开始~
    ///   - itemCount: tabbar总数/ 包括中间按钮
    init(frame: CGRect, titleText: String, index: CGFloat, itemCount: CGFloat) {
        super.init(frame: frame)
        self.titleText = titleText
        self.index = index
        self.itemCount = itemCount
        self.backgroundColor = UIColor.white;
        createCenterBtn()
    }
    
    func createCenterBtn(){
        cenBtn = UIButton(type: .custom)
        cenBtn?.setBackgroundImage(UIImage(named:"center_tabbar"), for: .normal)
        cenBtn?.setBackgroundImage(UIImage(named:"center_tabbar"), for: .highlighted)
        self.addSubview(cenBtn!)
        cenBtn?.addTarget(self, action: #selector(self.centerBtnCilck), for: UIControlEvents.touchDown)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let btnFrame = CGRect(x: (cenBtn?.frame.origin.x)!, y: (cenBtn?.frame.origin.y)!, width: (cenBtn?.currentBackgroundImage?.size.width)!, height: (cenBtn?.currentBackgroundImage?.size.height)!)
        cenBtn?.frame = btnFrame;
        cenBtn?.center = CGPoint(x: self.center.x, y: self.frame.size.height*0.5 - 20)
        if titleText != nil {
            let lable = UILabel()
            lable.text = titleText
            lable.font = UIFont.systemFont(ofSize: 11)
            lable.sizeToFit()
            lable.textColor = UIColor.gray
            self.addSubview(lable)
            lable.center = CGPoint(x: (cenBtn?.center.x)!, y: (cenBtn?.frame.maxY)! + 10)
        }
        
        
        var btnIndex:CGFloat = 0;
        let btnWidth = self.bounds.width/itemCount!
        for btn in self.subviews {
            if btn.isKind(of: NSClassFromString("UITabBarButton")!) {
                
                var btnRect = btn.frame;
                btnRect.size.width = btnWidth;
                btnRect.origin.x = btnRect.size.width * btnIndex;
                btn.frame = btnRect;
                
                btnIndex += 1
                if btnIndex == index! {
                    btnIndex += 1
                }
            }
        }
        
        self.bringSubview(toFront: cenBtn!)
    }
    
    func centerBtnCilck(btn:UIButton){
        if (delegate?.responds(to: #selector(VCDelegate.tabBarCenterBtnClick)))!{
            cDelegate?.tabBarCenterBtnClick!()
        }
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !self.isHidden {
            let newP = self.convert(point, to: cenBtn)
            
            if (cenBtn?.point(inside: newP, with: event))! {
                return cenBtn
            }else{
                return super.hitTest(point, with: event)
            }
        }else{
            return super.hitTest(point, with: event)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
