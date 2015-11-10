//
//  SPSearchLoadMoreButton.m
//  SmartisanPlayer
//
//  Created by 吴双 on 15/9/20.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPSearchLoadMoreButton.h"

@interface SPSearchLoadMoreButton ()

@property (nonatomic, weak) UIButton *button;
@property (nonatomic, weak) UIActivityIndicatorView *indicatorView;

@end

@implementation SPSearchLoadMoreButton

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
    
    self.button.titleForDeselectNormal = (self.state == SPSearchLoadMoreButtonStateDisable) ? @"已经没有更多了" : @"点击加载更多";
    
    self.button.center = self.midPoint;
    self.indicatorView.midY = self.button.midY;
    self.indicatorView.maxX = self.button.minX;
    
    switch (self.state) {
        case SPSearchLoadMoreButtonStateNone:
            [self.indicatorView stopAnimating];
            self.button.hidden = YES;
            break;
        case SPSearchLoadMoreButtonStateDisable:
            [self.indicatorView stopAnimating];
            self.button.hidden = NO;
            self.button.enabled = NO;
            break;
        case SPSearchLoadMoreButtonStateNormal:
            [self.indicatorView stopAnimating];
            self.button.hidden = NO;
            self.button.selected = NO;
            break;
        case SPSearchLoadMoreButtonStateLoading:
            [self.indicatorView startAnimating];
            self.button.hidden = NO;
            self.button.selected = YES;
            break;
        default:
            break;
    }
}

- (void)startRefresh {
    self.state = SPSearchLoadMoreButtonStateLoading;
    [self setNeedsLayout];
}

- (void)stopRefresh {
    self.state = SPSearchLoadMoreButtonStateNormal;
    [self setNeedsLayout];
}

#pragma mark - target selector

- (void)buttonClick:(UIButton *)button {
    if (button.isSelected) {
        return;
    }
    if ([self.delegate respondsToSelector:@selector(loadMoreButtonClick:)]) {
        [self.delegate loadMoreButtonClick:self];
    }
}

#pragma mark - view lazy load 

- (UIButton *)button {
    if (!_button) {
        UIButton *button = [[UIButton alloc] init];
        button.tintColor = [UIColor grayColor];
        button.titleForDeselectNormal = @"已经没有更多了";//最长的字符串, 用于制作sizeToFit, 之后State会被刷新成None, 对应button的title为"点击加载更多"
        button.titleForDeselectHighlighted = @"点击加载更多";
        
        button.titleForSelectedNormal = @"加载中...";
        button.titleForSelectedHighlighted = @"加载中...";
        
        button.titleColorForDeselectNormal = [UIColor grayColor];
        [button sizeToFit];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        _button = button;
    }
    return _button;
}

- (UIActivityIndicatorView *)indicatorView {
    if (!_indicatorView) {
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        indicatorView.hidesWhenStopped = YES;
        [self addSubview:indicatorView];
        _indicatorView = indicatorView;
    }
    return _indicatorView;
}

- (void)setState:(SPSearchLoadMoreButtonState)state {
    _state = state;
    [self setNeedsLayout];
}

@end
