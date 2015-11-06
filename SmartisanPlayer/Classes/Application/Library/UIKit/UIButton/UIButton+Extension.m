//
//  UIButton+Extension.m
//  Tools
//
//  Created by Magic_Unique on 15/9/10.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

#pragma mark - title

- (void)setTitleForDeselectNormal:(NSString *)titleForDeselectNormal {
    [self setTitle:titleForDeselectNormal forState:UIControlStateDeselectNormal];
}
- (void)setTitleForDeselectHighlighted:(NSString *)titleForDeselectHighlighted {
    [self setTitle:titleForDeselectHighlighted forState:UIControlStateDeselectHighlighted];
}
- (void)setTitleForSelectedNormal:(NSString *)titleForSelectedNormal {
    [self setTitle:titleForSelectedNormal forState:UIControlStateSelectedNormal];
}
- (void)setTitleForSelectedHighlighted:(NSString *)titleForSelectedHighlighted {
    [self setTitle:titleForSelectedHighlighted forState:UIControlStateSelectedHighlighted];
}
- (void)setTitleForDisabled:(NSString *)titleForDisabled {
    [self setTitle:titleForDisabled forState:UIControlStateDisabled];
}

- (NSString *)titleForDeselectNormal {
    return [self titleForState:UIControlStateDeselectNormal];
}
- (NSString *)titleForDeselectHighlighted {
    return [self titleForState:UIControlStateDeselectHighlighted];
}
- (NSString *)titleForSelectedNormal {
    return [self titleForState:UIControlStateSelectedNormal];
}
- (NSString *)titleForSelectedHighlighted {
    return [self titleForState:UIControlStateSelectedHighlighted];
}
- (NSString *)titleForDisabled {
    return [self titleForState:UIControlStateDisabled];
}

#pragma mark - title color

- (void)setTitleColorForDeselectNormal:(UIColor *)titleColorForDeselectNormal {
    [self setTitleColor:titleColorForDeselectNormal forState:UIControlStateDeselectNormal];
}
- (void)setTitleColorForDeselectHighlighted:(UIColor *)titleColorForDeselectHighlighted {
    [self setTitleColor:titleColorForDeselectHighlighted forState:UIControlStateDeselectHighlighted];
}
- (void)setTitleColorForSelectedNormal:(UIColor *)titleColorForSelectedNormal {
    [self setTitleColor:titleColorForSelectedNormal forState:UIControlStateSelectedNormal];
}
- (void)setTitleColorForSelectedHighlighted:(UIColor *)titleColorForSelectedHighlighted {
    [self setTitleColor:titleColorForSelectedHighlighted forState:UIControlStateSelectedHighlighted];
}
- (void)setTitleColorForDisabled:(UIColor *)titleColorForDisabled {
    [self setTitleColor:titleColorForDisabled forState:UIControlStateDisabled];
}

- (UIColor *)titleColorForDeselectNormal {
    return [self titleColorForState:UIControlStateDeselectNormal];
}
- (UIColor *)titleColorForDeselectHighlighted {
    return [self titleColorForState:UIControlStateDeselectHighlighted];
}
- (UIColor *)titleColorForSelectedNormal {
    return [self titleColorForState:UIControlStateSelectedNormal];
}
- (UIColor *)titleColorForSelectedHighlighted {
    return [self titleColorForState:UIControlStateSelectedHighlighted];
}
- (UIColor *)titleColorForDisabled {
    return [self titleColorForState:UIControlStateDisabled];
}

#pragma mark - image

- (void)setImageForDeselectNormal:(UIImage *)imageForDeselectNormal {
    [self setImage:imageForDeselectNormal forState:UIControlStateDeselectNormal];
}
- (void)setImageForDeselectHighlighted:(UIImage *)imageForDeselectHighlighted {
    [self setImage:imageForDeselectHighlighted forState:UIControlStateDeselectHighlighted];
}
- (void)setImageForSelectedNormal:(UIImage *)imageForSelectedNormal {
    [self setImage:imageForSelectedNormal forState:UIControlStateSelectedNormal];
}
- (void)setImageForSelectedHighlighted:(UIImage *)imageForSelectedHighlighted {
    [self setImage:imageForSelectedHighlighted forState:UIControlStateSelectedHighlighted];
}
- (void)setImageForDisabled:(UIImage *)imageForDisabled {
    [self setImage:imageForDisabled forState:UIControlStateDisabled];
}

- (UIImage *)imageForDeselectNormal {
    return [self imageForState:UIControlStateDeselectNormal];
}
- (UIImage *)imageForDeselectHighlighted {
    return [self imageForState:UIControlStateDeselectHighlighted];
}
- (UIImage *)imageForSelectedNormal {
    return [self imageForState:UIControlStateSelectedNormal];
}
- (UIImage *)imageForSelectedHighlighted {
    return [self imageForState:UIControlStateSelectedHighlighted];
}
- (UIImage *)imageForDisabled {
    return [self imageForState:UIControlStateDisabled];
}

#pragma mark - background image

- (void)setBackgroundImageForDeselectNormal:(UIImage *)backgroundImageForDeselectNormal {
    [self setBackgroundImage:backgroundImageForDeselectNormal forState:UIControlStateDeselectNormal];
}
- (void)setBackgroundImageForDeselectHighlighted:(UIImage *)backgroundImageForDeselectHighlighted {
    [self setBackgroundImage:backgroundImageForDeselectHighlighted forState:UIControlStateDeselectHighlighted];
}
- (void)setBackgroundImageForSelectedNormal:(UIImage *)backgroundImageForSelectedNormal {
    [self setBackgroundImage:backgroundImageForSelectedNormal forState:UIControlStateSelectedNormal];
}
- (void)setBackgroundImageForSelectedHighlighted:(UIImage *)backgroundImageForSelectedHighlighted {
    [self setBackgroundImage:backgroundImageForSelectedHighlighted forState:UIControlStateSelectedHighlighted];
}
- (void)setBackgroundImageForDisabled:(UIImage *)backgroundImageForDisabled {
    [self setBackgroundImage:backgroundImageForDisabled forState:UIControlStateDisabled];
}

- (UIImage *)backgroundImageForDeselectNormal {
    return [self backgroundImageForState:UIControlStateDeselectNormal];
}
- (UIImage *)backgroundImageForDeselectHighlighted {
    return [self backgroundImageForState:UIControlStateDeselectHighlighted];
}
- (UIImage *)backgroundImageForSelectedNormal {
    return [self backgroundImageForState:UIControlStateSelectedNormal];
}
- (UIImage *)backgroundImageForSelectedHighlighted {
    return [self backgroundImageForState:UIControlStateSelectedHighlighted];
}
- (UIImage *)backgroundImageForDisabled {
    return [self backgroundImageForState:UIControlStateDisabled];
}

@end
