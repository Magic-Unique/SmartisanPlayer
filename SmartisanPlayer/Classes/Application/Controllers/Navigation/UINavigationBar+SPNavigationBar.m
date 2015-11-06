//
//  UINavigationBar+SPNavigationBar.m
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/10/27.
//  Copyright © 2015年 Unique. All rights reserved.
//

#import "UINavigationBar+SPNavigationBar.h"

@implementation UINavigationBar (SPNavigationBar)

- (void)setSPNavigationBarStyle:(SPNavigationBarStyle)style {
    self.translucent = NO;
    self.size = CGSizeMake(Screen_Width, 64);
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:17];
    attributes[NSForegroundColorAttributeName] = APP_COLOR_MAIN_TITLE;
    
    [self setTitleTextAttributes:attributes];
    
    if (style == SPNavigationBarStyleLight) {
        self.barStyle = UIBarStyleDefault;
        [self setBackgroundImage:[UIImage imageNamed:@"titlebar_bg"] forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:[UIImage imageNamed:@"titlebar_bg_shadow"]];
    } else {
        self.barStyle = UIBarStyleBlackOpaque;
        [self setBackgroundImage:[UIImage imageNamed:@"titlebar_playing_bg"] forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:[UIImage imageNamed:@"titlebar_playing_shadow"]];
    }
}

@end
