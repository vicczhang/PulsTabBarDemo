//
//  OBJCTabBar.h
//  PulsTabBarDemo
//
//  Created by Apple on 2017/2/17.
//  Copyright © 2017年 Vic. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OBJCDelegate
@optional
- (void)objcTabBarCenterBtnClick;
@end


@interface OBJCTabBar : UITabBar

/**
 重写初始化方法

 @param frame frame
 @param title 中间文字/（Optional）
 @param index 中间按钮的位置 / 0开始~
 @param itemCount tabbar总数/ 包括中间按钮
 @return OBJCTabBar
 */
- (instancetype)initWithFrame:(CGRect)frame
                    titleText:(NSString *)title
                        index:(NSInteger)index
                    itemCount:(NSInteger)itemCount;

@property (nonatomic, strong)id<OBJCDelegate> objcDelegate;
@end
