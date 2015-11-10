//
//  SPSearchController.m
//  SmartisanPlayer
//
//  Created by 吴双 on 15/9/20.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPSearchController.h"
//#import "SPPlayViewController.h"
//#import "SPDownloadController.h"

#import "SPBaiduSearchMergeRequest.h"
//#import "SPPlayList.h"

#import "MBProgressHUD+MJ.h"
#import "SPSearchSongCell.h"
//#import "SPDownloadManager.h"

#import <MJRefresh.h>

static SPBlankView *songBlankView;
static SPBlankView *albumBlankView;
static SPBlankView *artistBlankView;

#define Search_Page_Size 14


@interface SPSearchController () <SPSearchSongCellDelegate>

@property (nonatomic, strong) NSString *keyword;

@property (nonatomic, strong) NSMutableArray<SPBaiduSearchMergeSong *> *songs;

@property (nonatomic, assign) NSUInteger resultCount;


@end

@implementation SPSearchController

+ (void)initialize {
    artistBlankView =   [[SPBlankView alloc] initWithImage:[UIImage imageNamed:@"blank_artist"] title:@"搜索不到艺术家结果" message:@""];
    albumBlankView  =   [[SPBlankView alloc] initWithImage:[UIImage imageNamed:@"blank_album"] title:@"搜索不到专辑结果" message:@""];
    songBlankView   =   [[SPBlankView alloc] initWithImage:[UIImage imageNamed:@"blank_song"] title:@"搜索不到歌曲结果" message:@""];
}

- (instancetype)initWithQuery:(NSString *)query {
    self = [super initWithStyle:UITableViewStylePlain topView:nil blankView:nil];
    if (self) {
        self.keyword = query;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self search];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(searchMore)];
}

#pragma mark - Search

- (void)search {
    [MBProgressHUD showMessage:@"搜索中..."];
    [SPBaiduSearchMergeRequest searchMergeWithQuery:self.query pageNumber:1 pageSize:Search_Page_Size completed:^(SPBaiduSearchMergeRespond *respond) {
        [MBProgressHUD hideHUD];
        if (!respond) {
            self.songs = nil;
        } else {
            self.resultCount = [respond.result.song_info.total unsignedIntValue];
            self.songs = [NSMutableArray arrayWithArray:respond.result.song_info.song_list];
        }
        [self.tableView reloadData];
    }];
}

- (void)searchMore {
    NSLog(@"%lu", self.songs.count);
    NSLog(@"%lu", self.songs.count/Search_Page_Size + 1);
    [SPBaiduSearchMergeRequest searchMergeWithQuery:self.query pageNumber:self.songs.count/Search_Page_Size + 1 pageSize:Search_Page_Size completed:^(SPBaiduSearchMergeRespond *respond) {
        if (respond) {
            if (respond.result.song_info) {
                self.resultCount = [respond.result.song_info.total unsignedIntegerValue];
                [self.songs addObjectsFromArray:respond.result.song_info.song_list];
            } else {
                [self.tableView.mj_footer setState:MJRefreshStateNoMoreData];
            }
            
        }
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.songs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self songCellForIndexPath:indexPath];
}

- (SPSearchSongCell *)songCellForIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"song";
    SPSearchSongCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[SPSearchSongCell alloc] initWithReuseIdentifier:identifier];
        cell.delegate = self;
    }
    cell.song = self.songs[indexPath.row];
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    SPBaiduSearchMergeSong *song = self.songs[indexPath.row];
//    SPPlayList *playList = [[SPPlayList alloc] initWithSongId:song.songid];
//    SPPlayViewController *playViewController = [SPPlayViewController sharedController];
//    [SPPlayViewController showPlayViewControllerBellowTarget:self completion:^{
//        [playViewController setPlayListAndPlayFristSong:playList];
//    }];
}

- (void)songCellDidClickDownloadButton:(SPSearchSongCell *)cell {
//    [[SPDownloadManager sharedManager] addSongFileTaskForSongId:cell.song.songid];
//    [self.navigationController pushViewController:[SPDownloadController sharedController] animated:YES];
}

#pragma mark - Method for Selector

//- (void)loadMoreButtonClick:(SPSearchLoadMoreButton *)loadMoreButton {
//    loadMoreButton.state = SPSearchLoadMoreButtonStateLoading;
//}

#pragma mark - property lazy load

- (NSString *)query {
    return self.keyword;
}

@end
