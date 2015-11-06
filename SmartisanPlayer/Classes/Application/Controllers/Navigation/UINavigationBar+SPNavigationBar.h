//
//  UINavigationBar+SPNavigationBar.h
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/10/27.
//  Copyright © 2015年 Unique. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SPNavigationBarStyle) {
    SPNavigationBarStyleLight,
    SPNavigationBarStyleDark,
};

@interface UINavigationBar (SPNavigationBar)

- (void)setSPNavigationBarStyle:(SPNavigationBarStyle)style;

@end
