//
//  SPTabBar.m
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/9/17.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPTabBar.h"
#import "UIView+Extension.h"

#import "SPTabBarViewController.h"
#import "SPTabBarSelectorView.h"

@interface SPTabBar ()

{
    UIView *_lastButton;
}

@property (nonatomic, strong) UIImageView *lastBg;

@property (nonatomic, weak, readonly) UIView *lastButton;

@end

@implementation SPTabBar

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundImage = [UIImage imageNamed:@"tabbar_bg"];
        self.selectionIndicatorImage = [UIImage imageNamed:@"tabbar_bg_down"];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    frame.size.height = self.backgroundImage.size.height;
    frame.origin.y = self.superview.bounds.size.height - frame.size.height;
    super.frame = frame;
}

- (void)setSelectedIndex:(NSUInteger)index {
    self.selectionIndicatorImage = ((index == 4) ? [UIImage imageNamed:@"tabbar_bg_down2"] : [UIImage imageNamed:@"tabbar_bg_down"]);
}

- (UIImageView *)lastBg {
    if (!_lastBg) {
        _lastBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_bg_with_arrow"]];
        [self insertSubview:_lastBg atIndex:1];
    }
    return _lastBg;
}

- (UIView *)lastButton {
    if (!_lastButton) {
        for (UIView *view in self.subviews) {
            NSString *className = NSStringFromClass(view.class);
            if ([className isEqualToString:@"UITabBarButton"]) {
                if (view.maxX > _lastButton.maxX) {
                    _lastButton = view;
                }
            }
        }
    }
    return _lastButton;
}

- (void)addTarget {
    UILongPressGestureRecognizer *rec = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(lastButtonLongPress:)];
    [self.lastButton addGestureRecognizer:rec];
}

- (void)lastButtonLongPress:(UILongPressGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        SPTabBarSelectorView *view = [[SPTabBarSelectorView alloc] initWithTabBarFrame:self.frame andSender:self.lastButton];
        [[UIApplication sharedApplication].windows.lastObject addSubview:view];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.width * 0.2;
    int index = 0;
    for (UIView *view in self.subviews) {
        NSString *className = NSStringFromClass(view.class);
        if ([className isEqualToString:@"UITabBarButton"]) {
            view.width = width;
            view.minX = index++ * width;
        }
    }
    self.lastBg.midY = self.midPoint.y;
    self.lastBg.toSuperViewRight = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self addTarget];
    });
}

@end
