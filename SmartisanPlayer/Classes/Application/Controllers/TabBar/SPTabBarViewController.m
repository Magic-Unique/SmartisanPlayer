//
//  SPTabBarViewController.m
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/9/17.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPTabBarViewController.h"

//View document
#import "SPTabBar.h"

//Controller document
#import "SPNavigationController.h"

@interface SPTabBarViewController ()

@end

@implementation SPTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setValue:[SPTabBar new] forKey:@"tabBar"];
    NSString *tabbarPath = [[NSBundle mainBundle] pathForResource:@"TabBar" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:tabbarPath];
    for (NSDictionary *item in array) {
        Class c = NSClassFromString(item[@"class"]);
        [self add:[c new] imageName:item[@"image"] title:item[@"title"]];
    }
}

- (void)add:(UIViewController *)viewController imageName:(NSString *)imageName title:(NSString *)title {
    SPNavigationController *navi = [[SPNavigationController alloc] initWithRootViewController:viewController];
    NSString *normalName = [NSString stringWithFormat:@"tabbar_%@", imageName];
    NSString *selectedName = [NSString stringWithFormat:@"tabbar_%@_down", imageName];
    navi.tabBarItem.image = [[UIImage imageNamed:normalName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navi.tabBarItem.selectedImage = [[UIImage imageNamed:selectedName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.title = title;
    [self addChildViewController:navi];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    SPTabBar *bar = (SPTabBar *)tabBar;
    [bar setSelectedIndex:[bar.items indexOfObject:item]];
}

@end
