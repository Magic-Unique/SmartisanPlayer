//
//  SPNavigationController.m
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/9/17.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPNavigationController.h"

#import "UINavigationBar+SPNavigationBar.h"
//#import "SPPlayViewController.h"

@interface SPNavigationController ()

@property (nonatomic, strong) UIBarButtonItem *playViewItem;

@end

@implementation SPNavigationController

#pragma mark - UINavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setSPNavigationBarStyle:SPNavigationBarStyleLight];
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:12];
    
    attributes[NSStrokeColorAttributeName] = [UIColor colorWithRed:0.396 green:0.404 blue:0.427 alpha:1.000];
    [self.tabBarItem setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    attributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [self.tabBarItem setTitleTextAttributes:attributes forState:UIControlStateSelected];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.navigationItem.rightBarButtonItem = self.playViewItem;
    if (animated) {
        viewController.navigationItem.leftBarButtonItem = self.backViewItem;
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)showPlayViewController {
//    [SPPlayViewController showPlayViewControllerBellowTarget:self completion:nil];
}

#pragma mark - 私有方法

- (void)popViewController {
    [self popViewControllerAnimated:YES];
}

- (UIBarButtonItem *)playViewItem {
    if (!_playViewItem) {
        UIButton *button = [[UIButton alloc] init];
        [button addTarget:self action:@selector(showPlayViewController) forControlEvents:UIControlEventTouchUpInside];
        button.imageForDeselectNormal = [UIImage imageNamed:@"btn_bluecd"];
        button.imageForDeselectHighlighted = [UIImage imageNamed:@"btn_bluecd_down"];
        [button sizeToFit];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
        _playViewItem = item;
    }
    return _playViewItem;
}

- (UIBarButtonItem *)backViewItem {
    UIButton *button = [UIButton new];
    [button addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    button.titleForDeselectNormal                   =   @"返回";
    button.titleColorForDeselectNormal              =   APP_COLOR_SUB_TITLE;
    button.titleColorForDeselectHighlighted         =   APP_COLOR_HIGHLIGHTED;
    button.backgroundImageForDeselectNormal         =   [UIImage imageNamed:@"btn_back.9"];
    button.backgroundImageForDeselectHighlighted    =   [UIImage imageNamed:@"btn_back_down.9"];
    [button sizeToFit];
    button.width += 25;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return item;
}


@end
