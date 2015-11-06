//
//  UINavigationBar+Extension.m
//  Tools
//
//  Created by Magic_Unique on 15/8/21.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "UINavigationBar+Extension.h"
#import "UIImage+Extension.h"


@implementation UINavigationBar (Extension)

- (void)setAlphaBackgroundColor:(UIColor *)color {
    self.translucent = YES;
    UIImage *backgroundImage = [UIImage imageWithColor:color andSize:self.frame.size];
    [self setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    UIImage *shadowImage = [UIImage imageWithColor:color andSize:CGSizeMake(self.frame.size.width, 2)];
    [self setShadowImage:shadowImage];
}

////    CGFloat r,g,b,a;
////    [color getRed:&r green:&g blue:&b alpha:&a];
//    if (a == 1) {
//        //        [self setShadowImage:_createShadowImage];
//    } else {
//        //        UIImage *shadowImage = [UIImage imageWithColor:[UIColor clearColor] andSize:CGSizeMake(self.frame.size.width, 1)];
//        //        [self setShadowImage:shadowImage];
//    }

@end
