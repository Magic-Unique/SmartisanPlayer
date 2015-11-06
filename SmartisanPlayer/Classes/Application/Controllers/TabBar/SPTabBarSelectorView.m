//
//  SPTabBarSelectorView.m
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/10/13.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPTabBarSelectorView.h"

@interface SPTabBarSelectorView ()

@property (nonatomic, strong) UIImageView *topItemBg;
@property (nonatomic, strong) UIImageView *midItemBg;

@end

@implementation SPTabBarSelectorView

- (instancetype)initWithTabBarFrame:(CGRect)frame andSender:(UIView *)sender {
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        CGFloat width = sender.width;
        
        [self addSubview:self.midItemBg];
        self.midItemBg.width = width;
        self.midItemBg.toSuperViewRight = sender.toSuperViewRight;
        self.midItemBg.toSuperViewBottom = frame.size.height;
        
        [self addSubview:self.topItemBg];
        self.topItemBg.width = width;
        self.topItemBg.toSuperViewRight = sender.toSuperViewRight;
        [self.topItemBg setBottomToView:self.midItemBg withMargin:0];
    }
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self removeFromSuperview];
}

- (UIImageView *)topItemBg {
    if (!_topItemBg) {
        _topItemBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_bg_down4"]];
    }
    return _topItemBg;
}

- (UIImageView *)midItemBg {
    if (!_midItemBg) {
        _midItemBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_bg_down3"]];
    }
    return _midItemBg;
}

@end
