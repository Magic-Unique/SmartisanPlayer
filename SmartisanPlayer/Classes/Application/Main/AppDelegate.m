//
//  AppDelegate.m
//  SmartisanPlayer
//
//  Created by 吴双 on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "AppDelegate.h"

#import "SPTabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [SPTabBarViewController new];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
