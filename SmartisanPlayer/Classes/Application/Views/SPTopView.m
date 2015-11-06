//
//  SPTopView.m
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/9/21.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPTopView.h"

@interface SPTopView ()

@property (nonatomic, weak) UIImageView *backgroundImageView;


@property (nonatomic, weak) UIView *topLine;

@property (nonatomic, weak) UIImageView *bottomLine;

@end

@implementation SPTopView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.backgroundImageView.width = self.width;
    self.backgroundImageView.height = self.height + 10;
    self.backgroundImageView.minY = -10;
    
    
    self.bottomLine.width = self.width;
    self.bottomLine.minY = self.height;
}

- (UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_cm_bg"]];
        [self insertSubview:backgroundImageView atIndex:0];
        _backgroundImageView = backgroundImageView;
    }
    return _backgroundImageView;
}

- (UIImageView *)bottomLine
{
    if (!_bottomLine) {
        UIImageView *bottomLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_shadow"]];
        bottomLine.height = 2.5;
        [self addSubview:bottomLine];
        _bottomLine = bottomLine;
    }
    return _bottomLine;
}

- (UIView *)topLine
{
    if (!_topLine) {
        UIView *topLine = [[UIView alloc] init];
        topLine.height = 1;
        topLine.backgroundColor = [UIColor colorWithRed:0.851 green:0.860 blue:0.860 alpha:1.000];
        [self addSubview:topLine];
        _topLine = topLine;
    }
    return _topLine;
}

@end
