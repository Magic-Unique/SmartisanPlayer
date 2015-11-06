//
//  SPTableView.h
//  SmartisanPlayer
//
//  Created by 吴双 on 15/10/5.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPBlankView.h"

@class SPBlankView;

@interface SPTableView : UITableView

@property (nonatomic, strong) SPBlankView *blankView;

- (instancetype)initWithStyle:(UITableViewStyle)style blankView:(SPBlankView *)blankView;

@end
