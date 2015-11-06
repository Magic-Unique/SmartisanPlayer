//
//  SPTableViewController.h
//  SmartisanPlayer
//
//  Created by 吴双 on 15/9/20.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPTableView.h"
#import "SPTableViewCell.h"
#import "SPTopView.h"

@interface SPTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong, readonly) SPTopView *topView;
@property (nonatomic, strong, readonly) SPTableView *tableView;
@property (nonatomic, strong, readonly) SPBlankView *blankView;



- (instancetype)initWithStyle:(UITableViewStyle)style topView:(SPTopView *)topVeiw blankView:(SPBlankView *)blankView;

@end
