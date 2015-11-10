//
//  SPCloudController.m
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/9/18.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPCloudController.h"

#import "SPCloudArtistType.h"

#import "SPSearchController.h"
#import "SPHotPlayerListController.h"

#import "SPSearchBar.h"
#import "SPSourceView.h"
#import "SPCloudCell.h"

#import "SPBaiduRequest.h"
//#import "SPSearchHotRespond.h"

typedef enum : NSUInteger {
    UITableViewCellStateSingle,
    UITableViewCellStateUp,
    UITableViewCellStateMid,
    UITableViewCellStateBottom
} UITableViewCellState;

@interface SPCloudController () <SPSearchBarDelegate>

@property (nonatomic, strong) NSArray *tableData;

@property (nonatomic, strong, readonly) SPSearchBar *searchBar;

@end

@implementation SPCloudController

- (instancetype)init {
    self = [super initWithStyle:UITableViewStyleGrouped topView:[SPSearchBar new] blankView:nil];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    self.searchBar.width = self.view.width;
    self.searchBar.height = 40;
    
    SPSourceView *header = [[SPSourceView alloc] initWithTitle:@"内容由百度音乐提供"];
    header.height = 60;
    self.tableView.tableHeaderView = header;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

/*
-(void)keyboardShow:(NSNotification *)notification{
    [SPRequest requestSearchHot:12 succeed:^(SPSearchHotRespond *respond) {
        [self.searchBar showHotSearch:respond.result withKeyboardUserInfo:notification.userInfo];
    } failed:nil];
}

-(void)keyboardHide:(NSNotification *)notification{
}
 */

#pragma mark - Table view data source

- (UITableViewCellState)cellStateForIndexPath:(NSIndexPath *)indexPath {
    NSInteger rows = [self tableView:self.tableView numberOfRowsInSection:indexPath.section];
    if (rows == 1) {
        return UITableViewCellStateSingle;
    }
    if (indexPath.row == 0) {
        return UITableViewCellStateUp;
    }
    if (indexPath.row == rows - 1) {
        return UITableViewCellStateBottom;
    }
    return UITableViewCellStateMid;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tableData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = self.tableData[section];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifier";
    SPCloudCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[SPCloudCell alloc] initWithReuseIdentifier:identifier];
    }
    [self setCell:cell backgroundWithIndexPath:indexPath];
    NSString *title = self.tableData[indexPath.section][indexPath.row][@"title"];
    cell.textLabel.text = [NSString stringWithFormat:@"   %@", title];
    return cell;
}

- (void)setCell:(UITableViewCell *)cell backgroundWithIndexPath:(NSIndexPath *)indexPath {
    UITableViewCellState state = [self cellStateForIndexPath:indexPath];
    UIImageView *imageView = (UIImageView *)cell.backgroundView;
    UIImageView *selectedImageView = (UIImageView *)cell.selectedBackgroundView;
    NSString *imageName = [NSString stringWithFormat:@"list_item4_%d", (int)state];
    NSString *selectedImageName = [NSString stringWithFormat:@"list_item4_%d_down", (int)state];
    imageView.image = [UIImage imageNamed:imageName];
    selectedImageView.image = [UIImage imageNamed:selectedImageName];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.searchBar textFieldResignFirstResponder];
    NSDictionary *artistType = self.tableData[indexPath.section][indexPath.row];
    SPHotPlayerListController *controller = [[SPHotPlayerListController alloc] initWithArtistTypeDictionary:artistType];
    controller.title = artistType[@"title"];
    [self.navigationController pushViewController:controller animated:YES];
}

- (SPSearchBar *)searchBar {
    return (SPSearchBar *)self.topView;
}

#pragma mark - scroll view delegate {

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.searchBar textFieldResignFirstResponder];
}

#pragma mark - search bar delegate

- (void)searchBarPressReturnWithText:(NSString *)text {
    SPSearchController *controller = [[SPSearchController alloc] initWithQuery:text];
    controller.title = [NSString stringWithFormat:@"搜索\"%@\"", text];
    [self.navigationController pushViewController:controller animated:YES];
}

- (NSArray *)tableData {
    if (!_tableData) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ArtistType" ofType:@"plist"];
        _tableData = [NSArray arrayWithContentsOfFile:path];
    }
    return _tableData;
}

@end
