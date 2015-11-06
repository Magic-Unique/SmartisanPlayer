//
//  SPTableViewController.m
//  SmartisanPlayer
//
//  Created by 吴双 on 15/9/20.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPTableViewController.h"



@interface SPTableViewController () 
{
    UITableViewStyle _style;
    
    SPTopView *_topView;
    SPBlankView *_blankView;
    SPTableView *_tableView;
}

@end

@implementation SPTableViewController

#pragma mark - 生命周期

- (instancetype)initWithStyle:(UITableViewStyle)style topView:(SPTopView *)topVeiw blankView:(SPBlankView *)blankView {
    self = [super init];
    if (self) {
        _style = style;
        _topView = topVeiw;
        _topView.size = CGSizeMake(Screen_Width, 40);
        _blankView = blankView;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.topView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat topHeight = self.topView ? 40 : 0;
    CGFloat height = self.view.height;
    CGFloat naviHeight = self.topLayoutGuide.length;
    CGFloat tabBarHeight = self.bottomLayoutGuide.length;
    CGFloat tableHeight = height - topHeight - naviHeight - tabBarHeight;
    self.topView.midX = self.view.midPoint.x;
    self.topView.minY = 0;
    self.tableView.height = tableHeight;
    self.tableView.minY = topHeight;
}

#pragma mark - table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (SPTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifier";
    SPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[SPTableViewCell alloc] initWithReuseIdentifier:identifier];
    }
    return cell;
}

#pragma mark - 懒加载

- (SPTableView *)tableView {
    if (!_tableView) {
        _tableView = [[SPTableView alloc] initWithStyle:_style blankView:_blankView];
        _tableView.frame = self.view.frame;
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

@end
