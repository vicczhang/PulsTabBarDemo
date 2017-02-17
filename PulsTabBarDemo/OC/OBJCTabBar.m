//
//  OBJCTabBar.m
//  PulsTabBarDemo
//
//  Created by Apple on 2017/2/17.
//  Copyright © 2017年 Vic. All rights reserved.
//

#import "OBJCTabBar.h"

@interface OBJCTabBar ()
@property (nonatomic, strong)UIButton* cenBtn;
@property (nonatomic, copy)NSString* title;
@property (nonatomic, assign)NSInteger index;
@property (nonatomic, assign)NSInteger itemCount;
@end

@implementation OBJCTabBar

- (instancetype)initWithFrame:(CGRect)frame
                    titleText:(NSString *)title
                        index:(NSInteger)index
                    itemCount:(NSInteger)itemCount{
    if (self = [super initWithFrame:frame]) {
        self.title = title;
        self.index = index;
        self.itemCount = itemCount;
        self.backgroundColor = [UIColor whiteColor];
        
        [self.cenBtn addTarget:self action:@selector(centerBtnCilck:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect btnFrame = _cenBtn.frame;
    btnFrame.size.width = _cenBtn.currentBackgroundImage.size.width;
    btnFrame.size.height = _cenBtn.currentBackgroundImage.size.height;
    _cenBtn.frame = btnFrame;
    _cenBtn.center = CGPointMake(self.center.x, self.frame.size.height*0.5 - 20);
    
    if (self.title) {
        UILabel* label = [UILabel new];
        label.text = _title;
        label.font = [UIFont systemFontOfSize:11];
        label.textColor = [UIColor grayColor];
        [label sizeToFit];
        [self addSubview:label];
        label.center = CGPointMake(_cenBtn.center.x, CGRectGetMaxY(_cenBtn.frame) + 10);
    }
    
    NSInteger btnIndex = 0;
    CGFloat btnWidth = self.bounds.size.width/_itemCount;
    for (UIView* btnView in self.subviews) {
        if ([btnView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            CGRect btnRect = btnView.frame;
            btnRect.size.width = btnWidth;
            btnRect.origin.x = btnWidth * btnIndex;
            btnView.frame = btnRect;
            btnIndex++;
            if (btnIndex == _index) {
                btnIndex++;
            }
        }
    }
    [self bringSubviewToFront:_cenBtn];
}


- (UIButton *)cenBtn{
    if (!_cenBtn) {
        _cenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cenBtn setBackgroundImage:[UIImage imageNamed:@"center_tabbar"] forState:UIControlStateNormal];
        [_cenBtn setBackgroundImage:[UIImage imageNamed:@"center_tabbar"] forState:UIControlStateHighlighted];
        [self addSubview:_cenBtn];
    }
    return _cenBtn;
}

- (void)centerBtnCilck:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(objcTabBarCenterBtnClick)]) {
        [_objcDelegate objcTabBarCenterBtnClick];
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (self.hidden) {
        CGPoint newPoint = [self convertPoint:point toView:_cenBtn];
        if ([_cenBtn pointInside:newPoint withEvent:event]) {
            return _cenBtn;
        }
    }
    return [super hitTest:point withEvent:event];
}

@end
