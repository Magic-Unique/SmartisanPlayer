//
//  SPTableView.m
//  SmartisanPlayer
//
//  Created by 吴双 on 15/10/5.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPTableView.h"

@interface SPTableView ()

@end

@implementation SPTableView

- (instancetype)initWithStyle:(UITableViewStyle)style blankView:(SPBlankView *)blankView {
    self = [super initWithFrame:Screen_Bounds style:style];
    if (self) {
        if (style == UITableViewStyleGrouped) {
            self.separatorStyle = UITableViewCellSeparatorStyleNone;
        }
        self.backgroundView = blankView;
        self.backgroundColor = [UIColor colorWithRed:0.961 green:0.965 blue:0.973 alpha:1.000];
        UIView *emptyView = [UIView new];
        self.tableHeaderView = emptyView;
        self.tableFooterView = emptyView;
    }
    return self;
}

- (void)reloadData {
    [self refreshBlankView];
    [super reloadData];
}

- (void)setBlankView:(SPBlankView *)blankView {
    blankView.hidden = self.backgroundView.hidden;
    self.backgroundView = blankView;
}

- (SPBlankView *)blankView {
    return (SPBlankView *)self.backgroundView;
}

- (void)refreshBlankView {
    NSInteger sections = [self.dataSource numberOfSectionsInTableView:self];
    NSInteger count = 0;
    for (int s = 0; s < sections; s++) {
        count += [self.dataSource tableView:self numberOfRowsInSection:s];
    }
    self.backgroundView.hidden = count;
}

@end
