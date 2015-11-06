//
//  SPAddItemView.m
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/9/18.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPAddItemView.h"

#import "UIView+Extension.h"
#import "UIButton+Extension.h"

@interface SPAddItemView ()



@end

@implementation SPAddItemView

- (instancetype)init
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.backgroundColor = [UIColor randomColor];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    frame.size.width = [UIScreen mainScreen].bounds.size.width;
    frame.size.height = 40;
    [super setFrame:frame];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.button.midY = self.midPoint.y;
    self.label.midY = self.midPoint.y;
    
    CGFloat margin = 10;
    margin = self.width - self.button.width - self.label.width - margin;
    margin *= 0.5;
    
    self.label.toSuperViewRight = margin;
    self.button.toSuperViewLeft = margin;
}


- (UIButton *)button
{
    if (!_button) {
        UIButton *button = [[UIButton alloc] init];
        button.imageForDeselectNormal = [UIImage imageNamed:@"btn_add"];
        button.imageForDeselectHighlighted = [UIImage imageNamed:@"btn_add_down"];
        [button sizeToFit];
        [self addSubview:button];
        _button = button;
    }
    return _button;
}

- (UILabel *)label
{
    if (!_label) {
        UILabel *label = [[UILabel alloc] init];
        label.text = @"新建播放列表";
        label.textColor = [UIColor colorWithRed:0.235 green:0.251 blue:0.255 alpha:1.000];
        [label sizeToFit];
        [self addSubview:label];
        _label = label;
    }
    return _label;
}

@end
